package hello;


import models.InterViewStage;
import models.ReviewQuestionnaire;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import repositories.InterViewsRepository;

import java.util.List;

@CrossOrigin
@RestController
public class InterViewsController {


    @RequestMapping(value = "/api/interviews/stages", method = RequestMethod.GET)
    public List<InterViewStage> getStages() {
        InterViewsRepository interRepo = new InterViewsRepository();
        return interRepo.fetchStagesAndApplicants(1L);
    }
}