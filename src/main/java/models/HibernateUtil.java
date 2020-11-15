package models;


import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
public class HibernateUtil {

    private static EntityManager em = null;
    private static EntityManagerFactory emFactory = null;

    public static EntityManager getEM() {
        if (emFactory == null) {
            emFactory = Persistence.createEntityManagerFactory("dickensdb");
            em = emFactory.createEntityManager();
        }
        return em;
    }

    public static EntityManagerFactory getEmFactory() {
        return emFactory;
    }
}