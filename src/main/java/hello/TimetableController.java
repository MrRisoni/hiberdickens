package hello;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import models.*;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import java.util.List;

@CrossOrigin
@RestController
public class TimetableController {

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
}
