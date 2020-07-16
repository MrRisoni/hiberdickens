package core;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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

    @Value("${ifconfig.enable_school}")
    private int enable_school; // feature flags

    @RequestMapping(value = "/api/school/classes", method = RequestMethod.GET)
    public ResponseEntity<HashMap<String, Object>> getClassesDisciplines() {
        HashMap<String,Object> result = new HashMap<>();
        if (enable_school ==1) {
            result.put("disciplines", disc_repo.findAll());
            result.put("classes", klass_repo.findAll());
            System.out.println("enable skoll");
            System.out.println(enable_school);
            return new ResponseEntity<>(result, HttpStatus.OK);
        }
        else {
            result.put("error", "Not Supported");
            return new ResponseEntity<>(result, HttpStatus.FORBIDDEN);
        }
    }
}
