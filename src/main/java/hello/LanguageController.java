package hello;


import models.CourseModel;
import models.Language;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import spring_repos.LanguageRepository;

@CrossOrigin
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
        lgRepo.save(l);

        CourseModel c = new CourseModel();
        c.setTitle("Al ko war rihm");
        
    }

}
