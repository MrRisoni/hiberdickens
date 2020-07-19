package core;


import models.PayRoll;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import spring_repos.SprPayRollRepository;

import java.util.Optional;

@CrossOrigin
@RestController
public class PayRollController {

    @Autowired
    SprPayRollRepository payrollRepo;

    @RequestMapping(value = "/api/payrolls/info/{payRollId}", method = RequestMethod.GET)
    public PayRoll getPayRollData(@PathVariable Long payRollId)
    {
        Optional<PayRoll> fetch = payrollRepo.findById(payRollId);
        return fetch.orElse(null);
    }
}
