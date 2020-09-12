package models;

import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

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
            System.out.println("SYSTEM ENV");
            configOverrides.put("javax.persistence.jdbc.password", System.getenv("SPRING_APP_DB_PASSWD"));
            configOverrides.put("javax.persistence.jdbc.user", System.getenv("SPRING_APP_DB_USR"));

            String dbUrl = "jdbc:mysql://" + System.getenv("SPRING_APP_DB_HOST") + ":3306/" + System.getenv("SPRING_APP_DB_DICKENS_NAME") + "?serverTimezone=UTC";
            configOverrides.put("javax.persistence.jdbc.url", dbUrl);
            System.out.println("URL CON");
            System.out.println(dbUrl);

            emFactory = Persistence.createEntityManagerFactory("dickensdb", configOverrides);
            em = emFactory.createEntityManager();
        }
        return em;
    }

    public static EntityManagerFactory getEmFactory() {
        return emFactory;
    }
}