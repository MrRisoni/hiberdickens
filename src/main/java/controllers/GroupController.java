package controllers;

import dtos.GroupDto;
import dtos.GroupStudentDto;
import models.groups.*;
import models.people.Teacher;
import org.modelmapper.Conditions;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import models.*;

import org.springframework.web.bind.annotation.*;
import pojos.GroupRecordsAPI;
import hqlmappers.GroupMemberDto;
import repositories.GroupRepository;
import spring_repos.SprGroupRepository;

import java.util.*;

@RestController
public class GroupController {

    @Autowired
    SprGroupRepository grRepo;

    @Autowired
    ModelMapper modelMapper;

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
    public GroupDto getGroupDetails(@PathVariable Long groupId)
    {
        GroupRepository groupRepo = new GroupRepository();
        groupRepo.setEntityManager(HibernateUtil.getEM());

       GroupModel foundGroup  =grRepo.findById(groupId).orElse(null);

        modelMapper.getConfiguration().setPropertyCondition(Conditions.isNotNull());

        GroupDto groupDto =  modelMapper.map(foundGroup, GroupDto.class);
       // groupDto.setHistory(groupRepo.getHistory(groupId));
  //      List<GroupStudentDto> studentsList =  groupRepo.getGroupStudents(groupId);

    //    groupDto.setStudentsList( studentsList);
   //     groupDto.setTotalMembers(studentsList.size());
   //     groupDto.setStudentsDebtsList(groupRepo.getStudentDebtsList(groupId));
    //    groupDto.setStudentsPaymentsList(groupRepo.getStudentPaymentsList(groupId));
    //    groupDto.setTeachersDebtsList(groupRepo.getTeacherDebtsList(groupId));
    //    groupDto.setTeachersPaymentsList(groupRepo.getTeacherDebtsList(groupId));
        return groupDto;
    }
}