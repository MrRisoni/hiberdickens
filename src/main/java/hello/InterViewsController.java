package hello;


import models.*;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import repositories.InterViewsRepository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@CrossOrigin
@RestController
public class InterViewsController {


    @RequestMapping(value = "/api/interviews/stages", method = RequestMethod.GET)
    public HashMap<String,Object> getStages() {
        InterViewsRepository interRepo = new InterViewsRepository();
        HashMap<String ,Object> rsp = new HashMap<>();
        System.out.println("-------------------------");

        List<InterViewStage> stages = interRepo.fetchStagesAndApplicants(1L);
        List<InterViewStage> rspStages = new ArrayList<>();

        for(InterViewStage stIterItm : stages) {
            InterViewStage stg = new InterViewStage();
            // ge the parts we need
            stg.setId(stIterItm.getId());
            stg.setTitle(stIterItm.getTitle());
            List<InterViewGrade> grdlist = new ArrayList<>();
            for (InterViewGrade grdItm : stIterItm.getGradesList()) {
                InterViewGrade grd = new InterViewGrade();
                grd.setId(grdItm.getId());
                grd.setEvaluated(grdItm.getEvaluated());
                grd.setEvaluated_at(grdItm.getEvaluated_at());
                grd.setGrade(grdItm.getGrade());
                grd.setNotes(grdItm.getNotes());
                grd.setPassed(grdItm.getPassed());
                JobApplication appleObj = new JobApplication();
                appleObj.setDob(grdItm.getApplicationObj().getDob());
                appleObj.setFull_name(grdItm.getApplicationObj().getFull_name());
                appleObj.setId(grdItm.getApplicationObj().getId());

                grd.setApplicationObj(appleObj);
                grdlist.add(grd);
            }
            stg.setGradesList(grdlist);
            rspStages.add(stg);
        }

        System.out.println("**************************");
        rsp.put("stages",rspStages);

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