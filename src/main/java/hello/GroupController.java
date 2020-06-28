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

  /*  @RequestMapping(value = "/api/groupaki", method = RequestMethod.GET)
    public String temp() {
        try {
            ObjectMapper omp = new ObjectMapper();
            omp.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);

            Session s = HibernateUtil.getSessionFactory().openSession();
            List<GroupModel> lgm = s.createCriteria()

            return "";
        }
        catch(Exception ex) {
        ex.printStackTrace();
        return ex.getMessage();
    } */


    @RequestMapping(value = "/api/groupaki", method = RequestMethod.GET)
    public String getGroupDetails() {
        try {
            ObjectMapper omp = new ObjectMapper();
            omp.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);

            EntityManager entityManager =  HibernateUtil.getEM();

            System.out.println("###############################################");

            List<Foo> lg = entityManager.createQuery("select new hello.Foo(g.title, gdsk.member.name) from GroupModel g  inner join  g.daskalos  gdsk" +
                    " inner join gdsk.member where g.id = 1",Foo.class).getResultList();
            System.out.println("----------------");

            System.out.println(lg.get(0).getTeacherName());

           // System.out.println(lg.get(0).getDaskalos().getId());
           // System.out.println(lg.get(0).getDaskalos().getMember().getName());

            return "hey";

           // return omp.writeValueAsString(lg);

        }
        catch(Exception ex) {
            ex.printStackTrace();
            return ex.getMessage();
        }
    }
}