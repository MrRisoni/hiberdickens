package repositories;

import models.HibernateUtil;
import models.StudentDebt;
import models.StudentPayment;
import models.TeacherPayment;

import java.util.List;

public class StudentRepository extends Repository {

    public StudentRepository() {
        this.setEntityManager(HibernateUtil.getEM());
    }

    public List<StudentPayment> getStudentPayments(int studentId) {

        return this.getEntityManager().createQuery("SELECT new hqlmappers.PaymentDebtDTO(sp.amount,mon.title, sp.lesson_year, sp.groupObj.id, sp.studentObj.id, '',courseObj.title ) " +
                " FROM StudentPayment sp " +
                " JOIN sp.monthObj mon " +
                " JOIN sp.groupObj  " +
                " JOIN sp.groupObj.courseObj courseObj " +
                " WHERE sp.studentObj.id = :sid ORDER BY  mon.id ASC,sp.lesson_year ASC ").setParameter("sid", studentId).getResultList();

    }

    public List<StudentDebt> getStudentDebts(int studentId) {
        return this.getEntityManager().createQuery("SELECT new hqlmappers.PaymentDebtDTO(stb.amount,mon.title, stb.lesson_year, stb.groupObj.id, stb.studentObj.id, '',courseObj.title ) " +
                " FROM StudentDebt stb " +
                " JOIN stb.monthObj mon " +
                " JOIN stb.groupObj  " +
                " JOIN stb.groupObj.courseObj courseObj " +
                " WHERE stb.studentObj.id = :sid ORDER BY  mon.id ASC,stb.lesson_year ASC ").setParameter("sid", studentId).getResultList();
    }
}
