package hello;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import org.hibernate.criterion.Restrictions;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;
import com.google.gson.Gson;
import models.*;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
public class CoursesController {


    @RequestMapping(value=  "/api/courses" , method = RequestMethod.GET)
    public String getCourses()
    {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();

            List<CourseModel> coursesList = session.createCriteria(CourseModel.class)
                    .list();
            ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
            return ow.writeValueAsString(coursesList);
        }
        catch (Exception ex) {
            return "";
        }
    }
}
