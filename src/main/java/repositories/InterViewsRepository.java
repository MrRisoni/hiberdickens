package repositories;

import models.HibernateUtil;
import models.InterViewStage;
import models.JobOpening;
import models.Speed;

import java.util.List;

public class InterViewsRepository extends Repository {

    public InterViewsRepository() {
        this.setEntityManager(HibernateUtil.getEM());
    }

    public List<JobOpening> fetchJobOpenings(Long openingId)
    {
        return this.getEntityManager().createQuery("FROM JobOpening", JobOpening.class).getResultList();
    }

    public List<InterViewStage> fetchStagesAndApplicants(Long openingId)
    {
        return this.getEntityManager().createQuery("FROM InterViewStage ORDER BY shown_order ASC", InterViewStage.class).getResultList();
    }
}
