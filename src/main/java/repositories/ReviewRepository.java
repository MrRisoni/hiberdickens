package repositories;

import models.evaluation.ReviewQuestionnaire;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

public class ReviewRepository  extends Repository {


    public ReviewRepository() {
    }

    public ReviewQuestionnaire getQuestionnaire(int qId)
    {
        CriteriaBuilder builder = this.getEntityManager().getCriteriaBuilder();
        CriteriaQuery<ReviewQuestionnaire> query = builder.createQuery(ReviewQuestionnaire.class);
        Root<ReviewQuestionnaire> grp = query.from(ReviewQuestionnaire.class);
        return this.getEntityManager().createQuery(query).getResultList().get(0);
    }
}
