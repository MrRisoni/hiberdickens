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


    @RequestMapping(value = "/api/buildings", method = RequestMethod.GET)
    public String getBuildings()
    {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            List<Building> buildings = session.createCriteria(Building.class)
                    .list();
            ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
            return ow.writeValueAsString(buildings);
        }
        catch (Exception ex){
            return ex.getMessage();
        }
    }


    @RequestMapping(value = "/api/languages", method = RequestMethod.GET)
    public String getLanguages()
    {
        try {
             EntityManager entityManager= HibernateUtil.getEM();

            TypedQuery<Language> ga = entityManager.createQuery("SELECT DISTINCT l FROM Language l INNER JOIN FETCH l.diplomas d WHERE d.active = 1",Language.class);
            List<Language> lg = ga.getResultList();

            ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
            return ow.writeValueAsString(lg);
        }
        catch (Exception ex){
            return ex.getMessage();
        }
    }


    @RequestMapping(value = "/api/coursetypes", method = RequestMethod.GET)
    public String getCourseTypes()
    {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            List<CourseType> typesList = session.createCriteria(CourseType.class)
                    .list();
            ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
            return ow.writeValueAsString(typesList);
        }
        catch (Exception ex){
            return ex.getMessage();
        }
    }


    @RequestMapping(value = "/api/schoolclasses", method = RequestMethod.GET)
    public String getSchoolClasses()
    {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            List<SchoolClass> classesList = session.createCriteria(SchoolClass.class)
                    .list();
            ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
            return ow.writeValueAsString(classesList);
        }
        catch (Exception ex){
            return ex.getMessage();
        }
    }

    @RequestMapping(value = "/api/timetable", method = RequestMethod.GET)
    public String timetable()
    {
        try {
            EntityManager entityManager= HibernateUtil.getEM();

            TypedQuery<HistoryModel> timetable = entityManager.createQuery("SELECT DISTINCT hs FROM HistoryModel hs WHERE started >= '" + startingDate + "'",HistoryModel.class);

            ObjectMapper omp = new ObjectMapper();
            omp.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);

            System.out.println(this.startingDate);
            return omp.writeValueAsString(timetable.getResultList());

        }
        catch (Exception ex) {
            return ex.getMessage();
        }
    }


    @RequestMapping(value = "/api/istoria", method = RequestMethod.GET)
    public String istoria()
    {
        try {
            EntityManager entityManager= HibernateUtil.getEM();
            System.out.println("###############################################");

            TypedQuery<TimetableRcd> timetable = entityManager.createQuery("SELECT new records.TimetableRcd(hs.id, gr.id, gr.title,  hs.started, hs.duration, rm.title)  FROM HistoryModel hs  JOIN hs.room rm JOIN hs.groupObj gr ",TimetableRcd.class);
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
