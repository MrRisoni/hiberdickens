package core;

import models.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import repositories.StudentRepository;
import spring_repos.MemberRepository;
import spring_repos.ParentRepository;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

@CrossOrigin
@RestController
public class StudentController {

    @Autowired
    MemberRepository membRepo;

    @Autowired
    ParentRepository parRepo;

    @Autowired
    spring_repos.StudentRepository studRepo;

    @RequestMapping(value = "/api/student/new")
    public void newStudent()
    {
        Suburb sb = new Suburb();
        sb.setId(2L);

        Member m = new Member();
        m.setName("Henrik");
        m.setSurname("Vokakios");
        m.setPhone("210123456789");
        m.setEmail("foo@goo.gr");
        m.setSuburbObj(sb);
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

    @RequestMapping(value = "/api/student/info/{studentId}", method = RequestMethod.GET)
    public HashMap<String, Object> getData(@PathVariable Long studentId) {

        HashMap<String, Object> rsp = new HashMap<>();
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        DateFormat hourFormatter = new SimpleDateFormat("HH:mm");

        Optional<Student> result = studRepo.findById(studentId);
        Student student  =result.orElse(null);
        StudentRepository stdRepo = new StudentRepository();
        rsp.put("absencies",stdRepo.getAbsenciesList(studentId));
        rsp.put("payments", stdRepo.getStudentPayments(studentId));
        rsp.put("debts", stdRepo.getStudentDebts(studentId));
        rsp.put("groups",stdRepo.getStudentGroups(studentId));
        rsp.put("mockResultsText",stdRepo.getMockTextResults(studentId));
        rsp.put("mockResultsNumeric",stdRepo.getMockNumericResults(studentId));
          rsp.put("timetable",stdRepo.getTimetableHQL(studentId));

        return rsp;

    }
}
