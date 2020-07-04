package hello;

import models.HibernateUtil;
import models.Pools;
import models.TestModel;
import models.TestSubmission;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import repositories.ReviewRepository;
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


    @RequestMapping(value = "/api/tests/next_question", method = RequestMethod.GET)
    public HashMap<String,Boolean> getNextQuestion()
    {
        System.out.println("this.beginning");

        System.out.println(this.beginning);



        TestsRepository rvwRepo = new TestsRepository();
        rvwRepo.setEntityManager(HibernateUtil.getEM());
        return rvwRepo.isTestActive(1,1);


    }

}
