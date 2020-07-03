package repositories;

import models.ReviewQuestionnaire;
import models.TestModel;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

public class TestsRepository extends Repository {

    public TestModel getTestQuestions(int courseId)
    {
        CriteriaBuilder builder = this.getEntityManager().getCriteriaBuilder();
        CriteriaQuery<TestModel> query = builder.createQuery(TestModel.class);
        Root<TestModel> grp = query.from(TestModel.class);
        return this.getEntityManager().createQuery(query).getResultList().get(0);
    }
}
