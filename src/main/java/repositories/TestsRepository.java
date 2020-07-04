package repositories;

import models.*;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Root;
import java.util.List;

public class TestsRepository extends Repository {

     public List<Pools> getTestQuestions(int courseId)
    {
        CriteriaBuilder builder = this.getEntityManager().getCriteriaBuilder();
        CriteriaQuery<models.Pools> query = builder.createQuery(models.Pools.class);
        Root<models.Pools> root = query.from(models.Pools.class);
    //    Join<models.Pools, CourseModel> courseJoin = root.join("courseObj");
        return this.getEntityManager().createQuery(query).getResultList();
    }
}
