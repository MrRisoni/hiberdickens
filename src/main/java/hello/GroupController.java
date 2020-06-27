package hello;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.google.gson.ExclusionStrategy;
import com.google.gson.FieldAttributes;
import com.google.gson.GsonBuilder;
import org.hibernate.FetchMode;
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



    @RequestMapping(value = "/api/group_data", method = RequestMethod.GET)
    public String getGroupGraph() {
        try {
            ObjectMapper omp = new ObjectMapper();
            //omp.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);

          //  Session sess = HibernateUtil.getSessionFactory().openSession();

              EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("dickensdb");
            EntityManager entityManager = entityManagerFactory.createEntityManager();

          EntityGraph<GroupModel> grpMd = entityManager.createEntityGraph(GroupModel.class);
          grpMd.addSubgraph(GroupModel_.historyList);

            TypedQuery<GroupModel> query = entityManager.createQuery("SELECT DISTINCT g FROM GroupModel g WHERE g.id = 1",GroupModel.class);
            query.setHint("javax.persistence.loadgraph", grpMd);

            return omp.writeValueAsString(query.getResultList());


           /* EntityGraph graph = entityManager.getEntityGraph("groupsWithHistories");
            Map<String, Object> properties = new HashMap<>();
            properties.put("javax.persistence.fetchgraph", graph);
            GroupModel user = entityManager.find(GroupModel.class, 1, properties);
            return omp.writeValueAsString(user); */


        }catch(Exception ex) {
            ex.printStackTrace();
            return ex.getMessage();
        }
    }

    @RequestMapping(value = "/api/groupaki", method = RequestMethod.GET)
    public String getGroupDetails() {
        try {
            ObjectMapper omp = new ObjectMapper();
            omp.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);

            EntityManager entityManager =  HibernateUtil.getEM();

            TypedQuery<GroupModel> ga = entityManager.createQuery("SELECT DISTINCT g FROM GroupModel g  " +
                    "   JOIN HistoryModel h WHERE g.id = 1",GroupModel.class);
            List<GroupModel> lg = ga.getResultList();
            System.out.println("###############################################");

            System.out.println("Get Results");
            // return "hey";

            return omp.writeValueAsString(lg);

        }
        catch(Exception ex) {
            ex.printStackTrace();
            return ex.getMessage();
        }
    }
}