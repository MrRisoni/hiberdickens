package hello;

import models.HibernateUtil;
import models.TestModel;
import models.TestQuestion;
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

    @RequestMapping(value = "/api/test/next_question", method = RequestMethod.GET)
    public TestQuestion getNextQuestion(int submissionId)
    {
        SELECT q.id FROM `test_submissions` s
        JOIN test_chapters c on c.test_id = s.test_id
        JOIN test_questions q ON q.chapter_id = c.id
        WHERE s.application_id = 1 AND s.test_id= 1



        AND q.id NOT IN  (
            SELECT q.id
            FROM  test_submissions s
            JOIN  test_submission_answers sb ON sb.submission_id = s.id
            JOIN test_questions q ON q.id = sb.question_id
            WHERE s.application_id = 1 AND s.test_id= 1
    ) LIMIT 1



    }
}
