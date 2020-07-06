package hello;

import models.HibernateUtil;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

@Component
public class StudentsDebtsCalculator {


  /*  @Scheduled(fixedRate = 5000)
    public void populateStudentDebts() {

        String q=" SELECT tb.id, SUM(h.wage* h.duration) FROM teacher_debts tb " +
        " JOIN history h ON (h.group_id = tb.group_id AND h.teacher_id = tb.teacher_id) " +
        " WHERE '2019-09-21 10:00:00'>=tb.starts_at " +
        " AND tb.ends_at >='2019-09-21 10:00:00' " +
        " AND h.started >= tb.starts_at " +
        " AND tb.ends_at >= h.started " +
        " GROUP BY tb.id ";
        EntityManager em = HibernateUtil.getEM();
        em.getTransaction().begin();
        
        List<Object[]> results = em.createNativeQuery(q).getResultList();
        for (Object[] groupTeacherCombo :results) {
            String q1="UPDATE `teacher_debts` SET `amount` = '"  + groupTeacherCombo[1].toString() + "', updated_at = NOW() WHERE id = '"+ groupTeacherCombo[0].toString()  +"' ";
            System.out.println(q1);
            em.createNativeQuery(q1).executeUpdate();
        }
        em.getTransaction().commit();


    }*/

    @Scheduled(fixedRate = 5000)
    public void createRecordsInTableStudentDebts() {
        EntityManager em = HibernateUtil.getEM();
        //  List<Object> results = em.createNativeQuery("SELECT id,teacher_id FROM groupakia ").getResultList(); created at ect
        // do not forget timestamp criteria
        System.out.println("Cron Job");
        int groupId = 1;
        int teacherId = 1;
        String monthId;
        String lesson_year;
        int recordNotExists = 1;
        String leftLimit ="";
        String rightLimit ="";
        String addedMonth = "";

        // check if there is a record for all months, this query checks from beginning of time...
        List<Object[]> results = em.createNativeQuery("SELECT IF(tb.id IS NULL,1,0) AS recordNotExists, " +
                " YEAR(started), MONTH(started) FROM `history` h " +
                " LEFT JOIN teacher_debts tb ON (tb.group_id = h.group_id AND tb.teacher_id = h.teacher_id AND tb.lesson_year = YEAR(started)  AND tb.month_id =  MONTH(started)) " +
                " WHERE h.started <= '2019-09-21' AND h.group_id =1 AND h.teacher_id = 1 AND h.cancelled = 0 " +
                " GROUP BY tb.id,YEAR(h.started), MONTH(h.started)").getResultList();
        for (Object[] teacherGroup : results) {
            System.out.println("not exists " + teacherGroup[0]);
            lesson_year = teacherGroup[1].toString();
            monthId = teacherGroup[2].toString();
            System.out.println(lesson_year + " " + monthId);
            recordNotExists = Integer.parseInt(teacherGroup[0].toString());
            if (recordNotExists == 1) {

                addedMonth = monthId;
                if (addedMonth.length() ==1) {
                    addedMonth = "0" + addedMonth;
                }
                leftLimit = lesson_year+"-"+addedMonth+"-01 00:00:00";
                rightLimit = lesson_year+"-"+addedMonth+"-30 23:59:59"; //!!! how to get last day of month

                em.getTransaction().begin();

                String q = "INSERT IGNORE INTO `teacher_debts` (`created_at`, `updated_at`, `teacher_id`, `amount`, `group_id`, `month_id`, `lesson_year`,`starts_at`,`ends_at`) VALUES (NOW(),NOW(),'" + String.valueOf(teacherId) + "',0,'" + String.valueOf(groupId) + "','" + String.valueOf(monthId) + "', '" + String.valueOf(lesson_year) + "','" + leftLimit +"','"+ rightLimit +"') ";
                System.out.println(q);
                Query persistableQuery = em.createNativeQuery(q);
              //  persistableQuery.executeUpdate();
                em.getTransaction().commit();

            }
        }
    }
}

