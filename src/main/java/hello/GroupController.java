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




    @RequestMapping(value = "/api/groupaki", method = RequestMethod.GET)
    public String getGroupDetails() {
        try {
            ObjectMapper omp = new ObjectMapper();

            EntityManager entityManager =  HibernateUtil.getEM();

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