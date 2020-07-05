package repositories;

import hello.WaterClock;
import models.*;

import javax.persistence.Query;
import javax.persistence.Tuple;
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


    public Long getNextQuestionId()
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
        return  Long.parseLong(String.valueOf(nextQuestionId));
    }

    public HashMap<String,Object> getNextQuestionObj(int testId,int submissionId)
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
        boolean afterStart = (thisMoment > testStarted);
        boolean beforeDeadline = (thisMoment <  deadline);

        mp.put("beforeWindow", (thisMoment< windowStarts));
        mp.put("afterWindow", (thisMoment> windowEnds));
        mp.put("beforeDeadline", beforeDeadline);
        mp.put("afterStart", afterStart);

        if (afterStart && beforeDeadline) {
         //   PoolQuestion pq = this.getEntityManager().createQuery("FROM PoolQuestion WHERE id =1",PoolQuestion.class).getResultList().get(0);
        //    mp.put("question",pq);

            CriteriaBuilder builder = this.getEntityManager().getCriteriaBuilder();
            CriteriaQuery<PoolQuestion> query = builder.createQuery(PoolQuestion.class);
            Root<PoolQuestion> root = query.from(PoolQuestion.class);
            Join<PoolQuestion, PoolQuestionAnswer> answersJoin = root.join("answersList");

         //   query.multiselect(  root.get("answersList.id"), root.get("answersList.body")); // do not fetch wrong
            //cq.multiselect(root.get("id"), root.get("body"));  //using metamodel
            PoolQuestion tupleResult = this.getEntityManager().createQuery(query).getResultList().get(0);
            mp.put("question",tupleResult);


        }

        return mp;
    }



}
