package repositories;


import core.Utilities;
import hqlmappers.GroupRecord;
import hqlmappers.TimetableDTO;
import models.groups.GroupModel;
import models.money.TeacherDebt;
import models.people.Member;
import pojos.GroupRecordsAPI;

import javax.persistence.Query;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

public class GroupRepository extends Repository {

    public GroupRepository() {
    }

    public GroupModel getGroup(Long groupId)
    {
        return this.getEntityManager().createQuery("FROM GroupModel WHERE id=:grid", GroupModel.class).setParameter("grid",groupId).getResultList().get(0);
    }

    public List<Member> getGroupTeachers(Long groupId) {
        return this.getEntityManager().createQuery("SELECT new models.people.Member(mb.id,mb.name,mb.surname,mb.phone,mb.created_at)  FROM GroupTeachers gt " +
                " JOIN gt.groupObj " +
                " JOIN gt.teacherObj " +
                " JOIN gt.teacherObj.member mb " +
                " WHERE gt.groupObj.id=:gid ", Member.class).setParameter("gid",groupId).getResultList();
    }

    public List<GroupMember> getGroupStudents(Long groupId) {

                Query qry = this.getEntityManager().createNativeQuery("SELECT gs.student_id , gs.joined,gs.dropped, CONCAT(m.name,' ',m.surname), " +
                " IF (CURRENT_DATE > gs.dropped, 1,0) AS hasDropped,  " +
                " gs.total_payed AS hasPayed, gs.total_debt AS remainingDebt  " +
                " FROM group_students gs  " +
                " JOIN students s ON s.id = gs.student_id  " +
                " JOIN members m ON m.id = s.member_id  " +
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
                " JOIN hs.groupObj gr WHERE gr.id= :id ORDER BY hs.started ASC", TimetableDTO.class).setParameter( "id", groupId )
              .setHint("org.hibernate.cacheable", true)
              .getResultList();

    }


    public GroupRecordsAPI getGroupsList(int currentPage, int perPage, String sortOrder, String sortProperty)
    {

        String sqlCount = "SELECT id FROM groupakia";
        int totalRecords = this.getEntityManager().createNativeQuery(sqlCount).getResultList().size();
        HashMap<String,Integer> pages = Utilities.getPaginationPages(currentPage, perPage, totalRecords);

        String hql = "SELECT new hqlmappers.GroupRecord(g.id,g.title,spd.title, age.title,fee.amount,wage.amount, " +
                "  g.created_at ,g.ends_at, g.studentsNum," +
                " g.sumHours, g.paymentsSumTeachers,g.paymentsSumStudents, g.remainingTeacherDebt ,g.remainingStudentDebt )" +
                "  FROM GroupModel g " +
                "  JOIN g.speedObj spd" +
                "  JOIN g.ageObj age" +
                "  JOIN g.feeObj fee" +
                "  JOIN g.wageObj wage " +
                "  WHERE g.active =1 ORDER BY g.remainingStudentDebt DESC";



        List<GroupRecord> results =  this.getEntityManager().createQuery(hql).setFirstResult(pages.get("start")).setMaxResults(perPage).getResultList();
;
        GroupRecordsAPI rsp = new GroupRecordsAPI();
        rsp.setGroups(results);
        rsp.setCurrentPage(currentPage);
        rsp.setTotalPages(pages.get("totalPages"));
        rsp.setTotalRecords(totalRecords);

        return rsp;
    }
}
