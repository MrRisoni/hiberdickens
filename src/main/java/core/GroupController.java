package core;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;
import models.*;

import org.springframework.web.bind.annotation.*;
import repositories.GroupRepository;

import java.util.HashMap;

@CrossOrigin
@RestController
public class GroupController {


    @RequestMapping(value = "/api/group/new")
    public void newGroup()
    {

    }

    @RequestMapping(value = "/api/group/info/{groupId}", method = RequestMethod.GET)
    public HashMap<String,Object> getGroupDetails(@PathVariable Long groupId)
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
        generalInfo.put("course",groupData.getCourseObj().getTitle());
        generalInfo.put("course_type",groupData.getCourseObj().getCourseTypeObj().getTitle());


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