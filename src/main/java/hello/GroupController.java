package hello;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;
import models.*;

import org.springframework.web.bind.annotation.*;
import repositories.GroupRepository;
import responses.GroupStudentsResponse;

import javax.persistence.*;
import java.util.HashMap;
import java.util.List;

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


    @RequestMapping(value = "/api/group/info/{groupId}", method = RequestMethod.GET)
    public HashMap<String,Object> getGroupDetails(@PathVariable int groupId)
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

        GroupModel groupData = groupRepo.getGroup(groupId);

        sumTeacherPay = groupRepo.getSumTeacherPayments(groupId);
        sumTeacherDebts = groupRepo.getSumTeacherDebts(groupId);
        remainDebt = sumTeacherDebts - sumTeacherPay;

        sumStudentPay = groupRepo.getSumStudentPayments(groupId);
        sumStudentDebts = groupRepo.getSumStudentDebts(groupId);
        remainStudentDebt = sumStudentDebts - sumStudentPay;

        HashMap<String,Object> debtsMap = new HashMap<>();
        HashMap<String,Object> paymentsMap = new HashMap<>();
        HashMap<String,Object> generalInfo = new HashMap<>();


        generalInfo.put("fee",groupData.getFeeObj().getAmount());
        generalInfo.put("wage",groupData.getWageObj().getAmount());
        generalInfo.put("speed",groupData.getSpeedObj().getTitle());
        generalInfo.put("age",groupData.getAgeObj().getTitle());
        generalInfo.put("rank",groupData.getRankObj().getTitle());
        generalInfo.put("createdAt",groupData.getCreated_at());
        generalInfo.put("updatedAt",groupData.getUpdated_at());

        paymentsMap.put("sumPayments",sumTeacherPay);
        debtsMap.put("sumTeacherDebts",remainDebt);
        generalInfo.put("sumHours",groupRepo.getSumHours(groupId));
         generalInfo.put("history",groupRepo.getHistory(groupId));

        paymentsMap.put("sumStudentPayments",sumStudentPay);
        debtsMap.put("sumStudentDebts",remainStudentDebt);

        generalInfo.put("studentsList", groupRepo.getGroupStudents(groupId));

        paymentsMap.put("studentsPayments",groupRepo.getStudentPaymentsList(groupId));
        debtsMap.put("studentsDebts",groupRepo.getStudentDebtsList(groupId));

        paymentsMap.put("teacherPayments",groupRepo.getTeacherPaymentsList(groupId));
        debtsMap.put("teacherDebts",groupRepo.getTeacherDebtsList(groupId));

        rsp.put("info",generalInfo);
        rsp.put("debts",debtsMap);
        rsp.put("payments",paymentsMap);

        return rsp;
    }
}