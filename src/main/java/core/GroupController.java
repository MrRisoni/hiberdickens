package core;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

@Controller
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
    public String getGroupDetails(@PathVariable Long groupId, Model mod)
    {
        groupId = 1L;

        GroupRepository groupRepo = new GroupRepository();
        groupRepo.setEntityManager(HibernateUtil.getEM());

        Optional<GroupModel> crudGroup = grRepo.findById(groupId);
        GroupModel geFundenGroup  =crudGroup.orElse(null);


        HashMap<String,Object> rsp = new HashMap<>();

        GroupModel groupData = groupRepo.getGroup(groupId);

        HashMap<String,Object> debtsMap = new HashMap<>();
        HashMap<String,Object> paymentsMap = new HashMap<>();
        HashMap<String,Object> generalInfo = new HashMap<>();

        mod.addAttribute("fee",groupData.getFeeObj().getAmount());
        mod.addAttribute("wage",groupData.getWageObj().getAmount());
        mod.addAttribute("speed",groupData.getSpeedObj().getTitle());
        mod.addAttribute("age",groupData.getAgeObj().getTitle());
        mod.addAttribute("rank",groupData.getRankObj().getTitle());
        mod.addAttribute("createdAt",groupData.getCreated_at());
        mod.addAttribute("updatedAt",groupData.getUpdated_at());
        mod.addAttribute("course",groupData.getCourseObj().getTitle());
        mod.addAttribute("course_type",groupData.getCourseObj().getCourseTypeObj().getTitle());


        paymentsMap.put("sumTeacherPayments",geFundenGroup.getPaymentsSumTeachers());
        debtsMap.put("sumTeacherDebts",geFundenGroup.getRemainingTeacherDebt());
        mod.addAttribute("sumHours",geFundenGroup.getSumHours());
         mod.addAttribute("history",groupRepo.getHistory(groupId));

        paymentsMap.put("sumStudentPayments",geFundenGroup.getPaymentsSumStudents());
        debtsMap.put("sumStudentDebts",geFundenGroup.getRemainingStudentDebt());

        mod.addAttribute("studentsList", groupRepo.getGroupStudents(groupId));
        mod.addAttribute("teachersList", groupRepo.getGroupTeachers(groupId));

        paymentsMap.put("studentsPayments",groupRepo.getStudentPaymentsList(groupId));
        debtsMap.put("studentsDebts",groupRepo.getStudentDebtsList(groupId));

        paymentsMap.put("teacherPayments",groupRepo.getTeacherPaymentsList(groupId));
        debtsMap.put("teacherDebts",groupRepo.getTeacherDebtsList(groupId));

        rsp.put("info",generalInfo);
        rsp.put("debts",debtsMap);
        rsp.put("payments",paymentsMap);

     //   return rsp;

        return "groupDetails";
    }
}