package core;

import models.HibernateUtil;
import models.Pools;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import repositories.TestsRepository;

import java.util.HashMap;
import java.util.List;

@CrossOrigin
@RestController
public class TestsController {

    @Value("${app.beginning}")
    private static String beginning;

    @RequestMapping(value = "/api/tests", method = RequestMethod.GET)
    public List<Pools> getTestQuestions()
    {
        TestsRepository rvwRepo = new TestsRepository();
        rvwRepo.setEntityManager(HibernateUtil.getEM());
        return rvwRepo.getTestQuestions(1);
    }


    @RequestMapping(value = "/api/tests/next_question/{session_id}", method = RequestMethod.GET)
    public HashMap<String,Object> getNextQuestion(@PathVariable String session_id)
    {
        // http://localhost:8080/api/tests/next_question/snW1jVuSezMQJFsN0BDKLIk3iXj3zWV
        TestsRepository rvwRepo = new TestsRepository();
        rvwRepo.setEntityManager(HibernateUtil.getEM());
        return rvwRepo.getNextQuestionObj(session_id);


    }

}
