package controllers;

import dtos.StudentResponseDto;
import models.general.Suburb;
import models.people.Member;
import models.people.ParentsModel;
import models.people.Student;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import pojos.StudentRecordsAPI;
import models.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import repositories.StudentRepository;
import services.StudentSrvc;
import services.TimetableSrvc;
import spring_repos.MemberRepository;
import spring_repos.ParentRepository;
import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

@RestController
public class StudentController {

    @Autowired
    MemberRepository membRepo;

    @Autowired
    ParentRepository parRepo;

    @Autowired
    spring_repos.StudentRepository studRepo;

    @Autowired
    StudentSrvc studentSrvc;

    @RequestMapping(value = "/api/student/update")
    public void updateStudent() {
        Optional<Member> fetched = membRepo.findById(198L);
        Member mb  =fetched.orElse(null);
        mb.setName("August");
      //  membRepo.save(mb);

    }

    @RequestMapping(value = "/api/student/new")
    public void newStudent()
    {
        Member m = new Member();
        m.setName("Henrik");
        m.setSurname("Vokakios");
        m.setPhone("210123456789");
        m.setEmail("foo@goo.gr");
        membRepo.save(m);

        Student st = new Student();
        st.setMember(m);
        studRepo.save(st);

        ParentsModel par = new ParentsModel();
        par.setName("Achilles");
        par.setSurname("Ovidius");
        par.setPhone("210123456789");

        Set<Student> paidia =new HashSet<>();
        paidia.add(st);

        par.setChildren(paidia);
        parRepo.save(par);
    }

    @RequestMapping(value = "/api/students", method = RequestMethod.GET)
    public StudentRecordsAPI getStudentsList() {
        int perPage = 100;
        int currentPage = 1;
        StudentRepository stRp = new StudentRepository();
        stRp.setEntityManager(HibernateUtil.getEM());
        StudentRecordsAPI stdApi = stRp.getStudentsList(currentPage, perPage,"DESC","remainingDebt");
        return  stdApi;
    }

    @RequestMapping(value = "/api/student/info/{studentId}", method = RequestMethod.GET)
    public ResponseEntity<StudentResponseDto> getData(@PathVariable Long studentId) {
        try {
            return new ResponseEntity<>(studentSrvc.getStudentData(studentId), HttpStatus.OK);
        }
        catch (Exception ex){
            return new ResponseEntity<>(null, HttpStatus.BAD_GATEWAY);
        }

    }
}
