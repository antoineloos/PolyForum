package forum.app.dao.util;
 
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
 
public class PersistenceUtil {
 
    private static EntityManagerFactory entityManagerFactory;
 
    public static void buildEntityManagerFactory() {
        if (entityManagerFactory != null) {
            return;
        }
        entityManagerFactory = Persistence.createEntityManagerFactory(Constantes.POLYFORUM);
    }
 
    public static EntityManager getEntityManager() {
    	if (entityManagerFactory == null){
    		buildEntityManagerFactory();
    	}
    	return entityManagerFactory.createEntityManager();
    }
 
    public static void killEntityManagerFactory() {
        if (entityManagerFactory != null) {
            entityManagerFactory.close();
        }
    }
 
}