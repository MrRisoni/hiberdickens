package repositories;


import models.GroupStudent;

import javax.persistence.Query;
import javax.persistence.TypedQuery;
import java.util.List;

public class GroupRepository extends Repository {

    public GroupRepository() {
    }

    public List<GroupMember> getGroupStudents(int groupId) {
      /* return  this.getEntityManager().createQuery("SELECT new repositories.GroupMember(gs.joined, gs.dropped, mb.name) " +
                "  FROM GroupStudent gs " +
                "JOIN gs.studentObj s" +
                " JOIN s.member mb WHERE gs.groupId = :gid").setParameter("gid",groupId).getResultList(); */

                SELECT gs.student_id , gs.joined,gs.dropped, m.name,
                IF (CURRENT_DATE > gs.dropped, 1,0) AS hasDropped,
                IF (studentsPayed.student_id IS NULL,0, studentsPayed.sumPayed) AS hasPayed,
                IF (studentsDebt.student_id IS NULL,0,
                        IF (studentsPayed.student_id IS NULL,studentsDebt.sumInDebt, studentsDebt.sumInDebt-studentsPayed.sumPayed)
                ) AS remainingDebt
                FROM group_students gs
                JOIN students s ON s.id = gs.student_id
                JOIN members m ON m.id = s.member_id


                LEFT JOIN
                    (
                       SELECT SUM(amount) AS sumPayed,student_id FROM student_payed
                       WHERE group_id = 1
                       GROUP BY student_id
                    ) AS studentsPayed ON  studentsPayed.student_id = gs.student_id
                LEFT JOIN
                (
                       SELECT SUM(amount) AS sumInDebt,student_id FROM student_debts
                       WHERE group_id = 1
                       GROUP BY student_id
                ) AS studentsDebt ON  studentsDebt.student_id = gs.student_id
                WHERE gs.group_id = 1

    }



}
