package core;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RestController;
import models.*;

import org.springframework.web.bind.annotation.*;
import pojos.GroupRecordsAPI;
import repositories.GroupMember;
import repositories.GroupRepository;
import spring_repos.SprGroupRepository;

import java.util.*;

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

        //grRepo.save(grm);

    }

    @RequestMapping(value="/api/groups",method = RequestMethod.GET)
    public GroupRecordsAPI getGroupList()
    {
        int perPage = 10;
        int currentPage = 1;
        GroupRepository groupRepo = new GroupRepository();
        groupRepo.setEntityManager(HibernateUtil.getEM());

        return  groupRepo.getGroupsList(currentPage, perPage,"DESC","remainingDebt");

    }

    @RequestMapping(value = "/group/info/{groupId}", method = RequestMethod.GET)
    public String getGroupDetails(@PathVariable Long groupId, Model mod)
    {
        GroupRepository groupRepo = new GroupRepository();
        groupRepo.setEntityManager(HibernateUtil.getEM());

        Optional<GroupModel> crudGroup = grRepo.findById(groupId);
        GroupModel geFundenGroup  =crudGroup.orElse(null);

        GroupModel groupData = groupRepo.getGroup(groupId);


        mod.addAttribute("fee",groupData.getFeeObj().getAmount());
        mod.addAttribute("wage",groupData.getWageObj().getAmount());
        mod.addAttribute("speed",groupData.getSpeedObj().getTitle());
        mod.addAttribute("age",groupData.getAgeObj().getTitle());
        mod.addAttribute("rank",groupData.getRankObj().getTitle());
        mod.addAttribute("createdAt",groupData.getCreated_at());
        mod.addAttribute("updatedAt",groupData.getUpdated_at());
        mod.addAttribute("course",groupData.getCourseObj().getTitle());
        mod.addAttribute("course_type",groupData.getCourseObj().getCourseTypeObj().getTitle());
        mod.addAttribute("courseTitle",geFundenGroup.getCourseObj().getTitle());

        mod.addAttribute("sumTeacherPayments",geFundenGroup.getPaymentsSumTeachers());
        mod.addAttribute("sumTeacherDebts",geFundenGroup.getRemainingTeacherDebt());
        mod.addAttribute("sumHours",geFundenGroup.getSumHours());
        mod.addAttribute("history",groupRepo.getHistory(groupId));

        mod.addAttribute("sumStudentPayments",geFundenGroup.getPaymentsSumStudents());
        mod.addAttribute("sumStudentDebts",geFundenGroup.getRemainingStudentDebt());
        List<GroupMember> students_list = groupRepo.getGroupStudents(groupId);
        mod.addAttribute("studentsList", groupRepo.getGroupStudents(groupId));
        mod.addAttribute("teachersList", groupRepo.getGroupTeachers(groupId));
        mod.addAttribute("totalMembers",students_list.size());
        mod.addAttribute("studentsPayments",groupRepo.getStudentPaymentsList(groupId));
        mod.addAttribute("studentsDebts",groupRepo.getStudentDebtsList(groupId));

        mod.addAttribute("teacherPayments",groupRepo.getTeacherPaymentsList(groupId));
        mod.addAttribute("teacherDebts",groupRepo.getTeacherDebtsList(groupId));
        mod.addAttribute("seminarModules",geFundenGroup.getModulesSet());


        return "groupDetails";
    }
}