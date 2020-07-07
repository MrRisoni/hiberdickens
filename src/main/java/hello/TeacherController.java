package hello;

import hqlmappers.TimetableDTO;
import models.HibernateUtil;
import models.HourModel;
import models.TeacherPayment;
import org.springframework.web.bind.annotation.*;
import repositories.GeneralRepository;
import repositories.GroupRepository;
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
        days.add("#");
        days.add(0,"#");
        rsp.put("days", days);

        GeneralRepository gRepo = new GeneralRepository();
        List<HourModel> hoursList = gRepo.getHours();

        HashMap<String,MiniHour> hourMap = new HashMap<>();
        for (int i=0;i < hoursList.size()-1;i++) {
            int startin = hoursList.get(i).getId();
            int endin = hoursList.get(i+1).getId();
            String aus_von = hoursList.get(i).getTitle()+ "-" + hoursList.get(i+1).getTitle();
            hourMap.put(aus_von,new MiniHour(startin,endin,aus_von));

        }

        rsp.put("timinig",hourMap);
        return rsp;

    }
}


class MiniHour{
    private int startin;
    private int ending;
    private String title;

    public MiniHour(int startin, int ending, String title) {
        this.startin = startin;
        this.ending = ending;
        this.title = title;
    }

    public int getStartin() {
        return startin;
    }

    public void setStartin(int startin) {
        this.startin = startin;
    }

    public int getEnding() {
        return ending;
    }

    public void setEnding(int ending) {
        this.ending = ending;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}