package core;

import com.fasterxml.jackson.databind.ObjectMapper;

import models.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import hqlmappers.TimetableDTO;

import javax.persistence.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@CrossOrigin
@Controller
public class TimetableController {



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

            return "timetable";
        }
        catch (Exception ex) {
            ex.printStackTrace();
            return ex.getMessage();
        }
    }

}
