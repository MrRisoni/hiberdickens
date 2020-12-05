package controllers;

import dtos.CourseDto;
import models.groups.CourseModel;
import models.groups.CourseType;
import models.languages.Diploma;
import models.languages.Institut;
import models.languages.Language;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.*;
import spring_repos.SprCourseRepository;
import spring_repos.SprDiplomaRepository;

import java.util.Optional;


@RestController
public class CoursesController {

    @Autowired
    SprCourseRepository spr_course_repo;

    @Autowired
    SprDiplomaRepository spr_diploma_repo;

    @Autowired
    ModelMapper modelMapper;

    @RequestMapping(value=  "/api/course/new" , method = RequestMethod.GET)
    public void newCourse()
    {

            CourseType typ = new CourseType();
            typ.setId(1L);

            Language lang = new Language();
            lang.setId(1L);

            Institut inst = new Institut();
            inst.setId(4L);

            CourseModel mod = new CourseModel();
            mod.setTitle("Sorbonne I");
            mod.setCourseTypeObj(typ);
            mod.setActive(1);

            Diploma dpl = new Diploma();
            dpl.setActive(1);
            dpl.setCours(mod);
            dpl.setInstObj(inst);
            dpl.setLangObj(lang);
            dpl.setLvl("C1");
        //    spr_course_repo.save(mod);

         //   spr_diploma_repo.save(dpl);

    }

    @RequestMapping(value= "/api/courses" , method = RequestMethod.GET)
    public CourseDto getCourses()
    {
        try {
           Optional<CourseModel> optCourse = spr_course_repo.findById(1L);
           CourseModel courseEntity =optCourse.orElse(null);
           return modelMapper.map(courseEntity, CourseDto.class);
        }
        catch (Exception ex){
            ex.printStackTrace();
            return null;
        }
    }
}
