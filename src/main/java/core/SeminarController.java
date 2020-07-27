package core;


import models.Seminars;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import spring_repos.SprSeminarRepository;

import java.util.Optional;

@CrossOrigin
@Controller
public class SeminarController {

    @Autowired
    SprSeminarRepository seminarRp;

    @RequestMapping(value = "/seminar/info/{seminarId}", method = RequestMethod.GET)
    public String getData(@PathVariable Long seminarId, Model mdl) {
        Optional<Seminars> semiRes = seminarRp.findById(seminarId);
        mdl.addAttribute("data",semiRes.orElse(null));
        return "seminars";
    }
}