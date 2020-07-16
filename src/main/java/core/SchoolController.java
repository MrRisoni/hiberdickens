package core;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import spring_repos.SprDisciplineRepository;
import spring_repos.SprSchoolClassRepository;

import java.util.HashMap;
import java.util.HashSet;

@CrossOrigin
@RestController
public class SchoolController {

    @Autowired
    SprDisciplineRepository disc_repo;
    @Autowired
    SprSchoolClassRepository klass_repo;

    @RequestMapping(value = "/api/school/classes", method = RequestMethod.GET)
    public HashMap<String, Object> getClassesDisciplines() {
        HashMap<String,Object> result = new HashMap<>();
        result.put("disciplines",disc_repo.findAll());
        result.put("classes",klass_repo.findAll());

        return result;
    }
}
