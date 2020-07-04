package repositories;

import hello.WaterClock;
import models.*;

import javax.persistence.Query;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Root;
import java.util.HashMap;
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


    public HashMap<String,Object> getNextQuestion()
    {
        Query qry= this.getEntityManager().createNativeQuery("SELECT t.pool_question_id  FROM test_questions t " +
        " WHERE t.test_id =1 " +
        " AND t.pool_question_id " +
        " NOT IN ( " +
        "     SELECT sba.question_id " +
        " FROM  test_submissions sb " +
        " JOIN test_submissions_answers sba ON  sba.submission_id = sb.id " +
        " WHERE sb.application_id  = 1 AND sb.test_id = 1 " +
        " ) " +
        " ORDER BY t.shown_order ASC LIMIT 1 ");

        Object nextQuestionId = qry.getResultList().get(0);
        return null;
    }

    public HashMap<String,Object> isTestActive(int testId,int submissionId)
    {
        boolean isActive = true;

        TestSubmission submiss =  this.getEntityManager().createQuery("FROM TestSubmission sb" +
                " INNER JOIN FETCH sb.testObj WHERE sb.testObj.id =1 AND sb.id = 1",TestSubmission.class).getResultList().get(0);

        Long windowStarts = submiss.getTime_window_starts().getTime()/ 1000L;
        Long windowEnds = submiss.getTime_window_ends().getTime()/ 1000L;

        Long testStarted = submiss.getStarted_at().getTime() / 1000L;

        Long deadline = submiss.getDeadline_at().getTime()/ 1000L;

        Long thisMoment = WaterClock.getUnix();

        HashMap<String,Object> mp = new HashMap<String, Object>();

        System.out.println("thismom " + thisMoment);
        System.out.println("testStarted " + testStarted);

        mp.put("beforeWindow", (thisMoment< windowStarts));
        mp.put("afterWindow", (thisMoment> windowEnds));
        mp.put("beforeDeadline", (thisMoment <  deadline));
        mp.put("afterStart", (thisMoment > testStarted));

        return mp;
    }



}
