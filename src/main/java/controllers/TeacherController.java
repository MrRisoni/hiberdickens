package controllers;

import dtos.TeacherResponseDto;
import hqlmappers.TimetableDTO;
import logic.MiniHour;
import models.HibernateUtil;
import models.groups.HourModel;
import models.people.Member;
import models.people.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pojos.TeacherRecordsAPI;
import repositories.GeneralRepository;
import repositories.TeacherRepository;
import services.TeacherSrvc;
import spring_repos.MemberRepository;
import spring_repos.SprTeacherRepository;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@RestController
public class TeacherController {

    @Autowired
    TeacherSrvc teacherSrvc;

    @Autowired
    MemberRepository membRepo;

    @RequestMapping(value = "/api/teacher/new")
    public void newTeacher()
    {
        Member m = new Member();
        m.setName("Henrik");
        m.setSurname("Vokakios");
        m.setPhone("210123456789");
        m.setEmail("foo@goo.gr");

        membRepo.save(m);

        Teacher t = new Teacher();
        t.setAfm("333232323");
        t.setAmka("2323232");

        t.setMember(m);

       // tchRepoSpr.save(t);
    }

    @RequestMapping(value = "/api/teachers", method = RequestMethod.GET)
    public TeacherRecordsAPI getTeachersList() {
        int perPage = 100;
        int currentPage = 1;

        TeacherRepository tchRp = new TeacherRepository();
        tchRp.setEntityManager(HibernateUtil.getEM());


        TeacherRecordsAPI tchapi = tchRp.getTeachersList(currentPage, perPage,"DESC","remainingDebt");
        return  tchapi;
    }

    @RequestMapping(value = "/api/teacher/info/{teacherId}", method = RequestMethod.GET)
    public ResponseEntity<TeacherResponseDto> getData(@PathVariable Long teacherId) {
        try {
            return new ResponseEntity<>(teacherSrvc.getTeacherDetails(teacherId),HttpStatus.OK);
        } catch (Exception ex) {
            ex.printStackTrace();
            return new ResponseEntity<>(null, HttpStatus.BAD_GATEWAY);
        }


    }
}


