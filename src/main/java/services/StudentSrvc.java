package services;

import dtos.StudentResponseDto;
import models.people.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import repositories.StudentRepository;

import javax.persistence.EntityManager;
import java.util.Optional;

@Service
public class StudentSrvc {

    private EntityManager entityManager;

    @Autowired
    spring_repos.StudentRepository studRepo;

    public StudentResponseDto getStudentData(Long studentId)
    {
        Optional<Student> result = studRepo.findById(studentId);
        Student student  =result.orElse(null);
        StudentRepository studentRepo = new StudentRepository();

        StudentResponseDto stdRsp = new StudentResponseDto();
        stdRsp.setLastPayed(student.getLastPaymentDate());
        stdRsp.setFullName(student.getMember().getName()+ " " + student.getMember().getSurname());
        stdRsp.setTotalPayed(student.getTotalPayed());
        stdRsp.setRemainDebt(student.getTotalDebt().subtract(student.getTotalPayed()));
        stdRsp.setAbscencies(studentRepo.getAbsenciesList(studentId));
        stdRsp.setPayments(studentRepo.getStudentPayments(studentId));
        stdRsp.setDebts(studentRepo.getStudentDebts(studentId));
        stdRsp.setGroups(studentRepo.getStudentGroups(studentId));
        stdRsp.setTimetable(studentRepo.getTimetableHQL(studentId));

        //  rsp.put("mockResultsText",stdRepo.getMockTextResults(studentId));
        //  rsp.put("mockResultsNumeric",stdRepo.getMockNumericResults(studentId));

        // rsp.put("parents",student.getParents());
        //  rsp.put("discounts",student.getDiscountList());
        return stdRsp;
    }
}
