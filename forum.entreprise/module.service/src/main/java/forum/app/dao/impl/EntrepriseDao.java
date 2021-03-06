package forum.app.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import forum.app.dao.model.Entreprise;
import forum.app.dao.util.PersistenceUtil;
import forum.app.dao.util.SHA512;

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
		return new ArrayList<Entreprise>(query.getResultList());
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
             String pwdH = SHA512.generatePassword(pwd);
    	prepareEntityManagerForTransaction();
        List<Entreprise> listeEntreprise = em.createQuery("SELECT e FROM Entreprise e WHERE e.login = :login").setParameter("login", login).getResultList();
        if(listeEntreprise.isEmpty()){
            return -1;
        }
         
        if (listeEntreprise.stream().anyMatch((en)->en.getPassword().equals(pwdH))){
           return ((Entreprise)listeEntreprise.stream().filter((e)->e.getPassword().equals(pwdH)).toArray()[0]).getIdEntreprise();
        }
        // Code erreur
        return -1;
    }
}
