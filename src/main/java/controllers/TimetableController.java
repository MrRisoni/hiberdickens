package controllers;

import dtos.TimetableResponseDto;
import models.HibernateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import services.TimetableSrvc;

@RestController
public class TimetableController {

    @Autowired
    TimetableSrvc timetableSrvc;

    @RequestMapping(value = "/api/timetable", method = RequestMethod.GET)
    public TimetableResponseDto istoria()
    {
        try {
            timetableSrvc.setEntityManager(HibernateUtil.getEM());
            return timetableSrvc.getTimetable();
        }
        catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }
}