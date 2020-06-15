package hello;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import models.Building;
import models.CourseModel;
import models.HibernateUtil;
import models.Language;
import org.hibernate.Session;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

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
            Session session = HibernateUtil.getSessionFactory().openSession();
            List<Language> langlist = session.createCriteria(Language.class)
                    .list();
            ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
            return ow.writeValueAsString(langlist);
        }
        catch (Exception ex){
            return ex.getMessage();
        }
    }
}
