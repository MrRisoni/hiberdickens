package hello;


import models.InterViewSchedule;
import models.InterViewStage;
import models.JobOpening;
import models.ReviewQuestionnaire;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import repositories.InterViewsRepository;

import java.util.HashMap;
import java.util.List;

@CrossOrigin
@RestController
public class InterViewsController {


    @RequestMapping(value = "/api/interviews/stages", method = RequestMethod.GET)
    public HashMap<String,Object> getStages() {
        InterViewsRepository interRepo = new InterViewsRepository();
        HashMap<String ,Object> rsp = new HashMap<>();
        rsp.put("stages",interRepo.fetchStagesAndApplicants(1L));
        rsp.put("opening",interRepo.fetchJobOpenings(1L));
        return rsp;
    }

    @RequestMapping(value = "/api/interviews/openings", method = RequestMethod.GET)
    public List<JobOpening> getOpenings() {
        InterViewsRepository interRepo = new InterViewsRepository();
        return interRepo.fetchJobOpenings(1L);
    }

    @RequestMapping(value = "/api/interviews/schedule", method = RequestMethod.GET)
    public List<InterViewSchedule> fetchInterSchedules() {
        InterViewsRepository interRepo = new InterViewsRepository();
        return interRepo.fetchInterviews();
    }

}