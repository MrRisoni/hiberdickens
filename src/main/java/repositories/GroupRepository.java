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

    public GroupModel getGroup(int groupId)
    {
        return this.getEntityManager().createQuery("FROM GroupModel WHERE id=:grid",GroupModel.class).setParameter("grid",groupId).getResultList().get(0);
    }

    public List<GroupMember> getGroupStudents(int groupId) {

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

    public double getSumStudentDebts(int groupId)
    {
        return this.getEntityManager().createQuery(
                "select sum(stdb.amount)  " +
                        "from StudentDebt stdb JOIN stdb.groupObj " +
                        "where stdb.groupObj.id = :id ", Double.class )
                .setParameter( "id", groupId ).getSingleResult();
    }


    public double getSumStudentPayments(int groupId)
    {
        return this.getEntityManager().createQuery(
                "select sum(stp.amount)  " +
                        "from StudentPayment stp JOIN stp.groupObj " +
                        "where stp.groupObj.id = :id ", Double.class )
                .setParameter( "id", groupId ).getSingleResult();

    }

    public double getSumTeacherDebts(int groupId)
    {
        return this.getEntityManager().createQuery(
                "select sum(tb.amount)  " +
                        "from TeacherDebt tb JOIN tb.groupObj " +
                        "where tb.groupObj.id = :id ", Double.class )
                .setParameter( "id", groupId ).getSingleResult();
    }

    public double getSumHours(int groupId){
        return this.getEntityManager().createQuery("SELECT SUM(duration) FROM HistoryModel JOIN groupObj WHERE groupObj.id = :id", Double.class )
                .setParameter( "id", groupId ).getSingleResult();
    }

    public double getSumTeacherPayments(int groupId)
    {
        return this.getEntityManager().createQuery(
                "select sum(tp.amount)  " +
                        "from TeacherPayment tp JOIN tp.groupObj " +
                        "where tp.groupObj.id = :id ", Double.class )
                .setParameter( "id", groupId ).getSingleResult();

    }

    public List<Object> getStudentPaymentsList(int groupId)
    {
         return this.getEntityManager().createQuery("SELECT new hqlmappers.StudentPaymentDebt(sp.amount,mon.title, sp.lesson_year, sp.groupObj.id, sp.studentObj.id, m.name) " +
         " FROM StudentPayment sp " +
         " JOIN sp.monthObj mon " +
         " JOIN sp.studentObj stObj " +
         " JOIN stObj.member m  " +
         " JOIN sp.groupObj " +
         " WHERE sp.groupObj.id = :id ").setParameter( "id", groupId ).getResultList();

    }


    public List<Object> getStudentDebtsList(int groupId)
    {
        return this.getEntityManager().createQuery("SELECT new hqlmappers.StudentPaymentDebt(sb.amount,mon.title, sb.lesson_year, sb.groupObj.id, sb.studentObj.id, m.name ) " +
                " FROM StudentDebt sb " +
                " JOIN sb.monthObj mon " +
                " JOIN sb.studentObj stObj " +
                " JOIN stObj.member m  " +
                " JOIN sb.groupObj " +
                " WHERE sb.groupObj.id = :id ").setParameter( "id", groupId ).getResultList();
    }


    public List<Object> getTeacherPaymentsList(int groupId)
    {
        return this.getEntityManager().createQuery("SELECT tp.amount, tp.lesson_year,mon.title" +
                " FROM TeacherPayment tp " +
                " JOIN tp.groupObj " +
                " JOIN tp.monthObj mon " +
                " WHERE tp.groupObj.id = :id ").setParameter( "id", groupId ).getResultList();
    }



    public List<TeacherDebt> getTeacherDebtsList(int groupId)
    {
        return this.getEntityManager().createQuery("SELECT tb.amount, tb.lesson_year,mon.title" +
                " FROM TeacherDebt tb " +
                " JOIN tb.groupObj " +
                " JOIN tb.monthObj mon " +
                " WHERE tb.groupObj.id = :id ").setParameter( "id", groupId ).getResultList();
    }



    public List<TimetableDTO> getHistory(int  groupId)
    {
        return  this.getEntityManager().createQuery("SELECT new hqlmappers.TimetableDTO(hs.id,  hs.started, hs.duration, rm.title, hs.cancelled, hs.wage, hs.fee) " +
                " FROM HistoryModel hs  JOIN hs.room rm " +
                " JOIN hs.groupObj gr " +
                " JOIN gr.speedObj spd " +
                " JOIN gr.ageObj ag " +
                " JOIN gr.daskalos dsk JOIN dsk.member mb " +
                " JOIN gr.courseObj crs WHERE gr.id= id", TimetableDTO.class).setParameter( "id", groupId ).getResultList();
    }




}
