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
import repositories.GroupRepository;
import responses.GroupStudentsResponse;

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
    public String testtmp() {
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


    @RequestMapping(value = "/api/group/students", method = RequestMethod.GET)
    public GroupStudentsResponse getGroupMembers() {
        GroupStudentsResponse rsp = new GroupStudentsResponse();
        try {
            GroupRepository groupRepo = new GroupRepository();
            groupRepo.setEntityManager(HibernateUtil.getEM());
            rsp.setDatei(groupRepo.getGroupStudents(1));
            return rsp;
        }
        catch(Exception ex) {
            ex.printStackTrace();
            rsp.setErrorMessage(ex.getMessage());
            return rsp;
        }
    }


    @RequestMapping(value = "/api/group/info", method = RequestMethod.GET)
    public HashMap<String,Object> getGroupDetails()
    {
        GroupRepository groupRepo = new GroupRepository();
        groupRepo.setEntityManager(HibernateUtil.getEM());
        HashMap<String,Object> rsp = new HashMap<>();
        double remainDebt = 0;
        double sumTeacherPay = 0;
        double sumTeacherDebts = 0;

        double remainStudentDebt = 0;
        double sumStudentPay = 0;
        double sumStudentDebts = 0;

        sumTeacherPay = groupRepo.getSumTeacherPayments(1);
        sumTeacherDebts = groupRepo.getSumTeacherDebts(1);
        remainDebt = sumTeacherDebts - sumTeacherPay;


        sumStudentPay = groupRepo.getSumStudentPayments(1);
        sumStudentDebts = groupRepo.getSumStudentDebts(1);
        remainStudentDebt = sumStudentDebts - sumStudentPay;

        rsp.put("sumPayments",sumTeacherPay);
        rsp.put("sumDebts",remainDebt);

        rsp.put("sumStudentPayments",sumStudentPay);
        rsp.put("sumStudentDebts",remainStudentDebt);

        rsp.put("studentsList", groupRepo.getGroupStudents(1));
        return rsp;
    }
}