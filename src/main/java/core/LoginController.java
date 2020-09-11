package core;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class LoginController {

    @RequestMapping(value = "/api/login", method = RequestMethod.GET)
    public void login()
    {

    }

    @RequestMapping(value = "/api/create_sesion", method = RequestMethod.GET)
    public void create_sesion()
    {

    }

    @RequestMapping(value = "/api/logout", method = RequestMethod.GET)
    public void logout()
    {

    }
}
