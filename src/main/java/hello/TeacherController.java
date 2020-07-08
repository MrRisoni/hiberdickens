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
import java.util.*;
import java.util.stream.Collectors;

@CrossOrigin
@RestController
public class TeacherController {

    @RequestMapping(value = "/api/teacher/info/{teacherId}", method = RequestMethod.GET)
    public HashMap<String, Object> getPayments(@PathVariable int teacherId) {

        HashMap<String, Object> rsp = new HashMap<>();
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        DateFormat hourFormatter = new SimpleDateFormat("HH:mm");

        TeacherRepository tchRepo = new TeacherRepository();
        rsp.put("payments", tchRepo.getTeacherPayments(teacherId));
        rsp.put("debts", tchRepo.getTeacherDebts(teacherId));

        List<TimetableDTO> timetabl = tchRepo.getTeacherTimeTable(teacherId);

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
        days.add(0, "#");
        rsp.put("days", days);

        GeneralRepository gRepo = new GeneralRepository();
        List<HourModel> hoursList = gRepo.getHours();

        ArrayList<MiniHour> hourRanges = new ArrayList<>();


        for (int i = 0; i < hoursList.size() - 1; i++) {
            int startin = Integer.parseInt(hoursList.get(i).getTitle().substring(0, 2)) * 60 + Integer.parseInt(hoursList.get(i).getTitle().substring(2));
            int endin = Integer.parseInt(hoursList.get(i + 1).getTitle().substring(0, 2)) * 60 + Integer.parseInt(hoursList.get(i + 1).getTitle().substring(2));

            String aus_von = hoursList.get(i).getTitle() + "-" + hoursList.get(i + 1).getTitle();

           /* System.out.println(aus_von);
            System.out.println(hoursList.get(i).getTitle().substring(0,2));
            System.out.println(hoursList.get(i).getTitle().substring(2));
            System.out.println(startin + " " + endin);
*/
            hourRanges.add(new MiniHour(startin, endin, aus_von));
        }

        HashMap<String, Object> finalTimeTabling = new HashMap<>();


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
                                System.out.println(actObj.getCourseName() + " have smothing on " + niceDayFormat + " nd " + niceHourFormat + " ls " + localStarting + " le " + localEnding);
                                System.out.println("get start " + hourRanges.get(h).getStartin() + " " + hourRanges.get(h).getEnding());
                                matchedActivities.add(actObj.getCourseName());
                            }
                            
                        }
                    }

                    //  System.out.println("have smothing on " + niceDayFormat + " nd " + niceHourFormat + " ls " + localStarting + " le " + localEnding ) ;
                    //   System.out.println("day is  " + "  " + days.get(d)  +  "  "  + hourRanges.get(h).getStartin() + " " +hourRanges.get(h).getEnding() );

                    //   System.out.println("lstart " + localStarting + " rstart " + localEnding);

                } // end for timetable

                if (matchedActivities.size() > 0) {
                    System.out.println("Match activiles len " + matchedActivities.size());
                    System.out.println(String.join(",", matchedActivities));
                }
                thisHour.add(String.join(",", matchedActivities));


            } // end for days

            thisHour.add(hourRanges.get(h).getTitle());
            // finalTimeTabling.add(thisHour);
            finalTimeTabling.put(hourRanges.get(h).getTitle(), thisHour);

        } // end for hours


        rsp.put("timetable", timetabl); // delete this later
        rsp.put("timetabling", finalTimeTabling);

        return rsp;

    }
}


class MiniHour {
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