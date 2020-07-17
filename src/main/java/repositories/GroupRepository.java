package repositories;


import hqlmappers.TimetableDTO;
import models.*;

import javax.persistence.Query;
import javax.persistence.TypedQuery;
import java.util.List;
import java.util.stream.Collectors;

public class GroupRepository extends Repository {

    public GroupRepository() {
    }

    public GroupModel getGroup(Long groupId)
    {
        return this.getEntityManager().createQuery("FROM GroupModel WHERE id=:grid",GroupModel.class).setParameter("grid",groupId).getResultList().get(0);
    }
    public List<Member> getGroupTeachers(Long groupId) {
        return this.getEntityManager().createQuery("SELECT mb FROM GroupTeachers gt " +
                " JOIN gt.groupObj " +
                " JOIN gt.teacherObj " +
                " JOIN gt.teacherObj.member mb " +
                " WHERE gt.groupObj.id=:gid ",Member.class).setParameter("gid",groupId).getResultList();
    }

    public List<GroupMember> getGroupStudents(Long groupId) {

                Query qry = this.getEntityManager().createNativeQuery("SELECT gs.student_id , gs.joined,gs.dropped, CONCAT(m.name,' ',m.surname), " +
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
                "       WHERE group_id = id  " +
                "       GROUP BY student_id  " +
                "    ) AS studentsPayed ON  studentsPayed.student_id = gs.student_id  " +
                " LEFT JOIN  " +
                " (  " +
                "      SELECT SUM(amount) AS sumInDebt,student_id FROM student_debts  " +
                "       WHERE group_id = id  " +
                "   GROUP BY student_id  " +
                " ) AS studentsDebt ON  studentsDebt.student_id = gs.student_id  " +
                " WHERE gs.group_id = :id ");

                List<Object[]> results = qry.setParameter( "id", groupId ).getResultList();

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



    public List<Object> getStudentPaymentsList(Long groupId)
    {
         return this.getEntityManager().createQuery("SELECT new hqlmappers.PaymentDebtDTO(sp.amount,mon.title, sp.lesson_year, sp.groupObj.id, sp.studentObj.id,  concat(m.name,' ',m.surname),'') " +
         " FROM StudentPayment sp " +
         " JOIN sp.monthObj mon " +
         " JOIN sp.studentObj stObj " +
         " JOIN stObj.member m  " +
         " JOIN sp.groupObj " +
         " WHERE sp.groupObj.id = :id ").setParameter( "id", groupId ).getResultList();

    }

    public List<Object> getStudentDebtsList(Long groupId)
    {
        return this.getEntityManager().createQuery("SELECT new hqlmappers.PaymentDebtDTO(sb.amount,mon.title, sb.lesson_year, sb.groupObj.id, sb.studentObj.id, concat(m.name,' ',m.surname) ,'') " +
                " FROM StudentDebt sb " +
                " JOIN sb.monthObj mon " +
                " JOIN sb.studentObj stObj " +
                " JOIN stObj.member m  " +
                " JOIN sb.groupObj " +
                " WHERE sb.groupObj.id = :id ").setParameter( "id", groupId ).getResultList();
    }

    public List<Object> getTeacherPaymentsList(Long groupId)
    {
        return this.getEntityManager().createQuery("SELECT new hqlmappers.PaymentDebtDTO(tp.amount,mon.title, tp.lesson_year, tp.groupObj.id, tp.teacherObj.id,  concat(m.name,' ',m.surname),'' ) " +
                " FROM TeacherPayment tp " +
                " JOIN tp.teacherObj  " +
                " JOIN tp.teacherObj.member m  " +
                " JOIN tp.monthObj mon " +
                " WHERE tp.groupObj.id = :id ").setParameter( "id", groupId ).getResultList();
    }


    public List<TeacherDebt> getTeacherDebtsList(Long groupId)
    {
        return this.getEntityManager().createQuery("SELECT new hqlmappers.PaymentDebtDTO(tb.amount,mon.title, tb.lesson_year, tb.groupObj.id, tb.teacherObj.id,  concat(m.name,' ',m.surname) ,'') " +
                " FROM TeacherDebt tb " +
                " JOIN tb.teacherObj  " +
                " JOIN tb.teacherObj.member m  " +
                " JOIN tb.monthObj mon " +
                " WHERE tb.groupObj.id = :id ").setParameter( "id", groupId ).getResultList();
    }


    public List<TimetableDTO> getHistory(Long  groupId)
    {
      return  this.getEntityManager().createQuery("SELECT new hqlmappers.TimetableDTO(hs.id,  hs.started, hs.duration, rm.title, hs.cancelled, hs.wage, hs.fee) " +
                " FROM HistoryModel hs  JOIN hs.room rm " +
                " JOIN hs.groupObj gr WHERE gr.id= :id", TimetableDTO.class).setParameter( "id", groupId ).getResultList();

    }

}
