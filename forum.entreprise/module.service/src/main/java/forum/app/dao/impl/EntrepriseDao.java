package forum.app.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import forum.app.dao.model.Entreprise;
import forum.app.dao.util.PersistenceUtil;

public class EntrepriseDao {
	
	private EntityManager em;
	
	public void prepareEntityManagerForTransaction(){
		if (em == null){
			em = PersistenceUtil.getEntityManager();
		}
	}
	
	public Entreprise getById(int id) {
		prepareEntityManagerForTransaction();
		em.getTransaction().begin();
		Entreprise entreprise = em.find(Entreprise.class, id);
		em.getTransaction().commit();
		return entreprise;
	}

	public List<Entreprise> getAll() {
		prepareEntityManagerForTransaction();
		Query query = em.createQuery("SELECT e FROM Entreprise e");
		return (ArrayList<Entreprise>) query.getResultList();
	}

	public void removeEntreprise(Entreprise entreprise) {
		prepareEntityManagerForTransaction();
		em.getTransaction().begin();
		if (entreprise != null) {
			em.remove(entreprise);
		}
		em.getTransaction().commit();
	}
	
	public Entreprise createEntreprise(String nom, String nomPresentant, boolean present) {
		prepareEntityManagerForTransaction();
		em.getTransaction().begin();
		Entreprise entreprise = new Entreprise(0,nom);
                
                entreprise.setNomRepresentant(nomPresentant);
                entreprise.setPresent(present);
	    em.persist(entreprise);
		em.getTransaction().commit();
		
	    return entreprise;
	  }
	
	public Entreprise createEntreprise(Entreprise c) {
		prepareEntityManagerForTransaction();
		em.getTransaction().begin();
	    em.persist(c);
		em.getTransaction().commit();
	    return c;
	}
	
	public Entreprise updateEntreprise(Entreprise e) {
		prepareEntityManagerForTransaction();
		em.getTransaction().begin();
		em.merge(e);
		em.getTransaction().commit();
		return e;
	}
	
	public int connecter(String login, String pwd) throws Exception {
    	prepareEntityManagerForTransaction();
        List<Entreprise> listeEntreprise = em.createQuery("SELECT e FROM Entreprise e WHERE e.login = :login").setParameter("login", login).getResultList();
        if(listeEntreprise.isEmpty()){
            return -1;
        }
        Entreprise e = listeEntreprise.get(0); 
        if (e != null && e.getPassword().equals(pwd)){
            return e.getIdEntreprise();
        }
        // Code erreur
        return -1;
    }
}
