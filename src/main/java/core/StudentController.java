package core;

import models.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
@Controller
public class StudentController {

    @Autowired
    MemberRepository membRepo;

    @Autowired
    ParentRepository parRepo;

    @Autowired
    spring_repos.StudentRepository studRepo;

    @RequestMapping(value = "/api/student/update")
    public void updateStudent() {
        Optional<Member> fetched = membRepo.findById(198L);
        Member mb  =fetched.orElse(null);
        mb.setName("August");
        membRepo.save(mb);

    }

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

    @RequestMapping(value = "/student/info/{studentId}", method = RequestMethod.GET)
    public String getData(@PathVariable Long studentId, Model mod) {

        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        DateFormat hourFormatter = new SimpleDateFormat("HH:mm");

        Optional<Student> result = studRepo.findById(studentId);
        Student student  =result.orElse(null);
        StudentRepository stdRepo = new StudentRepository();
        mod.addAttribute("lastPayed",student.getLastPaymentDate());
        mod.addAttribute("absencies",stdRepo.getAbsenciesList(studentId));
        mod.addAttribute("payments", stdRepo.getStudentPayments(studentId));
        mod.addAttribute("debts", stdRepo.getStudentDebts(studentId));
        mod.addAttribute("groups",stdRepo.getStudentGroups(studentId));
        mod.addAttribute("mockResultsText",stdRepo.getMockTextResults(studentId));
        mod.addAttribute("mockResultsNumeric",stdRepo.getMockNumericResults(studentId));
        mod.addAttribute("timetable",stdRepo.getTimetableHQL(studentId));

        return "studentDetails";

    }
}
