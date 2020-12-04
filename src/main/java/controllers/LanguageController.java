package controllers;

import dtos.CourseDto;
import dtos.DiplomaDto;
import dtos.LanguageDto;
import models.groups.CourseModel;
import models.groups.GroupModel;
import models.languages.Diploma;
import models.languages.Language;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import spring_repos.LanguageRepository;

import java.util.ArrayList;
import java.util.List;

@RestController
public class LanguageController {

    @Autowired
    LanguageRepository lgRepo;

    @RequestMapping(value = "/api/languages/new", method = RequestMethod.GET)
    public void newLanguage()
    {
        Language l = new Language();
        l.setTitle("Arabic");
        l.setActive(1);
       // lgRepo.save(l);

        CourseModel c = new CourseModel();
        c.setTitle("Al ko war rihm");
        
    }

    @RequestMapping(value = "/api/languages/info/{langId}", method = RequestMethod.GET)
    public LanguageDto getLangInfo(@PathVariable Long langId)
    {
        try {
            Language foundLag  =lgRepo.findById(langId).orElse(null);
            LanguageDto langDto = new LanguageDto();
            langDto.setId(foundLag.getId());
            langDto.setTitle(foundLag.getTitle());
            langDto.setNumSpeakers(foundLag.getNumSpeakers());

            List<DiplomaDto> diplomas = new ArrayList();
            for (Diploma dplMdl : foundLag.getDiplomas()) {
                DiplomaDto dpldto = new DiplomaDto();
                dpldto.setId(dplMdl.getId());
                dpldto.setLvl(dplMdl.getLvl());
                CourseDto dplCourseDto = new CourseDto();
                dplCourseDto.setId(dplMdl.getCours().getId());
                dplCourseDto.setTitle(dplMdl.getCours().getTitle());
                dpldto.setCours(dplCourseDto);
                diplomas.add(dpldto);
            }
            langDto.setDiplomas(diplomas);
            return langDto;
        }catch (Exception ex){
            ex.printStackTrace();
            return null;
        }

    }

}
