package hello;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.google.gson.ExclusionStrategy;
import com.google.gson.FieldAttributes;
import com.google.gson.GsonBuilder;
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

    @RequestMapping(value = "/api/timetable", method = RequestMethod.GET)
    public String timetable()
    {
        try {
            EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("dickensdb");
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            ObjectMapper omp = new ObjectMapper();

          /*   EntityGraph graph = entityManager.getEntityGraph("historiesWithRooms");
            Map<String, Object> properties = new HashMap<>();
            properties.put("javax.persistence.loadgraph", graph);
            HistoryModel user = entityManager.find(HistoryModel.class, 1, properties); */

            EntityGraph<HistoryModel> graph = entityManager.createEntityGraph(HistoryModel.class);
            graph.addAttributeNodes("groupObj");

            Map<String, Object> hints = new HashMap<String, Object>();
            hints.put("javax.persistence.loadgraph", graph);


            return omp.writeValueAsString(entityManager.find(HistoryModel.class, 1, hints));

        }
        catch (Exception ex) {
            return ex.getMessage();
        }
    }


    @RequestMapping(value = "/api/groupaki", method = RequestMethod.GET)
    public String getGroupDetails() {
        try {
            // specific group only, do not fetch group details
           // Session session = HibernateUtil.getSessionFactory().openSession();
            ObjectMapper omp = new ObjectMapper();
            //omp.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);

             EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("dickensdb");
             EntityManager entityManager = entityManagerFactory.createEntityManager();

           /* CriteriaBuilder builder = entityManager.getCriteriaBuilder();
            CriteriaQuery<GroupModel> query = builder.createQuery(GroupModel.class);

            Root<GroupModel> root = query.from(GroupModel.class);
          //  root.join(GroupModel_.historylist, JoinType.INNER);
            //root.join(GroupModel_.daskalos, JoinType.INNER);

            TypedQuery<GroupModel> typedQuery = entityManager.createQuery(query);
            List<GroupModel> resultList = typedQuery.getResultList();
            System.out.println(resultList.get(0).getDaskalos().getMember().getName()); */

          /*  EntityGraph graph = entityManager.getEntityGraph("groupsWithHistories");
            Map<String, Object> properties = new HashMap<>();
            properties.put("javax.persistence.loadgraph", graph);
            GroupModel user = entityManager.find(GroupModel.class, 1, properties);



           */
            TypedQuery<GroupModel> ga = entityManager.createQuery("SELECT DISTINCT g FROM GroupModel g INNER JOIN FETCH g.historyList WHERE g.id = 1",GroupModel.class);
            List<GroupModel> lg = ga.getResultList();
            System.out.println(lg.get(0).getHistoryList().get(0).getStarted());



             return omp.writeValueAsString(lg);


        }
        catch(Exception ex) {
            ex.printStackTrace();
            return ex.getMessage();
        }
    }
}