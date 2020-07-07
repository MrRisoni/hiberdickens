package hello;

import hqlmappers.TimetableDTO;
import models.HibernateUtil;
import models.TeacherPayment;
import org.springframework.web.bind.annotation.*;
import repositories.TeacherRepository;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

@CrossOrigin
@RestController
public class TeacherController {

    @RequestMapping(value = "/api/teacher/info/{teacherId}", method = RequestMethod.GET)
    public HashMap<String, Object> getPayments(@PathVariable int teacherId) {

        HashMap<String, Object> rsp = new HashMap<>();
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

        TeacherRepository tchRepo = new TeacherRepository();
        rsp.put("payments", tchRepo.getTeacherPayments(teacherId));
        rsp.put("debts", tchRepo.getTeacherDebts(teacherId));

        List<TimetableDTO> timetabl = tchRepo.getTeacherTimeTable(teacherId);
        rsp.put("timetable", timetabl);

        List<String> days = new ArrayList<>();

        days = timetabl.stream().map(el -> {
            try {
              //  return formatter.parse(formatter.format(el.getStarted())).toString();
                return formatter.format(el.getStarted()).toString();

            } catch (Exception ex) {
                return "";
            }
        }).collect(Collectors.toList());

        days = days.stream().distinct().collect(Collectors.toList());

        rsp.put("days", days);

        return rsp;

    }
}
