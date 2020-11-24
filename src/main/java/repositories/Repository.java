package repositories;

import org.hibernate.Session;

import javax.persistence.EntityManager;

public class Repository {
    private EntityManager entityManager;
    private Session session;

    public EntityManager getEntityManager() {
        return entityManager;
    }

    public void setEntityManager(EntityManager entityManager) {
        this.entityManager = entityManager;
    }
}
