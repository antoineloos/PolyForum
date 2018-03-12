package forum.app.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import forum.app.dao.model.Candidat;
import forum.app.dao.model.Entreprise;
import forum.app.dao.util.PersistenceUtil;

public class CandidatDao {
	// http://www.tugay.biz/2015/08/example-with-jpa-servlet-jetty-mysql.html

	private EntityManager em;

	public void prepareEntityManagerForTransaction() {
		if (em == null) {
			em = PersistenceUtil.getEntityManager();
		}
	}

	public Candidat getById(int id) {
		prepareEntityManagerForTransaction();
		em.getTransaction().begin();
		Candidat candidat = em.find(Candidat.class, id);
		em.getTransaction().commit();
		return candidat;
	}

	public List<Candidat> getAll() {
		prepareEntityManagerForTransaction();
		Query query = em.createQuery("SELECT c FROM Candidat c");
		return new ArrayList<Candidat>(query.getResultList());
	}

	public void removeCandidat(Candidat candidat) {
		prepareEntityManagerForTransaction();
		em.getTransaction().begin();
		if (candidat != null) {
			em.remove(candidat);
		}
		em.getTransaction().commit();
	}

	public Candidat createCandidat(String nom, String prenom, boolean trouve, boolean present) {
		prepareEntityManagerForTransaction();
		em.getTransaction().begin();
		Candidat candidat = new Candidat(0,nom);
                candidat.setPresent(present);
                candidat.setPrenom(prenom);
                candidat.setTrouve(trouve);
		em.persist(candidat);
		em.getTransaction().commit();
		return candidat;
	}

	public Candidat createCandidat(Candidat c) {
		prepareEntityManagerForTransaction();
		em.getTransaction().begin();
		em.persist(c);
		em.getTransaction().commit();
		return c;
	}

	public Candidat updateCandidat(Candidat c) {
		prepareEntityManagerForTransaction();
		em.getTransaction().begin();
		em.merge(c);
		em.getTransaction().commit();
		return c;
	}
	
	public int connecter(String login, String pwd) throws Exception {
    	prepareEntityManagerForTransaction();
        List<Candidat> listeCandidat = em.createQuery("SELECT c FROM Candidat c WHERE c.login = :login").setParameter("login", login).getResultList();
        if(listeCandidat.isEmpty()){
            return -1;
        }
       
        if ( listeCandidat.stream().anyMatch((ca)->ca.getPassword().equals(pwd)) ){
      // if (c != null && listeCandidat.stream().anyMatch<Candidat>(c->c.getPassword().equals(pwd)) ){
            return ((Candidat)listeCandidat.stream().filter((c)->c.getPassword().equals(pwd)).toArray()[0]).getIdCandidat();
        }
        // Code erreur
        return -1;
    }
	
//	public void getCandidat(String login) throws Exception {
	//	prepareEntityManagerForTransaction();
	//	Candidat candidat = em.createQuery("SELECT c FROM Candidat c WHERE c.login = :login").setParameter()
	//	        .setParameter("c.nom", nomC)
	//	        .setParameter("c.prenom", prenomC)
	//	        .getResultList();
//	}

        
        
}
