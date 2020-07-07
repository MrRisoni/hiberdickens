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

    @Scheduled(fixedRate = 5000)
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
                    " LEFT JOIN student_debts stb ON (stb.group_id = h.group_id AND stb.lesson_year = YEAR(started)  AND stb.month_id =  MONTH(started) ) " +
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
                /*
                if (recordNotExists == 1) {

                    addedMonth = monthId;
                    if (addedMonth.length() == 1) {
                        addedMonth = "0" + addedMonth;
                    }
                    leftLimit = lesson_year + "-" + addedMonth + "-01 00:00:00";
                    rightLimit = lesson_year + "-" + addedMonth + "-30 23:59:59"; //!!! how to get last day of month

                    em.getTransaction().begin();

                    String q = "INSERT IGNORE INTO `teacher_debts` (`created_at`, `updated_at`, `teacher_id`, `amount`, `group_id`, `month_id`, `lesson_year`,`starts_at`,`ends_at`) VALUES (NOW(),NOW(),'" + String.valueOf(teacherId) + "',0,'" + String.valueOf(groupId) + "','" + String.valueOf(monthId) + "', '" + String.valueOf(lesson_year) + "','" + leftLimit + "','" + rightLimit + "') ";
                    System.out.println(q);
                    Query persistableQuery = em.createNativeQuery(q);
                    persistableQuery.executeUpdate();
                    em.getTransaction().commit();

                }*/
            } // end loop month
        } // end loop student group combo

    }

}
