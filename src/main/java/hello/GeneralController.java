package hello;

import models.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import repositories.GeneralRepository;
import spring_repos.*;

import java.util.List;

@CrossOrigin
@RestController
public class GeneralController {

    @Autowired
    private LanguageRepository lgrepo;

    @Autowired
    private AgeRepository agrp;

    @Autowired
    private SpeedRepository spdRp;

    @Autowired
    private CourseTypeRepository typeRsp;

    @Autowired
    private DisciplineRepository dscplRepo;

    @RequestMapping(value = "/api/classes", method = RequestMethod.GET)
    public List<SchoolClass> getClasses() {

        GeneralRepository genRepo = new GeneralRepository();
        genRepo.setEntityManager(HibernateUtil.getEM());
        return  genRepo.getClasses();
    }

    @RequestMapping(value = "/api/course_types", method = RequestMethod.GET)
    public Iterable<CourseType> getCourseTypes() {
        return typeRsp.findAll();
    }

    @RequestMapping(value = "/api/disciplines", method = RequestMethod.GET)
    public Iterable<Discipline> getDisciplines() {
        return dscplRepo.findAll();
    }

    @RequestMapping(value = "/api/ages", method = RequestMethod.GET)
    public Iterable<Age> getAges() {
       /* GeneralRepository genRepo = new GeneralRepository();
        genRepo.setEntityManager(HibernateUtil.getEM());
        return  genRepo.getAges(); */
        return agrp.findAll();
    }

    @RequestMapping(value = "/api/speeds", method = RequestMethod.GET)
    public Iterable<Speed> getSpeeds() {
      return spdRp.findAll();
    }

    @RequestMapping(value = "/api/buildings", method = RequestMethod.GET)
    public List<Building> getBuildings() {
        GeneralRepository genRepo = new GeneralRepository();
        genRepo.setEntityManager(HibernateUtil.getEM());
        return genRepo.getBuildings();
    }

    @RequestMapping(value = "/api/languages", method = RequestMethod.GET)
    public Iterable<Language> getLanguages() {
        //GeneralRepository genRepo = new GeneralRepository();
      //  genRepo.setEntityManager(HibernateUtil.getEM());
      //  return genRepo.getLanguages();
        return lgrepo.findAll();
    }
}

