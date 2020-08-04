package core;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainCtrl {


    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String rootFUnc()
    {
        return "tabmenu";
    }
}