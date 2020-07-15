package core;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;
import models.*;
import org.hibernate.Session;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
public class CoursesController {


    @RequestMapping(value=  "/api/courses" , method = RequestMethod.GET)
    public List<CourseModel> getCourses()
    {
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
           return session.createCriteria(CourseModel.class).list();
        }
        catch (Exception ex) {
            return null;
        }
    }
}
