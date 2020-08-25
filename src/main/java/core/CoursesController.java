package core;

import models.groups.CourseModel;
import models.groups.CourseType;
import models.languages.Diploma;
import models.languages.Institut;
import models.languages.Language;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.*;
import spring_repos.SprCourseRepository;
import spring_repos.SprDiplomaRepository;


@RestController
public class CoursesController {

    @Autowired
    SprCourseRepository spr_course_repo;

    @Autowired
    SprDiplomaRepository spr_diploma_repo;

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
            dpl.setLevel("C1");
        //    spr_course_repo.save(mod);

         //   spr_diploma_repo.save(dpl);

    }

    @RequestMapping(value= "/courses" , method = RequestMethod.GET)
    public String getCourses(Model mod)
    {
        mod.addAttribute("courses",spr_course_repo.findAll());
        return "coursesList";
    }
}
