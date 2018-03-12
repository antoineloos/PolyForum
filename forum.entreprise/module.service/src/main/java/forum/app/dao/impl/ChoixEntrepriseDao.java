package forum.app.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import forum.app.dao.model.Candidat;
import forum.app.dao.model.ChoixCandidat;
import forum.app.dao.model.ChoixEntreprise;
import forum.app.dao.util.PersistenceUtil;

public class ChoixEntrepriseDao {

	private EntityManager em;

	public void prepareEntityManagerForTransaction() {
		if (em == null) {
			em = PersistenceUtil.getEntityManager();
		}
	}

	@SuppressWarnings("unchecked")
	public List<ChoixEntreprise> getByIdEntreprise(int idE) {
		prepareEntityManagerForTransaction();
		return em.createQuery("SELECT c FROM ChoixEntreprise c WHERE c.choixEntreprisePK.idEntreprise = :idE ORDER BY c.priorite desc").setParameter("idE", idE).getResultList();
	}

	public ChoixEntreprise getByIdEntrepriseIdCandidat(int idE, int idC) {
		prepareEntityManagerForTransaction();
		Query query = em.createQuery("SELECT c FROM ChoixEntreprise c WHERE c.choixEntreprisePK.idEntreprise = :idE AND c.choixEntreprisePK.idCandidat = :idC");
		query.setParameter("idE", idE);
		query.setParameter("idC", idC);
		return (ChoixEntreprise) query.getSingleResult();
	}
	
	public List<ChoixEntreprise> getAll() {
		prepareEntityManagerForTransaction();
		Query query = em.createQuery("SELECT c FROM ChoixEntreprise c");
		return new ArrayList<ChoixEntreprise>(query.getResultList());
	}
	
	public List<Candidat> getCandidatNonChoisi(int idEntreprise) {
		prepareEntityManagerForTransaction();
		Query query = em.createQuery("SELECT c FROM Candidat c WHERE c.idCandidat NOT IN (SELECT ce.choixEntreprisePK.idCandidat FROM ChoixEntreprise ce WHERE ce.choixEntreprisePK.idEntreprise =:idEntreprise)");
		query.setParameter("idEntreprise", idEntreprise);
		return new ArrayList<Candidat>(query.getResultList());
	}
	
	public List<ChoixEntreprise> getAllTriCroissantEntreprise(int idEntreprise) {
		prepareEntityManagerForTransaction();
		Query query = em.createQuery("SELECT c FROM ChoixEntreprise c WHERE c.choixEntreprisePK.idEntreprise =:idEntreprise ORDER BY priorite");
		query.setParameter("idEntreprise", idEntreprise);
		return new ArrayList<ChoixEntreprise>(query.getResultList());
	}

	public void deleteAllEntreprise(int idEntreprise) {
		prepareEntityManagerForTransaction();
		Query query = em.createQuery("DELETE FROM ChoixEntreprise c WHERE c.choixEntreprisePK.idEntreprise =:idEntreprise");
		query.setParameter("idEntreprise", idEntreprise);
		em.getTransaction().begin();
		query.executeUpdate();
		em.getTransaction().commit();
	}
	
	public void removeChoixEntreprise(ChoixEntreprise choixEntreprise) {
		prepareEntityManagerForTransaction();
		em.getTransaction().begin();
		if (choixEntreprise != null) {
			em.remove(choixEntreprise);
		}
		em.getTransaction().commit();
	}

	public ChoixEntreprise createChoixEntreprise(int idCandidat, int idEntreprise, int priorite, int temps) {
		prepareEntityManagerForTransaction();
		em.getTransaction().begin();
		ChoixEntreprise choixEntreprise = new ChoixEntreprise(idCandidat, idEntreprise);
                 choixEntreprise.setPriorite(priorite);
                 choixEntreprise.setTempsVoulu(temps);
		em.persist(choixEntreprise);
		em.getTransaction().commit();
		return choixEntreprise;
	}

	public ChoixEntreprise createChoixEntreprise(ChoixEntreprise c) {
		prepareEntityManagerForTransaction();
		em.getTransaction().begin();
		em.persist(c);
		em.getTransaction().commit();
		return c;
	}

	public ChoixEntreprise updateEntreprise(ChoixEntreprise c) {
		prepareEntityManagerForTransaction();
		em.getTransaction().begin();
		em.merge(c);
		em.getTransaction().commit();
		return c;
	}
}
