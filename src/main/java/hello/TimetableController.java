package hello;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.fasterxml.jackson.databind.SerializationFeature;
import models.*;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import records.TimetableRcd;

import javax.persistence.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@CrossOrigin
@RestController
public class TimetableController {



    @Value("${app.beginning}")
    private String startingDate;



    @RequestMapping(value = "/api/flex", method = RequestMethod.GET)
    public String istoria()
    {
        try {
            EntityManager entityManager= HibernateUtil.getEM();
            System.out.println("###############################################");

            TypedQuery<TimetableRcd> timetable = entityManager.createQuery("SELECT new records.TimetableRcd(hs.id, gr.id, crs.title,mb.name, ag.title, spd.title, hs.started, hs.duration, rm.title, hs.cancelled, hs.wage, hs.fee) " +
                    " FROM HistoryModel hs  JOIN hs.room rm " +
                    " JOIN hs.groupObj gr " +
                    " JOIN gr.speedObj spd " +
                    " JOIN gr.ageObj ag " +
                    " JOIN gr.daskalos dsk JOIN dsk.member mb " +
                    " JOIN gr.courseObj crs",TimetableRcd.class);
            System.out.println("###############################################");

            ObjectMapper omp = new ObjectMapper();
            System.out.println(this.startingDate);
            return omp.writeValueAsString(timetable.getResultList());

        }
        catch (Exception ex) {
            ex.printStackTrace();
            return ex.getMessage();
        }
    }

}
