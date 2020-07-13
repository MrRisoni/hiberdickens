package repositories;

import hqlmappers.ExamResultTextDTO;
import hqlmappers.StudentGroupDTO;
import models.HibernateUtil;
import models.StudentDebt;
import models.StudentPayment;

import java.util.List;

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
                " WHERE sp.studentObj.id = :sid ORDER BY  mon.id ASC,sp.lesson_year ASC ").setParameter("sid", studentId).getResultList();

    }

    public List<StudentDebt> getStudentDebts(Long studentId) {
        return this.getEntityManager().createQuery("SELECT new hqlmappers.PaymentDebtDTO(stb.amount,mon.title, stb.lesson_year, stb.groupObj.id, stb.studentObj.id, '',courseObj.title ) " +
                " FROM StudentDebt stb " +
                " JOIN stb.monthObj mon " +
                " JOIN stb.groupObj  " +
                " JOIN stb.groupObj.courseObj courseObj " +
                " WHERE stb.studentObj.id = :sid ORDER BY  mon.id ASC,stb.lesson_year ASC ").setParameter("sid", studentId).getResultList();
    }

    public List<StudentGroupDTO> getStudentGroups(Long studentId){
        return  this.getEntityManager().createQuery("SELECT new hqlmappers.StudentGroupDTO(grst.groupObj.id,courseObj.title,ageObj.title,speedObj.title ,grst.joined,grst.dropped ) " +
                " FROM GroupStudent grst" +
                " JOIN grst.groupObj  " +
                " JOIN grst.groupObj.courseObj courseObj " +
                " JOIN grst.groupObj.ageObj ageObj " +
                " JOIN grst.groupObj.speedObj speedObj " +
                " WHERE grst.studentObj.id = :sid ").setParameter("sid",studentId).getResultList();
    }

    public List<ExamResultTextDTO> getMockTextResults(Long studentId)
    {
        return  this.getEntityManager().createQuery("SELECT new hqlmappers.ExamResultTextDTO(mockResText.id,courseObj.title , exObj.created_at,mockResText.gradeObj.title) " +
                " FROM MockExamResultText mockResText" +
                " JOIN mockResText.gradeObj  " +
                " JOIN mockResText.mockExamObj exObj  " +
                " JOIN mockResText.mockExamObj.groupObj  " +
                " JOIN mockResText.mockExamObj.groupObj.courseObj courseObj " +
                " WHERE mockResText.student.id = :sid ").setParameter("sid",studentId).getResultList();
    }

    public List<ExamResultTextDTO> getMockNumericResults(Long studentId)
    {
        return  this.getEntityManager().createQuery("SELECT new hqlmappers.ExamResultNumberDTO(mockResNumber.id,courseObj.title , exObj.created_at,mockResNumber.grade) " +
                " FROM MockExamResultNumeric mockResNumber" +
                " JOIN mockResNumber.mockExamObj exObj  " +
                " JOIN mockResNumber.mockExamObj.groupObj  " +
                " JOIN mockResNumber.mockExamObj.groupObj.courseObj courseObj " +
                " WHERE mockResNumber.student.id = :sid ").setParameter("sid",studentId).getResultList();
    }
}
