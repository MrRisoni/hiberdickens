package repositories;


import models.*;

import javax.persistence.Query;
import javax.persistence.TypedQuery;
import java.util.List;
import java.util.stream.Collectors;

public class GroupRepository extends Repository {

    public GroupRepository() {
    }

    public List<GroupMember> getGroupStudents(int groupId) {

                Query qry = this.getEntityManager().createNativeQuery("SELECT gs.student_id , gs.joined,gs.dropped, CONCAT(m.name' ',m.surname), " +
                " IF (CURRENT_DATE > gs.dropped, 1,0) AS hasDropped,  " +
                " IF (studentsPayed.student_id IS NULL,0, studentsPayed.sumPayed) AS hasPayed,  " +
                " IF (studentsDebt.student_id IS NULL,0,  " +
                "         IF (studentsPayed.student_id IS NULL,studentsDebt.sumInDebt, studentsDebt.sumInDebt-studentsPayed.sumPayed)  " +
                " ) AS remainingDebt  " +
                " FROM group_students gs  " +
                " JOIN students s ON s.id = gs.student_id  " +
                " JOIN members m ON m.id = s.member_id  " +

                " LEFT JOIN  " +
                "    (  " +
                "       SELECT SUM(amount) AS sumPayed,student_id FROM student_payed  " +
                "       WHERE group_id = 1  " +
                "       GROUP BY student_id  " +
                "    ) AS studentsPayed ON  studentsPayed.student_id = gs.student_id  " +
                " LEFT JOIN  " +
                " (  " +
                "      SELECT SUM(amount) AS sumInDebt,student_id FROM student_debts  " +
                "       WHERE group_id = 1  " +
                "   GROUP BY student_id  " +
                " ) AS studentsDebt ON  studentsDebt.student_id = gs.student_id  " +
                " WHERE gs.group_id = 1 ");

                List<Object[]> results = qry.getResultList();

                return results.stream().map(el -> {
                   GroupMember gpm = new GroupMember();
                   gpm.setFullName(el[3].toString());
                   gpm.setDropped(el[2].toString());
                   gpm.setHasDropped(Boolean.parseBoolean(el[4].toString()));
                   gpm.setJoined(el[1].toString());
                   gpm.setStudentId(Integer.parseInt(el[0].toString()));
                   gpm.setSumOwns(Float.parseFloat(el[6].toString()));
                   gpm.setSumPayed(Float.parseFloat(el[5].toString()));
                   return gpm;
                }).collect(Collectors.toList());

    }

    /*
    private float getSumStudentDebts(int groupId)
    {

    }

    private float getSumTeacherDebts(int groupId)
    {

    }

    private float getSumStudentPayments(int groupId)
    {

    }

    private float getSumTeacherPayments(int groupId)
    {

    }

    private List<StudentDebt> getStudentDebtsList(int groupId)
    {

    }

    private List<StudentPayment> getStudentPaymentsList(int groupId)
    {

    }

    private List<TeacherDebt> getTeacherDebtsList(int groupId)
    {

    }

    private List<TeacherPayment> getTeacherPaymentsList(int groupId)
    {

    }

    private List<HistoryModel> getHistory(int  groupId)
    {

    }
*/



}
