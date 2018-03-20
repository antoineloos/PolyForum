package forum.app.planning;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import forum.app.dao.model.Candidat;
import forum.app.dao.model.ChoixCandidat;
import forum.app.dao.model.ChoixEntreprise;
import forum.app.dao.model.Entreprise;
import forum.app.dao.impl.CandidatDao;
import forum.app.dao.impl.ChoixCandidatDao;
import forum.app.dao.impl.ChoixEntrepriseDao;
import forum.app.dao.impl.DaoFactory;
import forum.app.dao.impl.EntrepriseDao;
import forum.app.dao.util.Constantes;

public class Plannification {

	private List<Priorite> result = new ArrayList<Priorite>();
	ChoixEntrepriseDao choixEntrepriseDao;
	ChoixCandidatDao choixCandidatDao;
	CandidatDao candidatDao ;
	EntrepriseDao entrepriseDao;

	public Map<Integer, Integer> genererPlanning () throws Exception {
            
		choixEntrepriseDao = (ChoixEntrepriseDao) DaoFactory.getDaoInstance(Constantes.CHOIX_ENTREPRISE);
		choixCandidatDao = (ChoixCandidatDao) DaoFactory.getDaoInstance(Constantes.CHOIX_CANDIDAT);
		candidatDao = (CandidatDao) DaoFactory.getDaoInstance(Constantes.CANDIDAT);
		entrepriseDao = (EntrepriseDao) DaoFactory.getDaoInstance(Constantes.ENTREPRISE);

		// on récupère la liste des choix des candidats et des entreprises
		List<ChoixCandidat> listeChoixCandidat = choixCandidatDao.getAll();
		List<ChoixEntreprise> listeChoixEntreprise = choixEntrepriseDao.getAll();

		for (ChoixEntreprise ce : listeChoixEntreprise) {
			if (candidatEtEntrepriseDispo(ce.getChoixEntreprisePK().getIdEntreprise(), ce.getChoixEntreprisePK().getIdCandidat())){
				Priorite p = new Priorite(ce.getChoixEntreprisePK().getIdEntreprise(), ce.getChoixEntreprisePK().getIdCandidat(), ce.getPriorite(), true, ce.getTempsVoulu());
				addToResult(p);
			}
		}
		// les choix des entreprise ont étés ajoutées à la liste

		
		for (ChoixCandidat cc : listeChoixCandidat) {
			if (candidatEtEntrepriseDispo(cc.getChoixCandidatPK().getIdEntreprise(), cc.getChoixCandidatPK().getIdCandidat())){
				Priorite p = new Priorite(cc.getChoixCandidatPK().getIdEntreprise(), cc.getChoixCandidatPK().getIdCandidat(), cc.getPriorite(), false, 0);
				addToResult(p);
			}
		}
		
		Collections.sort(result);
		afficherResult();
		Repartition rep = new Repartition();
		return rep.repartir(result);
		
	}
	
	public boolean candidatEtEntrepriseDispo(int idEntreprise, int idCandidat){
		Entreprise ent = entrepriseDao.getById(idEntreprise);
		Candidat can = candidatDao.getById(idCandidat);
		return  (ent.getPresent() && can.getPresent());
	}
	
	public void addToResult(Priorite p){
		Priorite test = contient(p);
		if(test == null && p.isEntreprise()){
			result.add(p);
		} else if (test != null) {
			test.setPriorite(test.getPriorite() + p.getPriorite());
		}
	}
	
	public Priorite contient(Priorite p){
		for (Priorite prio : result){
			if (prio.getIdEntreprise() == p.getIdEntreprise() && prio.getIdCandidat() == p.getIdCandidat()){
				return prio;
			}
		}
		return null;
	}
	
	public void afficherResult(){
		System.out.println("----- RESULT FOUND -----");
		int lastId = -1;
		for (Priorite p : result) {
			if (lastId != p.getIdEntreprise()){
				System.out.println("Pour l'entreprise : " + p.getIdEntreprise());
			}
			System.out.println("    Le candidat : " + p.getIdCandidat() + " priorite : " + p.getPriorite());
			lastId = p.getIdEntreprise();
		}
	}
	
	
}
