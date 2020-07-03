package hello;


import models.HibernateUtil;
import models.ReviewQuestionnaire;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import repositories.ReviewRepository;

import java.util.List;

@CrossOrigin
@RestController
public class ReviewController {

    @RequestMapping(value = "/api/review/questionnaire", method = RequestMethod.GET)
    public ReviewQuestionnaire getQuestions()
    {
        ReviewRepository rvwRepo = new ReviewRepository();
        rvwRepo.setEntityManager(HibernateUtil.getEM());
        return rvwRepo.getQuestionnaire(1);
    }
}
