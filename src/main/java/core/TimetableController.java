package core;

import models.*;
import models.groups.HourModel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import hqlmappers.TimetableDTO;
import repositories.GeneralRepository;
import spring_repos.*;

import javax.persistence.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;


@RestController
public class TimetableController {


    @Autowired
    private LanguageRepository lgrepo;

    @Autowired
    private AgeRepository agrp;

    @Autowired
    private SpeedRepository spdRp;

    @Autowired
    private CourseTypeRepository typeRsp;

    @Autowired
    private DisciplineRepository dscplRepo;


    @Value("${app.beginning}")
    private String startingDate;


    @RequestMapping(value = "/timetable", method = RequestMethod.GET)
    public String istoria(Model modelo)
    {
        try {
            EntityManager entityManager= HibernateUtil.getEM();
            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            DateFormat hourFormatter = new SimpleDateFormat("HH:mm");

            List<TimetableDTO> timetable = entityManager.createQuery("SELECT new hqlmappers.TimetableDTO(hs.id, gr.id,hr.id, crs.title,mb.name, ag.title, spd.title, hs.started, hs.duration, rm.title, hs.cancelled, hs.wage, hs.fee) " +
                    " FROM HistoryModel hs  JOIN hs.room rm " +
                    " JOIN hs.groupObj gr " +
                    " JOIN hs.hour hr " +
                    " JOIN gr.speedObj spd " +
                    " JOIN gr.ageObj ag " +
                    " JOIN hs.daskalos dsk JOIN dsk.member mb " +
                    " JOIN gr.courseObj crs" +
                    " WHERE hs.started >= :starttime " +
                    "  AND hs.started <= :endtime ORDER  BY hs.started ASC", TimetableDTO.class)
                    .setParameter("starttime",WaterClock.getDate())
                    .setParameter("endtime",WaterClock.getDateAWeekAhead())
                    .getResultList();

            List<String> days = new ArrayList<>();

            days = timetable.stream().map(el -> {
                try {
                    return formatter.format(el.getStarted()).toString();

                } catch (Exception ex) {
                    return "";
                }
            }).collect(Collectors.toList());

            days = days.stream().distinct().collect(Collectors.toList());
            days.add("#");
            days.add(0, "#");
            modelo.addAttribute("days", days);


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
                //System.out.println(hourRanges.get(h).getTitle());
                ArrayList<String> thisHour = new ArrayList<>();
    
                thisHour.add(hourRanges.get(h).getTitle());
    
                for (int d = 1; d < days.size() - 1; d++) { // skip #
                    ArrayList<String> matchedActivities = new ArrayList<>();
    
                    for (TimetableDTO actObj : timetable) {
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

            modelo.addAttribute("timetabling", finalTimeTabling);

            GeneralRepository genRepo = new GeneralRepository();
            genRepo.setEntityManager(HibernateUtil.getEM());
            modelo.addAttribute("classes",genRepo.getClasses());
            modelo.addAttribute("courseTypes",typeRsp.findAll());
            modelo.addAttribute("disciplines",dscplRepo.findAll());
            modelo.addAttribute("ages",agrp.findAll());
            modelo.addAttribute("speeds", spdRp.findAll());
            modelo.addAttribute("buildings",genRepo.getBuildings());
            modelo.addAttribute("languages",genRepo.getLanguages());

            return "timetable";
        }
        catch (Exception ex) {
            ex.printStackTrace();
            return ex.getMessage();
        }
    }

}
