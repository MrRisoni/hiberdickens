package repositories;

import controllers.Utilities;
import controllers.WaterClock;
import hqlmappers.*;
import models.HibernateUtil;
import models.money.StudentDebt;
import models.money.StudentPayment;
import pojos.StudentRecordsAPI;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

public class StudentRepository extends Repository {

    public StudentRepository() {
        this.setEntityManager(HibernateUtil.getEM());
    }

    public List<StudentPayment> getStudentPayments(Long studentId) {

        return this.getEntityManager().createQuery("SELECT new hqlmappers.PaymentDebtDTO(sp.amount,mon.title, sp.lesson_year, sp.groupObj.id, sp.studentObj.id, '',courseObj.title ) " +
                " FROM StudentPayment sp " +
                " JOIN sp.monthObj mon " +
                " JOIN sp.groupObj  " +
                " JOIN sp.groupObj.courseObj courseObj " +
                " WHERE sp.studentObj.id = :sid ORDER BY  mon.id ASC,sp.lesson_year ASC ")
                .setParameter("sid", studentId)
                .setHint("org.hibernate.cacheable", true)
                .getResultList();

    }

    public List<StudentDebt> getStudentDebts(Long studentId) {
        return this.getEntityManager().createQuery("SELECT new hqlmappers.PaymentDebtDTO(stb.amount,mon.title, stb.lesson_year, stb.groupObj.id, stb.studentObj.id, '',courseObj.title ) " +
                " FROM StudentDebt stb " +
                " JOIN stb.monthObj mon " +
                " JOIN stb.groupObj  " +
                " JOIN stb.groupObj.courseObj courseObj " +
                " WHERE stb.studentObj.id = :sid ORDER BY  mon.id ASC,stb.lesson_year ASC ")
                .setParameter("sid", studentId)
                .setHint("org.hibernate.cacheable", true)
                .getResultList();
    }

    public List<StudentGroupDTO> getStudentGroups(Long studentId){
        return  this.getEntityManager().createQuery("SELECT new hqlmappers.StudentGroupDTO(grst.groupObj.id,courseObj.title,ageObj.title,speedObj.title ,grst.joined,grst.dropped ,grst.totalPayed, grst.totalDebt ) " +
                " FROM GroupStudent grst" +
                " JOIN grst.groupObj  " +
                " JOIN grst.groupObj.courseObj courseObj " +
                " JOIN grst.groupObj.ageObj ageObj " +
                " JOIN grst.groupObj.speedObj speedObj " +
                " WHERE grst.studentObj.id = :sid ")
                .setParameter("sid",studentId)
                .setHint("org.hibernate.cacheable", true)
                .getResultList();
    }

    public List<ExamResultTextDTO> getMockTextResults(Long studentId)
    {
        return  this.getEntityManager().createQuery("SELECT new hqlmappers.ExamResultTextDTO(mockResText.id,courseObj.title , exObj.created_at,mockResText.gradeObj.title) " +
                " FROM MockExamResultText mockResText" +
                " JOIN mockResText.gradeObj  " +
                " JOIN mockResText.mockExamObj exObj  " +
                " JOIN mockResText.mockExamObj.groupObj  " +
                " JOIN mockResText.mockExamObj.groupObj.courseObj courseObj " +
                " WHERE mockResText.student.id = :sid ")
                .setParameter("sid",studentId)
                .setHint("org.hibernate.cacheable", true)
                .getResultList();
    }

    public List<ExamResultTextDTO> getMockNumericResults(Long studentId)
    {
        return  this.getEntityManager().createQuery("SELECT new hqlmappers.ExamResultNumberDTO(mockResNumber.id,courseObj.title , exObj.created_at,mockResNumber.grade) " +
                " FROM MockExamResultNumeric mockResNumber" +
                " JOIN mockResNumber.mockExamObj exObj  " +
                " JOIN mockResNumber.mockExamObj.groupObj  " +
                " JOIN mockResNumber.mockExamObj.groupObj.courseObj courseObj " +
                " WHERE mockResNumber.student.id = :sid ")
                .setParameter("sid",studentId)
                .setHint("org.hibernate.cacheable", true)
                .getResultList();
    }

    public List<TimetableDTO> getStudentTimeTable(Long studentId) {
        List<Object[]> result = this.getEntityManager().createNativeQuery(" SELECT hs.id AS histId,gr.id AS groupId ,uhr.id AS uhrId, crs.title AS courseTitle ,ag.title AS ageTitle ,spd.title AS speedTitle ,hs.started ,hs.duration, rm.title AS roomTitle, hs.cancelled, hs.wage, hs.fee" +
                " FROM history hs" +
                " JOIN groupakia gr ON gr.id= hs.group_id" +
                " JOIN rooms rm ON rm.id = hs.room_id" +
                " JOIN hours uhr ON uhr.id =hs.hour_id" +
                " JOIN ages ag ON ag.id = gr.age_id" +
                " JOIN speeds spd ON spd.id = gr.speed_id" +
                " JOIN courses crs ON crs.id = gr.course_id" +
                " JOIN group_students grst ON grst.group_id = gr.id" +
                " WHERE grst.student_id = :sid" +
                " AND hs.started >= :starttime " +
                " AND hs.started <= :endtime ORDER  BY hs.started ASC ")
                .setParameter("starttime", WaterClock.getDate())
                .setParameter("endtime", WaterClock.getDateAWeekAhead())
                .setParameter("sid",studentId).getResultList();

        return result.stream().map( reObj -> {
            Long historyId = Long.parseLong(reObj[0].toString());
            Long groupId = Long.parseLong(reObj[1].toString());
            Long hourId = Long.parseLong(reObj[2].toString());
            String courseTitle = reObj[3].toString();
            String ageTitle = reObj[4].toString();
            String speedTitle = reObj[5].toString();
            Date starts = (Date) reObj[6];
            float duration = Float.parseFloat(reObj[7].toString());
            String roomTitle = reObj[8].toString();
            int cancelled =  (reObj[9].toString() == "false") ? 0 : 1;
            float wage = 0f;
            float fee = Float.parseFloat(reObj[11].toString());

            return new TimetableDTO(historyId, groupId, hourId, courseTitle, "", ageTitle, speedTitle, starts,  duration, roomTitle, cancelled, wage,  fee);
        }).collect(Collectors.toList());


    }


    public List<TimetableDTO> getTimetableHQL(Long studentId) {
        return this.getEntityManager().createQuery("SELECT new hqlmappers.TimetableDTO(hs.id, gr.id,uhr.id, crs.title,'', ag.title, spd.title, hs.started, hs.duration, rm.title, hs.cancelled, hs.wage, hs.fee) " +
                " FROM HistoryModel hs  JOIN hs.room rm " +
                " JOIN hs.groupObj gr " +
                " JOIN hs.hour uhr " +
                " JOIN gr.speedObj spd " +
                " JOIN gr.ageObj ag " +
                " JOIN gr.studentsList stdList  " +
                " JOIN  stdList.studentObj studObj  " +
                " JOIN gr.courseObj crs WHERE studObj.id = :sid" +
                " AND hs.started >= :starttime " +
                " AND hs.started <= :endtime ORDER  BY hs.started ASC ", TimetableDTO.class)
                .setParameter("starttime", WaterClock.getDate())
                .setParameter("endtime", WaterClock.getDateAWeekAhead())
                .setParameter("sid",studentId)
                .setHint("org.hibernate.cacheable", true)
                .getResultList();
    }


    public List<AbsencyDTO> getAbsenciesList(Long studentId)
    {
        return this.getEntityManager().createQuery("SELECT new hqlmappers.AbsencyDTO(hs.id, hs.started, crs.title, abs.justified) " +
                " FROM Absency abs " +
                " JOIN abs.histObj hs " +
                " JOIN abs.histObj.groupObj  " +
                " JOIN abs.histObj.groupObj.courseObj crs  " +
                " JOIN abs.studentObj stObj WHERE stObj.id = :sid", AbsencyDTO.class)
                .setParameter("sid",studentId)
                .setHint("org.hibernate.cacheable", true)
                .getResultList();

    }

    public StudentRecordsAPI getStudentsList(int currentPage,int perPage,String sortOrder,String sortProperty)
    {
        String hql = "SELECT new hqlmappers.StudentRecord(st.id, CONCAT(m.name,' ',m.surname), m.created_at, st.numGroups, st.totalPayed, st.remainingDebt,st.lastPaymentDate) " +
                " FROM Student st " +
                " JOIN st.member m ";

        String sortPropertySQL = " ORDER BY st.remainingDebt ";
        String sortBySQL = sortOrder.equals("ASC") ? "ASC" : "DESC";

        hql += sortPropertySQL + sortBySQL;

        String sqlCount = "SELECT id FROM students";
        int totalRecords = this.getEntityManager().createNativeQuery(sqlCount).getResultList().size();

        HashMap<String,Integer> pages = Utilities.getPaginationPages(currentPage, perPage, totalRecords);
        List<StudentRecord> results =  this.getEntityManager().createQuery(hql).setFirstResult(pages.get("start")).setMaxResults(perPage).getResultList();

        StudentRecordsAPI rsp = new StudentRecordsAPI();
        rsp.setStudents(results);
        rsp.setCurrentPage(currentPage);
        rsp.setTotalPages(pages.get("totalPages"));
        rsp.setTotalRecords(totalRecords);
        return rsp;
    }
}
