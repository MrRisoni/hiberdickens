package hello;

import models.HibernateUtil;
import models.TeacherPayment;
import org.springframework.web.bind.annotation.*;
import repositories.TeacherRepository;

import java.util.HashMap;

@CrossOrigin
@RestController
public class TeacherController {

    @RequestMapping(value = "/api/teacher/info/{teacherId}", method = RequestMethod.GET)
    public HashMap<String,Object> getPayments(@PathVariable int teacherId) {
        HashMap<String,Object> rsp = new HashMap<>();

        TeacherRepository tchRepo = new TeacherRepository();
        rsp.put("payments",tchRepo.getTeacherPayments(teacherId));
        rsp.put("debts",tchRepo.getTeacherDebts(teacherId));
        rsp.put("timetable",tchRepo.getTeacherTimeTable(teacherId));

        
        return  rsp;
    }
}
