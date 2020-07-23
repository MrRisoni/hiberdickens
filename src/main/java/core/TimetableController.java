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
            System.out.println("###############################################");

            TypedQuery<TimetableDTO> timetable = entityManager.createQuery("SELECT new hqlmappers.TimetableDTO(hs.id, gr.id,hr.id, crs.title,mb.name, ag.title, spd.title, hs.started, hs.duration, rm.title, hs.cancelled, hs.wage, hs.fee) " +
                    " FROM HistoryModel hs  JOIN hs.room rm " +
                    " JOIN hs.groupObj gr " +
                    " JOIN hs.hour hr " +
                    " JOIN gr.speedObj spd " +
                    " JOIN gr.ageObj ag " +
                    " JOIN hs.daskalos dsk JOIN dsk.member mb " +
                    " JOIN gr.courseObj crs", TimetableDTO.class);
            System.out.println("###############################################");

            modelo.addAttribute("timetable",timetable.getResultList());


            return "timetable";
        }
        catch (Exception ex) {
            ex.printStackTrace();
            return ex.getMessage();
        }
    }

}
