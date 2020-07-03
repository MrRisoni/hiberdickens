package hello;

import models.HibernateUtil;
import models.TestModel;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import repositories.ReviewRepository;
import repositories.TestsRepository;

@CrossOrigin
@RestController
public class TestsController {

    @RequestMapping(value = "/api/test", method = RequestMethod.GET)
    public TestModel getTestQuestions()
    {
        TestsRepository rvwRepo = new TestsRepository();
        rvwRepo.setEntityManager(HibernateUtil.getEM());
        return rvwRepo.getTestQuestions(1);
    }
}
