package core;

import models.groups.*;
import models.people.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import models.*;

import org.springframework.web.bind.annotation.*;
import pojos.GroupRecordsAPI;
import hqlmappers.GroupMember;
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
        int perPage = 100;
        int currentPage = 1;
        GroupRepository groupRepo = new GroupRepository();
        groupRepo.setEntityManager(HibernateUtil.getEM());

        GroupRecordsAPI grapi =  groupRepo.getGroupsList(currentPage, perPage,"DESC","remainingDebt");

        return grapi;

    }

    @RequestMapping(value = "/api/group/info/{groupId}", method = RequestMethod.GET)
    public HashMap<String,Object> getGroupDetails(@PathVariable Long groupId)
    {
        GroupRepository groupRepo = new GroupRepository();
        groupRepo.setEntityManager(HibernateUtil.getEM());

        Optional<GroupModel> crudGroup = grRepo.findById(groupId);
        GroupModel geFundenGroup  =crudGroup.orElse(null);

        GroupModel groupData = groupRepo.getGroup(groupId);

        HashMap<String,Object> rsp = new HashMap<>();

        rsp.put("fee",groupData.getFeeObj().getAmount());
        rsp.put("wage",groupData.getWageObj().getAmount());
        rsp.put("speed",groupData.getSpeedObj().getTitle());
        rsp.put("age",groupData.getAgeObj().getTitle());
        rsp.put("rank",groupData.getRankObj().getTitle());
        rsp.put("createdAt",groupData.getCreated_at());
        rsp.put("updatedAt",groupData.getUpdated_at());
        rsp.put("course",groupData.getCourseObj().getTitle());
        rsp.put("course_type",groupData.getCourseObj().getCourseTypeObj().getTitle());
        rsp.put("courseTitle",geFundenGroup.getCourseObj().getTitle());

        rsp.put("sumTeacherPayments",geFundenGroup.getPaymentsSumTeachers());
        rsp.put("sumTeacherDebts",geFundenGroup.getRemainingTeacherDebt());
        rsp.put("sumHours",geFundenGroup.getSumHours());
        rsp.put("history",groupRepo.getHistory(groupId));

        rsp.put("sumStudentPayments",geFundenGroup.getPaymentsSumStudents());
        rsp.put("sumStudentDebts",geFundenGroup.getRemainingStudentDebt());
        List<GroupMember> students_list = groupRepo.getGroupStudents(groupId);
        rsp.put("studentsList", groupRepo.getGroupStudents(groupId));
        rsp.put("teachersList", groupRepo.getGroupTeachers(groupId));
        rsp.put("totalMembers",students_list.size());
        rsp.put("studentsPayments",groupRepo.getStudentPaymentsList(groupId));
        rsp.put("studentsDebts",groupRepo.getStudentDebtsList(groupId));

        rsp.put("teacherPayments",groupRepo.getTeacherPaymentsList(groupId));
        rsp.put("teacherDebts",groupRepo.getTeacherDebtsList(groupId));
        rsp.put("seminarModules",geFundenGroup.getModulesSet());

       return rsp;
    }
}