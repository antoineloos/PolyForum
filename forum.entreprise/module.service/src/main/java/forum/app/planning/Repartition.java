package forum.app.planning;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import forum.app.dao.model.Entreprise;
import forum.app.dao.model.Entretien;
import forum.app.dao.model.Salle;
import forum.app.dao.impl.CandidatDao;
import forum.app.dao.impl.DaoFactory;
import forum.app.dao.impl.EntrepriseDao;
import forum.app.dao.impl.EntretienDao;
import forum.app.dao.impl.SalleDao;
import forum.app.dao.model.EntretienPK;
import forum.app.dao.util.Constantes;

public class Repartition {

	private List<Salle> salles = new ArrayList<Salle>();

	public EntretienDao entretienDao;
	public EntrepriseDao entrepriseDao;
	public CandidatDao candidatDao;
	public SalleDao salleDao;

	Map<Integer, Integer> correspSalle = new HashMap<Integer, Integer>();

	private List<Creneau> result = new ArrayList<Creneau>();
	private Date premierCreneau = null;

	public Map<Integer, Integer> repartir(List<Priorite> tab) throws Exception {
		init();
		
		for (Priorite p : tab) {
			int idEnt = p.getIdEntreprise();
			int idEtu = p.getIdCandidat();

			List<Creneau> creneauOccupe = initCreneaux();
			creneauOccupe.addAll(getCreneauForCandidat(idEtu));
			creneauOccupe.addAll(getCreneauForEntreprise(idEnt));

			if (creneauOccupe.size() == 1) {
				Timestamp heureDeFin = getHeureDeFin(premierCreneau.getTime(), p.getDuree());
				Creneau c = new Creneau(idEnt, idEtu, premierCreneau.getTime(), heureDeFin.getTime());
				result.add(c);
			} else {
				Timestamp datePossibleDebut = null;
				Timestamp datePossibleFin = null;
				boolean bool = false;
				for (Creneau c : creneauOccupe) {
					if (!bool){
						datePossibleDebut = new Timestamp(c.getFin());
						datePossibleFin = new Timestamp(getHeureDeFin(datePossibleDebut.getTime(), p.getDuree()).getTime());
						bool = verifier(creneauOccupe, datePossibleDebut.getTime(),datePossibleFin.getTime());
					}
				}
				Creneau c = new Creneau(idEnt, idEtu, datePossibleDebut.getTime(), datePossibleFin.getTime());
				result.add(c);
				creneauOccupe.clear();
			}
		}

		createEntretienFromResult();
		System.out.println("FIN !!!");
		return correspSalle;
	}

	public List<Creneau> initCreneaux() throws Exception {
		try {
		List<Creneau> creneauxOccupes = new ArrayList<Creneau>();
		Creneau creneauInit = new Creneau();
		SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
		String fechaStr1 = "13:59:00";
		String fechaStr2 = "14:00:00";
		creneauInit.setDebut(format.parse(fechaStr1).getTime());
		creneauInit.setFin(format.parse(fechaStr2).getTime());
		creneauxOccupes.add(creneauInit);
		return creneauxOccupes;
		} catch (Exception e) {
			throw new Exception("Erreur lors de la création du créneau !");
		}
	}
	
	public boolean isDateAvailable(List<Creneau> creneauOccupe, long debutVoulu, long finVoulue) {
		for (Creneau c : creneauOccupe) {
			long debutOccupe = c.getDebut();
			long finOccupe = c.getFin();
			if (debutOccupe > debutVoulu && finOccupe < finVoulue) {
				// s'il y a un creneau entre les dates de debut et de fin voulues
				return false;
			}
			if (debutOccupe == debutVoulu) {
				// si les créneaux se chevauchent
				return false;
			}
			if (debutOccupe < debutVoulu && finOccupe > finVoulue){
				return false;
			}
			if (debutOccupe > debutVoulu && finOccupe > finVoulue){
				return false;
			}
		}
		return true;
	}
	
	public boolean verifier(List<Creneau> creneauOccupe, long debutVoulu, long finVoulue){
		Creneau creneauVoulu = new Creneau();
		creneauVoulu.setDebut(debutVoulu);
		creneauVoulu.setFin(finVoulue);
		boolean ok = true;
		for (Creneau c : creneauOccupe){
			long d = c.getDebut();
			long f = c.getFin();
			if (isSup(f, finVoulue)){
				if (isSup(finVoulue, d)){
					// d < finVoulue < f
					ok = false;
				} else {
					// d < f < finVoulue 
					// rien a faire
				}
			}
			if (isSup(debutVoulu, d)){
				if (isSup(f,debutVoulu)){
					// d < debutVoulu < f
					ok = false;
				} else {
					// d < f < debutVoulu 
					// rien a faire
				}
			}
			if(d == debutVoulu){
				ok = false;
			}
			if(f == finVoulue){
				ok = false;
			}
			
		}
		return (ok);
	}
	
	public boolean isSup(long x, long y){
		return x > y;
	}

	public Timestamp getHeureDeFin(long dateInitiale, int duree) {
		return new Timestamp(dateInitiale + (duree * 60000));
	}

	public boolean isOver(List<Priorite> tab) {
		for (Priorite p : tab) {
			if (p.getPriorite() != 0) {
				return false;
			}
		}
		return true;
	}

	public List<Creneau> getCreneauForEntreprise(int idEntreprise) {
		List<Creneau> resultToReturn = new ArrayList<Creneau>();
		for (Creneau c : result) {
			if (c.getIdEntreprise() == idEntreprise) {
				resultToReturn.add(c);
			}
		}
		return resultToReturn;
	}

	public List<Creneau> getCreneauForCandidat(int idCandidat) {
		List<Creneau> resultToReturn = new ArrayList<Creneau>();
		for (Creneau c : result) {
			if (c.getIdCandidat() == idCandidat) {
				resultToReturn.add(c);
			}
		}
		return resultToReturn;
	}

	public void printAllCreneau(List<Creneau> liste) {
		for (Creneau c : liste) {
			c.print();
		}
	}
	
	public void createEntretienFromResult() {
		for (Creneau c : result) {
			createEntretien(c);
		}
	}
	
	public void createEntretien(Creneau c){
		Entretien e = new Entretien(new EntretienPK(c.getIdEntreprise(), c.getIdCandidat()), new Timestamp(c.getDebut()), new Timestamp(c.getFin()));
             
                e.setIdSalle(correspSalle.get(c.getIdEntreprise()).toString());
		entretienDao.createEntretien(e);
	}

	public void init() throws Exception {
		SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
		String fechaStr = "14:00:00";
		try {
			premierCreneau = format.parse(fechaStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		entretienDao = (EntretienDao) DaoFactory.getDaoInstance(Constantes.ENTRETIEN);
		entrepriseDao = (EntrepriseDao) DaoFactory.getDaoInstance(Constantes.ENTREPRISE);
		candidatDao = (CandidatDao) DaoFactory.getDaoInstance(Constantes.CANDIDAT);
		salleDao = (SalleDao) DaoFactory.getDaoInstance(Constantes.SALLE);

		// on recupère l'ensemble des salles
		salles = salleDao.getAll();
		// on associe à chaque entreprise une salle qui lui est propre
		associerSalleEntreprise();
	}

	public void associerSalleEntreprise() throws Exception {
		try {
			for (Entreprise e : entrepriseDao.getAll()) {
				int idSalle = getFirstIdSalle();
				correspSalle.put(e.getIdEntreprise(), idSalle);
				salleDao.updateCapacite(idSalle);
			}
		} catch (Exception e){
			throw new Exception("Un problème est survenu. Vérifiez que les capacités des salles soient correctes.");
		}
	}

	public int getFirstIdSalle() {
		for (Salle s : salles) {
			if (s.getDisponible() && capaciteOk(s)) {
				return s.getIdSalle();
			}
		}
		return -1;
	}

	public boolean capaciteOk(Salle s) {
		return s.getCapacite() > 0;
	}

}
