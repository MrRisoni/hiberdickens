package core;

import com.fasterxml.jackson.databind.ObjectMapper;
import models.HibernateUtil;
import models.exams.MockExam;
import models.exams.RealExam;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class ExamsController {

    @RequestMapping(value = "/api/mockexams", method = RequestMethod.GET)
    public String getMockExams() {
        try {
            ObjectMapper omp = new ObjectMapper();

            //  EntityManager entityManager =  HibernateUtil.getEM();

         return "foo";


        }
        catch(Exception ex) {
            ex.printStackTrace();
            return ex.getMessage();
        }
    }

    @RequestMapping(value = "/api/realexams", method = RequestMethod.GET)
    public String getRealExams() {
        try {
            ObjectMapper omp = new ObjectMapper();

            return "foo";



        }
        catch(Exception ex) {
            ex.printStackTrace();
            return ex.getMessage();
        }
    }
}
