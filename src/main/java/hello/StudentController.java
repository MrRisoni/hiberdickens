package hello;

import hqlmappers.TimetableDTO;
import models.HourModel;
import org.springframework.web.bind.annotation.*;
import repositories.GeneralRepository;
import repositories.StudentRepository;
import repositories.TeacherRepository;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

@CrossOrigin
@RestController
public class StudentController {

    @RequestMapping(value = "/api/student/info/{studentId}", method = RequestMethod.GET)
    public HashMap<String, Object> getData(@PathVariable Long studentId) {

        HashMap<String, Object> rsp = new HashMap<>();
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        DateFormat hourFormatter = new SimpleDateFormat("HH:mm");

        StudentRepository stdRepo = new StudentRepository();
        rsp.put("payments", stdRepo.getStudentPayments(studentId));
        rsp.put("debts", stdRepo.getStudentDebts(studentId));


        return rsp;

    }
}
