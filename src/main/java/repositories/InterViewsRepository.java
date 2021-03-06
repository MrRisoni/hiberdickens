package repositories;

import models.*;
import models.interviews.InterViewSchedule;
import models.interviews.InterViewStage;
import models.interviews.JobOpening;

import java.util.List;

public class InterViewsRepository extends Repository {

    public InterViewsRepository() {
        this.setEntityManager(HibernateUtil.getEM());
    }

    public List<JobOpening> fetchJobOpenings(Long openingId)
    {
        return this.getEntityManager().createQuery("FROM JobOpening", JobOpening.class)
                .setHint("org.hibernate.cacheable", true)
                .getResultList();
    }

    public List<InterViewStage> fetchStagesAndApplicants(Long openingId)
    {
        return this.getEntityManager()
                .createQuery("FROM InterViewStage ORDER BY shown_order ASC", InterViewStage.class)
                .setHint("org.hibernate.cacheable", true)
                .getResultList();
    }


    public List<InterViewSchedule> fetchInterviews()
    {
        return this.getEntityManager().createQuery("FROM InterViewSchedule ", InterViewSchedule.class)
                .setHint("org.hibernate.cacheable", true)
                .getResultList();
    }
}
