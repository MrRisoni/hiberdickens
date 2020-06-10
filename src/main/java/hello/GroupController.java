package hello;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.fasterxml.jackson.databind.SerializationFeature;
import org.hibernate.criterion.Restrictions;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;
import com.google.gson.Gson;
import models.*;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.util.List;

@CrossOrigin
@RestController
public class GroupController {

    @RequestMapping(value = "/api/timetable", method = RequestMethod.GET)
    public String getTimeTable() {
        try {
            // specific group only, do not fetch group details
            Session session = HibernateUtil.getSessionFactory().openSession();
            ObjectMapper omp = new ObjectMapper();
            omp.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);

            List<HistoryModel> history = session.createQuery("SELECT h from HistoryModel AS hm join fetch hm.groupObj")
                    .getResultList();

            return omp.writeValueAsString(history);


        }
        catch(Exception ex) {
            ex.printStackTrace();
            return ex.getMessage();
        }
    }

    @RequestMapping(value = "/api/groupaki", method = RequestMethod.GET)
    public String getGroupDetails() {
        try {
            // specific group only, do not fetch group details
            Session session = HibernateUtil.getSessionFactory().openSession();
            ObjectMapper omp = new ObjectMapper();
            omp.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);

            List<HistoryModel> history = session.createCriteria(HistoryModel.class)
                    .add(Restrictions.eq("groupObj.id",1))
                    .list();

            return omp.writeValueAsString(history);

           /// EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("dickensdb");
           // EntityManager entityManager = entityManagerFactory.createEntityManager();

         /*   return omp.writeValueAsString(entityManager.createQuery(
                    "select hs from HistoryModel hs ", HistoryModel.class)
                    .getResultList()); */
        }
        catch(Exception ex) {
            ex.printStackTrace();
            return ex.getMessage();
        }
    }
}