package hello;

import models.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import repositories.GeneralRepository;
import spring_repos.AgeRepository;
import spring_repos.LanguageRepository;

import java.util.List;

@CrossOrigin
@RestController
public class GeneralController {

    @Autowired
    private LanguageRepository lgrepo;

    @Autowired
    private AgeRepository agrp;

    @RequestMapping(value = "/api/classes", method = RequestMethod.GET)
    public List<SchoolClass> getClasses() {

        GeneralRepository genRepo = new GeneralRepository();
        genRepo.setEntityManager(HibernateUtil.getEM());
        return  genRepo.getClasses();
    }

    @RequestMapping(value = "/api/course_types", method = RequestMethod.GET)
    public List<CourseType> getCourseTypes() {
        GeneralRepository genRepo = new GeneralRepository();
        genRepo.setEntityManager(HibernateUtil.getEM());
        return  genRepo.getCourseTypes();
    }

    @RequestMapping(value = "/api/disciplines", method = RequestMethod.GET)
    public List<Discipline> getDisciplines() {
        GeneralRepository genRepo = new GeneralRepository();
        genRepo.setEntityManager(HibernateUtil.getEM());
        return  genRepo.getDisciplines();
    }

    @RequestMapping(value = "/api/ages", method = RequestMethod.GET)
    public Iterable<Age> getAges() {
       /* GeneralRepository genRepo = new GeneralRepository();
        genRepo.setEntityManager(HibernateUtil.getEM());
        return  genRepo.getAges(); */
        return agrp.findAll();
    }

    @RequestMapping(value = "/api/speeds", method = RequestMethod.GET)
    public List<Speed> getSpeeds() {
        GeneralRepository genRepo = new GeneralRepository();
        genRepo.setEntityManager(HibernateUtil.getEM());
        return  genRepo.getSpeeds();
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

