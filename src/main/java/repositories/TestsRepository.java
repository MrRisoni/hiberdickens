package repositories;

import models.Pools;
import models.ReviewQuestionnaire;
import models.TestModel;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

public class TestsRepository extends Repository {

    public List<Pools> getTestQuestions(int courseId)
    {
        CriteriaBuilder builder = this.getEntityManager().getCriteriaBuilder();
        CriteriaQuery<models.Pools> query = builder.createQuery(models.Pools.class);
        Root<models.Pools> grp = query.from(models.Pools.class);
        return this.getEntityManager().createQuery(query).getResultList();
    }
}
