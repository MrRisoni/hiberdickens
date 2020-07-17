package core;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;
import models.*;

import org.springframework.web.bind.annotation.*;
import repositories.GroupRepository;
import spring_repos.SprGroupRepository;

import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Optional;

@CrossOrigin
@RestController
public class GroupController {

    @Autowired
    SprGroupRepository grRepo;

    @RequestMapping(value = "/api/group/new")
    public void newGroup()
    {
        Teacher tch = new Teacher();
        tch.setId(1L);

        Speed sp = new Speed();
        sp.setId(1L);

        Age ag = new Age();
        ag.setId(1L);

        GroupRank rnk = new GroupRank();
        rnk.setId(1L);

        CourseFee fee = new CourseFee();
        fee.setId(1L);

        CourseWage wg = new CourseWage();
        wg.setId(1L);

        CourseModel crsm = new CourseModel();
        crsm.setId(1L);

        GroupModel grm = new GroupModel();
        grm.setActive(1);
        grm.setTitle("Test");
        grm.setEnds_at(new Date());

        grm.setSpeedObj(sp);
        HashSet<Teacher> daskaloi = new HashSet<>();
        daskaloi.add(tch);
        grm.setTeacherSet(daskaloi);
    //    grm.setDaskalos(tch);

        grm.setSpeedObj(sp);
        grm.setAgeObj(ag);
        grm.setRankObj(rnk);
        grm.setFeeObj(fee);
        grm.setWageObj(wg);
        grm.setCourseObj(crsm);

        grRepo.save(grm);


    }

    @RequestMapping(value = "/api/group/info/{groupId}", method = RequestMethod.GET)
    public HashMap<String,Object> getGroupDetails(@PathVariable Long groupId)
    {
        GroupRepository groupRepo = new GroupRepository();
        groupRepo.setEntityManager(HibernateUtil.getEM());

        Optional<GroupModel> crudGroup = grRepo.findById(groupId);
        GroupModel geFundenGroup  =crudGroup.orElse(null);


        HashMap<String,Object> rsp = new HashMap<>();
        double remainDebt = 0;
        double sumTeacherPay = 0;
        double sumTeacherDebts = 0;

        double remainStudentDebt = 0;
        double sumStudentPay = 0;
        double sumStudentDebts = 0;

        GroupModel groupData = groupRepo.getGroup(groupId);

        sumTeacherPay = geFundenGroup.getPaymentsSumTeachers();
        sumTeacherDebts =geFundenGroup.getDebtsSumTeachers();
        remainDebt = sumTeacherDebts - sumTeacherPay;

        sumStudentPay =geFundenGroup.getPaymentsSumStudents();
        sumStudentDebts = geFundenGroup.getDebtsSumStudents();
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
        generalInfo.put("teachersList", groupRepo.getGroupTeachers(groupId));

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