package hello;

import models.HibernateUtil;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.Calendar;
import java.util.List;

@Component
public class CalcStudentDebtsScheduler {

   //  @Scheduled(fixedRate = 5000)
    public void populateStudentDebts() {
        String q=" SELECT stb.id, SUM(h.fee* h.duration) FROM student_debts stb " +
        " JOIN history h ON h.group_id = stb.group_id " +
        " WHERE :cegodnya >=stb.starts_at " +
        " AND stb.ends_at >=:cegodnya " +
        " AND h.started >= stb.starts_at " +
        " AND stb.ends_at >= h.started " +
        " GROUP BY stb.id ";
        EntityManager em = HibernateUtil.getEM();
        em.getTransaction().begin();

        // discounts
        List<Object[]> results = em.createNativeQuery(q).setParameter("cegodnya",WaterClock.getStrDateTime()).getResultList();
        for (Object[] groupStudentCombo :results) {
            String q1="UPDATE `student_debts` SET `amount` = '"  + groupStudentCombo[1].toString() + "', updated_at = NOW() WHERE id = '"+ groupStudentCombo[0].toString()  +"' ";
            System.out.println(q1);
            em.createNativeQuery(q1).executeUpdate();
        }
        em.getTransaction().commit();
    }


   // @Scheduled(fixedRate = 50000)
    public void createRecordsInTableStudentDebts() {
        int groupId;
        int studentId;
        String monthId;
        String lesson_year;
        int recordNotExists;
        String leftLimit = "";
        String rightLimit = "";
        String addedMonth = "";
        EntityManager em = HibernateUtil.getEM();
        em.getTransaction().begin();


        List<Object[]> groupsStudents = em.createNativeQuery("SELECT gs.group_id,gs.student_id FROM group_students gs " +
                " JOIN groupakia g ON g.id = gs.group_id" +
                "  WHERE gs.dropped >= '" + WaterClock.getStrDateTime() + "'" +
                "  AND  g.active = 1 AND g.ends_at >= '" + WaterClock.getStrDateTime() + "'").getResultList();
        for (Object[] groupStudentCombo : groupsStudents) {
            groupId = Integer.parseInt(groupStudentCombo[0].toString());
            studentId = Integer.parseInt(groupStudentCombo[1].toString());
            System.out.println(groupId + " " + studentId);

            // check if there is a record for all months, this query checks from beginning of time...
            List<Object[]> results = em.createNativeQuery("SELECT IF(stb.id IS NULL,1,0) AS recordNotExists, " +
                    " YEAR(started), MONTH(started) FROM `history` h " +
                    " JOIN group_students gs ON h.group_id = gs.group_id " +
                    " LEFT JOIN student_debts stb ON ( gs.student_id = stb.student_id AND stb.group_id = h.group_id AND stb.lesson_year = YEAR(started)  AND stb.month_id =  MONTH(started) ) " +
                    " WHERE h.started <= :cegodnya AND h.group_id =:gid AND h.cancelled = 0 AND h.started < gs.dropped AND gs.student_id = :sid" +
                    " GROUP BY stb.id,YEAR(h.started), MONTH(h.started)")
                    .setParameter("gid", groupId)
                    .setParameter("sid", studentId)
                    .setParameter("cegodnya", WaterClock.getStrDateTime()).getResultList();
            for (Object[] studentGroup : results) {

                System.out.println("not exists " + studentGroup[0]);
                lesson_year = studentGroup[1].toString();
                monthId = studentGroup[2].toString();
                System.out.println(lesson_year + " " + monthId);
                recordNotExists = Integer.parseInt(studentGroup[0].toString());

                if (recordNotExists == 1) {

                    addedMonth = monthId;
                    if (addedMonth.length() == 1) {
                        addedMonth = "0" + addedMonth;
                    }
                    leftLimit = lesson_year + "-" + addedMonth + "-01 00:00:00";
                    rightLimit = lesson_year + "-" + addedMonth + "-30 23:59:59"; //!!! how to get last day of month


                    String q = "INSERT IGNORE INTO `student_debts` (`created_at`, `updated_at`, `student_id`, `amount`, `group_id`, `month_id`, `lesson_year`,`starts_at`,`ends_at`) VALUES (NOW(),NOW(),'" + String.valueOf(studentId) + "',0,'" + String.valueOf(groupId) + "','" + String.valueOf(monthId) + "', '" + String.valueOf(lesson_year) + "','" + leftLimit + "','" + rightLimit + "') ";
                    System.out.println(q);
                    Query persistableQuery = em.createNativeQuery(q);
                    persistableQuery.executeUpdate();

                }
            } // end loop month
        } // end loop student group combo
        em.getTransaction().commit();

    }

}
