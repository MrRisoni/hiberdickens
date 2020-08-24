package repositories;

import core.Utilities;
import core.WaterClock;
import hqlmappers.StudentRecord;
import hqlmappers.TeacherRecord;
import hqlmappers.TimetableDTO;
import models.HibernateUtil;
import models.TeacherPayment;
import pojos.TeacherRecordsAPI;

import java.util.HashMap;
import java.util.List;

public class TeacherRepository extends Repository {

    public TeacherRepository() {
        this.setEntityManager(HibernateUtil.getEM());
    }

    public List<TeacherPayment> getTeacherPayments(Long teacherId) {

        return this.getEntityManager().createQuery("SELECT new hqlmappers.PaymentDebtDTO(tp.amount,mon.title, tp.lesson_year, tp.groupObj.id, tp.teacherObj.id, '',courseObj.title ) " +
                " FROM TeacherPayment tp " +
                " JOIN tp.monthObj mon " +
                " JOIN tp.groupObj  " +
                " JOIN tp.groupObj.courseObj courseObj " +
                " WHERE tp.teacherObj.id = :tid ORDER BY  mon.id ASC,tp.lesson_year ASC ").setParameter("tid", teacherId).getResultList();

    }

    public List<TeacherPayment> getTeacherDebts(Long teacherId) {

        return this.getEntityManager().createQuery("SELECT new hqlmappers.PaymentDebtDTO(tb.amount,mon.title, tb.lesson_year, tb.groupObj.id, tb.teacherObj.id, '',courseObj.title ) " +
                " FROM TeacherDebt tb " +
                " JOIN tb.monthObj mon " +
                " JOIN tb.groupObj  " +
                " JOIN tb.groupObj.courseObj courseObj " +
                " WHERE tb.teacherObj.id = :tid ORDER BY  mon.id ASC,tb.lesson_year ASC ").setParameter("tid", teacherId).getResultList();
    }


    public List<TimetableDTO> getTeacherTimeTable(Long teacherId) {
        return this.getEntityManager().createQuery("SELECT new hqlmappers.TimetableDTO(hs.id, gr.id,uhr.id, crs.title,mb.name, ag.title, spd.title, hs.started, hs.duration, rm.title, hs.cancelled, hs.wage, hs.fee) " +
                " FROM HistoryModel hs  JOIN hs.room rm " +
                " JOIN hs.groupObj gr " +
                " JOIN hs.hour uhr " +
                " JOIN gr.speedObj spd " +
                " JOIN gr.ageObj ag " +
                " JOIN hs.daskalos dsk JOIN dsk.member mb " +
                " JOIN gr.courseObj crs WHERE dsk.id = :tid" +
                " AND hs.started >= :starttime " +
                " AND hs.started <= :endtime ORDER  BY hs.started ASC ", TimetableDTO.class)
                .setParameter("starttime", WaterClock.getDate())
                .setParameter("endtime", WaterClock.getDateAWeekAhead())
                .setParameter("tid",teacherId).getResultList();
    }


    public TeacherRecordsAPI getTeachersList(int currentPage, int perPage, String sortOrder, String sortProperty)
    {
        String hql = "SELECT new hqlmappers.TeacherRecord(t.id, CONCAT(m.name,' ',m.surname), m.created_at, t.numGroups, t.totalPayed, t.remainingDebt) " +
                " FROM Teacher t " +
                " JOIN t.member m ";

        String sortPropertySQL = " ORDER BY t.remainingDebt ";
        String sortBySQL = sortOrder.equals("ASC") ? "ASC" : "DESC";

        hql += sortPropertySQL + sortBySQL;

        String sqlCount = "SELECT id FROM teachers";
        int totalRecords = this.getEntityManager().createNativeQuery(sqlCount).getResultList().size();


        HashMap<String,Integer> pages = Utilities.getPaginationPages(currentPage, perPage, totalRecords);

        List<TeacherRecord> results =  this.getEntityManager().createQuery(hql).setFirstResult(pages.get("start")).setMaxResults(perPage).getResultList();


        TeacherRecordsAPI rsp = new TeacherRecordsAPI();
        rsp.setTeachers(results);
        rsp.setCurrentPage(currentPage);
        rsp.setTotalPages(pages.get("totalPages"));
        rsp.setTotalRecords(totalRecords);

        return rsp;


    }


}
