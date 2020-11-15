package controllers;


import models.HibernateUtil;
import models.evaluation.ReviewQuestionnaire;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import repositories.ReviewRepository;


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
