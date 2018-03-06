package forum.app.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import forum.app.dao.model.Candidat;
import forum.app.dao.model.ChoixCandidat;
import forum.app.dao.model.ChoixEntreprise;
import forum.app.dao.model.Entreprise;
import forum.app.dao.util.PersistenceUtil;

public class ChoixCandidatDao {

	private EntityManager em;

	public void prepareEntityManagerForTransaction() {
		if (em == null) {
			em = PersistenceUtil.getEntityManager();
		}
	}

	@SuppressWarnings("unchecked")
	public List<ChoixCandidat> getByIdCandidat(int idC) {
		prepareEntityManagerForTransaction();
		return em.createQuery("SELECT c FROM ChoixCandidat c WHERE c.choixCandidatPK.idCandidat = :idCandidat ORDER BY c.priorite desc").setParameter("idCandidat", idC).getResultList();
	}

	public List<ChoixCandidat> getAll() {
		prepareEntityManagerForTransaction();
		Query query = em.createQuery("SELECT c FROM ChoixCandidat c");
		return (ArrayList<ChoixCandidat>) query.getResultList();
	}
	
	public List<ChoixCandidat> getAllTriCroissantCandidat(int idCandidat) {
		prepareEntityManagerForTransaction();
		Query query = em.createQuery("SELECT c FROM ChoixCandidat c WHERE c.choixCandidatPK.idCandidat =:idCandidat ORDER BY priorite");
		query.setParameter("idCandidat", idCandidat);
		return (ArrayList<ChoixCandidat>) query.getResultList();
	}

	public List<Entreprise> getEntrepriseNonChoisi(int idCandidat) {
		prepareEntityManagerForTransaction();
		Query query = em.createQuery("SELECT e FROM Entreprise e WHERE e.idEntreprise NOT IN (SELECT cc.choixCandidatPK.idEntreprise FROM ChoixCandidat cc WHERE cc.choixCandidatPK.idCandidat =:idCandidat)");
		query.setParameter("idCandidat", idCandidat);
		return new ArrayList<Entreprise>(query.getResultList());
	}
	
	public void removeChoixCandidat(ChoixCandidat choixCandidat) {
		prepareEntityManagerForTransaction();
		em.getTransaction().begin();
		if (choixCandidat != null) {
			em.remove(choixCandidat);
		}
		em.getTransaction().commit();
	}

	public ChoixCandidat createChoixCandidat(int idCandidat, int idEntreprise, int priorite) {
		prepareEntityManagerForTransaction();
		em.getTransaction().begin();
		ChoixCandidat choixCandidat = new ChoixCandidat(idCandidat, idEntreprise);
                choixCandidat.setPriorite(priorite);
		em.persist(choixCandidat);
		em.getTransaction().commit();
		return choixCandidat;
	}

	public ChoixCandidat createChoixCandidat(ChoixCandidat c) {
		prepareEntityManagerForTransaction();
		em.getTransaction().begin();
		em.persist(c);
		em.getTransaction().commit();
		return c;
	}

	public ChoixCandidat updateCandidat(ChoixCandidat c) {
		prepareEntityManagerForTransaction();
		em.getTransaction().begin();
		em.merge(c);
		em.getTransaction().commit();
		return c;
	}
	
	public void deleteAllCandidat(int idCandidat) {
		prepareEntityManagerForTransaction();
		Query query = em.createQuery("DELETE FROM ChoixCandidat c WHERE id_candidat =:idCandidat");
		query.setParameter("idCandidat", idCandidat);
		em.getTransaction().begin();
		query.executeUpdate();
		em.getTransaction().commit();
	}
	
	public ChoixCandidat getByIdEntrepriseIdCandidat(int idE, int idC) {
		prepareEntityManagerForTransaction();
		Query query = em.createQuery("SELECT c FROM ChoixCandidat c WHERE c.entreprise.idEntreprise = :idE AND c.candidat.idCandidat = :idC");
		query.setParameter("idE", idE);
		query.setParameter("idC", idC);
		return (ChoixCandidat) query.getSingleResult();
	}

}
