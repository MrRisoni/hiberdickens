package repositories;

import hello.WaterClock;
import models.*;

import javax.persistence.Query;
import javax.persistence.Tuple;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.*;
import java.util.ArrayList;
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

    public Long getTotalQuestions(String session_id)
    {
        Query qryCount = this.getEntityManager().createNativeQuery(" SELECT  COUNT(tq.id)  FROM test_submissions sb " +
        " JOIN test_questions tq ON tq.test_id = sb.test_id " +
        " WHERE tq.active =1 AND sb.session_id = :sessionId  ");

        Object totalQuestionsCount = qryCount.setParameter("sessionId", session_id).getResultList().get(0);
        return  Long.parseLong(String.valueOf(totalQuestionsCount));
    }

    public Long getCountAnsweredSoFar(String session_id)
    {
        Query qryCount = this.getEntityManager().createNativeQuery(" SELECT  COUNT(tp.id)  FROM test_submissions sb " +
                " JOIN test_progress tp ON tp.submission_id = sb.id " +
                " WHERE sb.session_id = :sessionId  ");

        Object totalAnswered = qryCount.setParameter("sessionId", session_id).getResultList().get(0);
        return  Long.parseLong(String.valueOf(totalAnswered));
    }



    public Long getNextQuestionId(String session_id)
    {
        Query qry= this.getEntityManager().createNativeQuery("SELECT t.pool_question_id  " +
                " FROM   test_questions t  " +
                " JOIN test_submissions sb ON sb.test_id = t.test_id " +
                " LEFT JOIN " +
                "( " +
                " SELECT   tp.question_id  " +
                " FROM   test_progress tp  " +
                " JOIN test_submissions sb   ON  tp.submission_id = sb.id  " +
                " WHERE  tp.answered_at IS NOT NULL  AND sb.session_id = :sessionId  " +
                ")  answered ON answered.question_id = t.pool_question_id" +
                " WHERE  t.active =1   AND sb.session_id =:sessionId  " +
                " AND answered.question_id  IS NULL" +
                " ORDER  BY t.shown_order ASC LIMIT 1");

        Object nextQuestionId = qry.setParameter("sessionId", session_id).getResultList().get(0);
        return  Long.parseLong(String.valueOf(nextQuestionId));
    }

    public HashMap<String,Object> getNextQuestionObj(String sesionId)
    {
        TestSubmission submiss =  this.getEntityManager().createQuery("FROM TestSubmission sb" +
                " INNER JOIN FETCH sb.testObj WHERE  sb.session_id = :sessionId ",TestSubmission.class)
                .setParameter( "sessionId", sesionId ).getResultList().get(0);

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
        mp.put("deadline",submiss.getDeadline_at());
        mp.put("totalQuestions", getTotalQuestions(sesionId));
        mp.put("answered", getCountAnsweredSoFar(sesionId));

        if (afterStart && beforeDeadline) {

            System.out.println(this.getNextQuestionId(sesionId));

            CriteriaBuilder builder = this.getEntityManager().getCriteriaBuilder();
            CriteriaQuery<PoolQuestion> query = builder.createQuery(PoolQuestion.class);
            Root<PoolQuestion> root = query.from(PoolQuestion.class);
            Join<PoolQuestion, PoolQuestionAnswer> answersJoin = root.join("answersList");
            query.where( builder.equal( root.get( "id" ), this.getNextQuestionId(sesionId) ) );
            PoolQuestion tupleResult = this.getEntityManager().createQuery(query).getResultList().get(0);

            List<PoolQuestionAnswer> qas = new ArrayList<>();
            for (int i =0 ; i < tupleResult.getAnswersList().size(); i++) {
                PoolQuestionAnswer apantisi = tupleResult.getAnswersList().get(i);
                apantisi.setWrong(0);
                qas.add(apantisi);
            }
            tupleResult.setAnswersList(qas);

            mp.put("question",tupleResult);


        }

        return mp;
    }



}
