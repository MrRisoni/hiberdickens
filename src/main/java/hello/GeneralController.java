package hello;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import models.*;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import repositories.GeneralRepository;
import repositories.GroupRepository;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

@CrossOrigin
@RestController
public class GeneralController {

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

    @RequestMapping(value = "/api/classes", method = RequestMethod.GET)
    public List<SchoolClass> getClasses() {

        GeneralRepository genRepo = new GeneralRepository();
        genRepo.setEntityManager(HibernateUtil.getEM());
        return  genRepo.getClasses();
    }

    @RequestMapping(value = "/api/course_types", method = RequestMethod.GET)
    public List<CourseType> getCourseTypes() {
        GeneralRepository genRepo = new GeneralRepository();
        genRepo.setEntityManager(HibernateUtil.getEM());
        return  genRepo.getCourseTypes();
    }

    @RequestMapping(value = "/api/disciplines", method = RequestMethod.GET)
    public List<Discipline> getDisciplines() {
        GeneralRepository genRepo = new GeneralRepository();
        genRepo.setEntityManager(HibernateUtil.getEM());
        return  genRepo.getDisciplines();
    }

    @RequestMapping(value = "/api/ages", method = RequestMethod.GET)
    public List<Age> getAges() {
        GeneralRepository genRepo = new GeneralRepository();
        genRepo.setEntityManager(HibernateUtil.getEM());
        return  genRepo.getAges();
    }

    @RequestMapping(value = "/api/speeds", method = RequestMethod.GET)
    public List<Speed> getSpeeds() {
        GeneralRepository genRepo = new GeneralRepository();
        genRepo.setEntityManager(HibernateUtil.getEM());
        return  genRepo.getSpeeds();
    }

    @RequestMapping(value = "/api/buildings", method = RequestMethod.GET)
    public String getBuildings() {
        return "hello greeeting";
    }

}

