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

import javax.persistence.*;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Root;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@CrossOrigin
@RestController
public class GroupController {



    @RequestMapping(value = "/api/groupaki", method = RequestMethod.GET)
    public String getGroupDetails() {
        try {
            // specific group only, do not fetch group details
           // Session session = HibernateUtil.getSessionFactory().openSession();
            ObjectMapper omp = new ObjectMapper();
            omp.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);

             EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("dickensdb");
             EntityManager entityManager = entityManagerFactory.createEntityManager();

            CriteriaBuilder builder = entityManager.getCriteriaBuilder();
            CriteriaQuery<GroupModel> query = builder.createQuery(GroupModel.class);

            Root<GroupModel> root = query.from(GroupModel.class);
            root.join(GroupModel_.daskalos, JoinType.INNER);


            TypedQuery<GroupModel> typedQuery = entityManager.createQuery(query);
            List<GroupModel> resultList = typedQuery.getResultList();

            return omp.writeValueAsString(resultList);



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