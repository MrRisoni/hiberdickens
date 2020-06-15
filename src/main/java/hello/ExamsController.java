package hello;

import com.fasterxml.jackson.databind.ObjectMapper;
import models.HibernateUtil;
import models.MockExam;
import models.RealExam;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin
@RestController
public class ExamsController {

    @RequestMapping(value = "/api/mockexams", method = RequestMethod.GET)
    public String getMockExams() {
        try {
            ObjectMapper omp = new ObjectMapper();

            //  EntityManager entityManager =  HibernateUtil.getEM();

            Session session = HibernateUtil.getSessionFactory().openSession();

            return omp.writeValueAsString( session.createCriteria(MockExam.class)
                    .add(Restrictions.eq("groupObj.id", 1)).list());


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

            Session session = HibernateUtil.getSessionFactory().openSession();

            return omp.writeValueAsString( session.createCriteria(RealExam.class)
                    .add(Restrictions.eq("groupObj.id", 1)).list());


        }
        catch(Exception ex) {
            ex.printStackTrace();
            return ex.getMessage();
        }
    }
}
