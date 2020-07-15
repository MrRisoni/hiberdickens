package core;

import org.springframework.web.bind.annotation.*;
import repositories.StudentRepository;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;

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
        rsp.put("groups",stdRepo.getStudentGroups(studentId));
        rsp.put("mockResultsText",stdRepo.getMockTextResults(studentId));
        rsp.put("mockResultsNumeric",stdRepo.getMockNumericResults(studentId));
        rsp.put("timetable",stdRepo.getStudentTimeTable(studentId));
        return rsp;

    }
}
