package repositories;

import hqlmappers.TimetableDTO;
import models.HibernateUtil;
import models.TeacherPayment;

import javax.persistence.TypedQuery;
import java.util.List;

public class TeacherRepository extends Repository {

    public TeacherRepository() {
        this.setEntityManager(HibernateUtil.getEM());
    }

    public List<TeacherPayment> getTeacherPayments(int teacherId) {

        return this.getEntityManager().createQuery("SELECT new hqlmappers.PaymentDebtDTO(tp.amount,mon.title, tp.lesson_year, tp.groupObj.id, tp.teacherObj.id, '',courseObj.title ) " +
                " FROM TeacherPayment tp " +
                " JOIN tp.monthObj mon " +
                " JOIN tp.groupObj  " +
                " JOIN tp.groupObj.courseObj courseObj " +
                " WHERE tp.teacherObj.id = :tid ORDER BY  mon.id ASC,tp.lesson_year ASC ").setParameter("tid", teacherId).getResultList();

    }

    public List<TeacherPayment> getTeacherDebts(int teacherId) {

        return this.getEntityManager().createQuery("SELECT new hqlmappers.PaymentDebtDTO(tb.amount,mon.title, tb.lesson_year, tb.groupObj.id, tb.teacherObj.id, '',courseObj.title ) " +
                " FROM TeacherDebt tb " +
                " JOIN tb.monthObj mon " +
                " JOIN tb.groupObj  " +
                " JOIN tb.groupObj.courseObj courseObj " +
                " WHERE tb.teacherObj.id = :tid ORDER BY  mon.id ASC,tb.lesson_year ASC ").setParameter("tid", teacherId).getResultList();
    }


    public List<TimetableDTO> getTeacherTimeTable(int teacherId) {
        return this.getEntityManager().createQuery("SELECT new hqlmappers.TimetableDTO(hs.id, gr.id, crs.title,mb.name, ag.title, spd.title, hs.started, hs.duration, rm.title, hs.cancelled, hs.wage, hs.fee) " +
                " FROM HistoryModel hs  JOIN hs.room rm " +
                " JOIN hs.groupObj gr " +
                " JOIN gr.speedObj spd " +
                " JOIN gr.ageObj ag " +
                " JOIN gr.daskalos dsk JOIN dsk.member mb " +
                " JOIN gr.courseObj crs WHERE dsk.id = :tid", TimetableDTO.class).setParameter("tid",teacherId).getResultList();
    }
}
