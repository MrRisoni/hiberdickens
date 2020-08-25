package core;


import models.PayRoll;
import models.Revenue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import spring_repos.SprRevenueRepository;

import java.util.List;
import java.util.Optional;


@RestController
public class RevenueController {

    @Autowired
    SprRevenueRepository revenueRepo;

    @RequestMapping(value = "/api/revenue/charts", method = RequestMethod.GET)
    public Iterable<Revenue> getChartData()
    {
        return revenueRepo.findAll(Sort.by(Sort.Direction.ASC, "createdAt"));
    }


}
