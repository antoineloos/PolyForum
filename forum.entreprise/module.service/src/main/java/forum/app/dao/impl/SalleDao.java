package forum.app.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import forum.app.dao.model.Entreprise;
import forum.app.dao.model.Salle;
import forum.app.dao.util.PersistenceUtil;

public class SalleDao {
private EntityManager em;
	
	public void prepareEntityManagerForTransaction(){
		if (em == null){
			em = PersistenceUtil.getEntityManager();
		}
	}
	
	public Salle getById(int id) {
		prepareEntityManagerForTransaction();
		em.getTransaction().begin();
		Salle salle = em.find(Salle.class, id);
		em.getTransaction().commit();
		return salle;
	}
	
	public void updateCapacite(int id) {
		prepareEntityManagerForTransaction();
		Salle s = getById(id);
		em.getTransaction().begin();
		if (s.getCapacite() > 0){
			s.setCapacite(s.getCapacite()-1);
		}
		em.merge(s);
		em.getTransaction().commit();
	}

	public List<Salle> getAll() {
		prepareEntityManagerForTransaction();
		Query query = em.createQuery("SELECT s FROM Salle s");
		return (ArrayList<Salle>) query.getResultList();
	}

	public void removeSalle(Salle salle) {
		prepareEntityManagerForTransaction();
		em.getTransaction().begin();
		if (salle != null) { 
			em.remove(salle);
		}
		em.getTransaction().commit();
	}
	
	public Salle createSalle(int idSalle, boolean disponible, int capacite) {
		prepareEntityManagerForTransaction();
		em.getTransaction().begin();
		Salle salle = new Salle(idSalle);
                salle.setDisponible(disponible);
                salle.setCapacite(capacite);
	    em.persist(salle);
		em.getTransaction().commit();
	    return salle;
	  }
	
	public Salle createSalle(Salle s) {
		prepareEntityManagerForTransaction();
		em.getTransaction().begin();
	    em.persist(s);
		em.getTransaction().commit();
	    return s;
	}
	
	public Salle updateSalle(Salle s) {
		prepareEntityManagerForTransaction();
		em.getTransaction().begin();
		em.merge(s);
		em.getTransaction().commit();
		return s;
	}
}
