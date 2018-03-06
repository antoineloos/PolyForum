package forum.app.dao.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import forum.app.dao.model.Candidat;
import forum.app.dao.model.Entretien;
import forum.app.dao.util.PersistenceUtil;

public class EntretienDao {
	// http://www.tugay.biz/2015/08/example-with-jpa-servlet-jetty-mysql.html
	
	private EntityManager em;
	
	public void prepareEntityManagerForTransaction(){
		if (em == null){
			em = PersistenceUtil.getEntityManager();
		}
	}

	public Entretien getById(int idC, int idE) {
		prepareEntityManagerForTransaction();
		List listeEntretiens = em.createQuery(
		        "SELECT e FROM Entretien e WHERE e.idCandidat = :idC AND e.idEntreprise = :idE")
		        .setParameter("idC", idC)
		        .setParameter("idE", idE)
		        .getResultList();
		
		return (Entretien) listeEntretiens.get(0);
	}
	
	public List<Entretien> getByIdEntreprise(int idE) {
		prepareEntityManagerForTransaction();
		List listeEntretiens = em.createQuery(
		        "SELECT e FROM Entretien e WHERE e.idEntreprise = :idE")
		        .setParameter("idE", idE)
		        .getResultList();
		
		return listeEntretiens;
	}
	

	public Entretien updateEntretien(Entretien e) {
		prepareEntityManagerForTransaction();
		em.getTransaction().begin();
		em.merge(e);
		em.getTransaction().commit();
		return e;
	}
	
	public List<Entretien> getByIdCandidat(int idC) {
		prepareEntityManagerForTransaction();
		List listeEntretiens = em.createQuery(
		        "SELECT e FROM Entretien e WHERE e.idCandidat = :idC")
		        .setParameter("idC", idC)
		        .getResultList();
		
		return listeEntretiens;
	}
	
	public List<Entretien> getByIdSalle(int idS) {
		prepareEntityManagerForTransaction();
		List listeEntretiens = em.createQuery(
		        "SELECT e FROM Entretien e WHERE e.idSalle = :idS")
		        .setParameter("idS", idS)
		        .getResultList();
		
		return listeEntretiens;
	}
	
	@SuppressWarnings("unchecked")
	public List<Entretien> getAll() {
		prepareEntityManagerForTransaction();
		Query query = em.createQuery("SELECT c FROM Entretien c");
		return (ArrayList<Entretien>) query.getResultList();
	}
	
	public void removeEntretien(Entretien entretien) {
		prepareEntityManagerForTransaction();
		em.getTransaction().begin();
	    if (entretien != null) {
	      em.remove(entretien);
	    }
		em.getTransaction().commit();
	  }
	
	public int getNbEntretiensEnCours(Date heureATester, int idSalle) {
		prepareEntityManagerForTransaction();
		em.getTransaction().begin();
		Query query = em.createQuery("SELECT COUNT(*) FROM Entretien e WHERE id_salle =:idSalle "
				+ "AND heure <=:heureATester AND heure_fin >=:heureATester)");
		query.setParameter("heureATester", heureATester);
		query.setParameter("idSalle", idSalle);
		return (int) (long) query.getSingleResult();
	}
	
	public Entretien createEntretien(Entretien e) {
		prepareEntityManagerForTransaction();
		em.getTransaction().begin();
	    em.persist(e);
		em.getTransaction().commit();
	    return e;
	  }
	
	@SuppressWarnings("unchecked")
	public List<Entretien> getEntretienParCreneauPourCandidat(Timestamp dateDebut, Timestamp dateFin, int idC){
		prepareEntityManagerForTransaction();
		Query query = em.createQuery("SELECT c FROM Entretien c where id_candidat = :idC and CAST(:dateDebut AS time) > heure and CAST(:dateDebut AS time) < heure_fin and CAST(:dateFin AS time) > heure and CAST(:dateFin AS time) < heure_fin");
		query.setParameter("idC", idC);
		query.setParameter("dateDebut", dateDebut.toString());
		query.setParameter("dateFin", dateFin.toString());
		return (ArrayList<Entretien>) query.getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<Entretien> getEntretienParCreneauPourEntreprise(Timestamp dateDebut, Timestamp dateFin, int idE){
		prepareEntityManagerForTransaction();
		Query query = em.createQuery("SELECT c FROM Entretien c where id_entreprise = :idE and CAST(:dateDebut AS time) > heure and CAST(:dateDebut AS time) < heure_fin and CAST(:dateFin AS time) > heure and CAST(:dateFin AS time) < heure_fin");
		query.setParameter("idE", idE);
		query.setParameter("dateDebut", dateDebut.toString());
		query.setParameter("dateFin", dateFin.toString());
		return (ArrayList<Entretien>) query.getResultList();
	}
	
}
