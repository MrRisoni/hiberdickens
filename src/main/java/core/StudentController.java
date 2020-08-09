package core;

import form_posts.StudentListPostObj;
import models.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import repositories.StudentRepository;
import spring_repos.MemberRepository;
import spring_repos.ParentRepository;


import javax.servlet.http.HttpServletRequest;
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

    @Autowired
    spring_repos.StudentPagingRepository studPageRepo;

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

    @RequestMapping(value = "/students", method = RequestMethod.GET)
    public String getData(Model mod) {
        // pagination
        Pageable foo = PageRequest.of(0,5);
        mod.addAttribute("students",studPageRepo.findAll(foo));
        mod.addAttribute("currentPage",4);

        StudentListPostObj form = new StudentListPostObj();
        mod.addAttribute("formObj", form);

        return "studentsList";
    }

    @RequestMapping(value = "/students", method = RequestMethod.POST)
    public String paginateSubmit(@ModelAttribute StudentListPostObj formObj,Model mod,BindingResult bindingResult) {
        // pagination
        System.out.println("POSTTT");
        System.out.println(formObj.getPerPage());

        //Sort srt = new Sort(new Sort.Order(Sort.Direction.DESC, "remainingDebt"));

        Pageable foo = PageRequest.of(0,formObj.getPerPage(),Sort.by(Sort.Direction.DESC, "remainingDebt"));
        Page<Student> paginationResult = studPageRepo.findAll(foo);

        mod.addAttribute("students",paginationResult);
        mod.addAttribute("currentPage",4);
        mod.addAttribute("totalPages", paginationResult.getTotalPages());
        mod.addAttribute("totalRecords", paginationResult.getTotalElements());
        mod.addAttribute("itemsInPage", formObj.getPerPage());
        mod.addAttribute("formObj", formObj);

        return "studentsList";
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
        mod.addAttribute("fullName",student.getMember().getName()+ " " + student.getMember().getSurname());
        mod.addAttribute("totalPayed",student.getTotalPayed());
        mod.addAttribute("remainDebt",student.getTotalDebt().subtract(student.getTotalPayed()));
        mod.addAttribute("parents",student.getParents());
        mod.addAttribute("discounts",student.getDiscountList());
        System.out.println("Discounts!!");
        System.out.println(student.getDiscountList().size());
        return "studentDetails";

    }
}
