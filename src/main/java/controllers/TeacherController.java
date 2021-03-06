package controllers;

import hqlmappers.TimetableDTO;
import logic.MiniHour;
import models.HibernateUtil;
import models.groups.HourModel;
import models.people.Member;
import models.people.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pojos.TeacherRecordsAPI;
import repositories.GeneralRepository;
import repositories.TeacherRepository;
import spring_repos.MemberRepository;
import spring_repos.SprTeacherRepository;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@RestController
public class TeacherController {

    @Autowired
    SprTeacherRepository tchRepoSpr;

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
    public HashMap<String,Object> getData(@PathVariable Long teacherId, Model mod) {

        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        DateFormat hourFormatter = new SimpleDateFormat("HH:mm");

        Optional<Teacher> searchResult = tchRepoSpr.findById(teacherId);
        Teacher daskalos =searchResult.orElse(null);

        HashMap<String,Object> rsp = new HashMap<>();

        
        rsp.put("courses",daskalos.getCourses());

        TeacherRepository tchRepo = new TeacherRepository();
        rsp.put("payments", tchRepo.getTeacherPayments(teacherId));
        rsp.put("debts", tchRepo.getTeacherDebts(teacherId));

        List<TimetableDTO> timetabl = tchRepo.getTeacherTimeTable(teacherId);

        List<String> days = new ArrayList<>();

        days = timetabl.stream().map(el -> {
            try {
                return formatter.format(el.getStarted()).toString();

            } catch (Exception ex) {
                return "";
            }
        }).collect(Collectors.toList());

        days = days.stream().distinct().collect(Collectors.toList());
        days.add("#");
        days.add(0, "#");
        rsp.put("days", days);

        GeneralRepository gRepo = new GeneralRepository();
        List<HourModel> hoursList = gRepo.getHours();

        ArrayList<MiniHour> hourRanges = new ArrayList<>();

        for (int i = 0; i < hoursList.size() - 1; i++) {
            int startin = Integer.parseInt(hoursList.get(i).getTitle().substring(0, 2)) * 60 + Integer.parseInt(hoursList.get(i).getTitle().substring(2));
            int endin = Integer.parseInt(hoursList.get(i + 1).getTitle().substring(0, 2)) * 60 + Integer.parseInt(hoursList.get(i + 1).getTitle().substring(2));

            String aus_von = hoursList.get(i).getTitle() + "-" + hoursList.get(i + 1).getTitle();

            hourRanges.add(new MiniHour(startin, endin, aus_von));
        }

        ArrayList<Object> finalTimeTabling = new ArrayList<>(); // preservers order of insertion

        for (int h = 0; h < hourRanges.size(); h++) {
            System.out.println(hourRanges.get(h).getTitle());
            ArrayList<String> thisHour = new ArrayList<>();

            thisHour.add(hourRanges.get(h).getTitle());

            for (int d = 1; d < days.size() - 1; d++) { // skip #
                ArrayList<String> matchedActivities = new ArrayList<>();

                for (TimetableDTO actObj : timetabl) {
                    String niceDayFormat = formatter.format(actObj.getStarted()).toString();
                    String niceHourFormat = hourFormatter.format(actObj.getStarted()).toString();
                    int uhr = Integer.parseInt(niceHourFormat.substring(0, 2));
                    int minutes = Integer.parseInt(niceHourFormat.substring(3));

                    int localStarting = uhr * 60 + minutes;
                    int localEnding = localStarting + 90;

                    if (niceDayFormat.equals(days.get(d))) {
                        if (localStarting <= hourRanges.get(h).getStartin()) {
                            if (localEnding >= hourRanges.get(h).getEnding()) {
                                matchedActivities.add(actObj.getCourseName());
                            }
                        }
                    }

                } // end for timetable
                thisHour.add(String.join(",", matchedActivities));

            } // end for days

            thisHour.add(hourRanges.get(h).getTitle());
            finalTimeTabling.add(thisHour);
        } // end for hours

        rsp.put("timetable", timetabl); // delete this later
        rsp.put("timetabling", finalTimeTabling);


      return  rsp;

    }
}


