package models;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.HashMap;
import java.util.Map;

public class HibernateUtil {

    private static EntityManager em = null;
    private static EntityManagerFactory emFactory = null;

    public static EntityManager getEM() {
        if (emFactory == null) {
            Map<String, Object> configOverrides = new HashMap<String, Object>();
            configOverrides.put("javax.persistence.jdbc.password", System.getenv("SPRING_APP_DB_DICKENS_PASSWD"));
            configOverrides.put("javax.persistence.jdbc.user", System.getenv("SPRING_APP_DB_DICKENS_USR"));

            String dbUrl = "jdbc:mysql://" + System.getenv("SPRING_APP_DB_DICKENS_HOST") + ":3306/" + System.getenv("SPRING_APP_DB_DICKENS_DB") + "?serverTimezone=UTC";
            configOverrides.put("javax.persistence.jdbc.url", dbUrl);
            emFactory = Persistence.createEntityManagerFactory("dickensdb", configOverrides);
            em = emFactory.createEntityManager();
        }
        return em;
    }
    public static EntityManagerFactory getEmFactory() {
        return emFactory;
    }
}