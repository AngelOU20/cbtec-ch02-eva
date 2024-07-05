package edu.cibertec.capitulo02evaluacion.controller;

import edu.cibertec.capitulo02evaluacion.model.User;
import edu.cibertec.capitulo02evaluacion.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
@SessionAttributes("currentUser")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("home")
    public String home() {
        return "home";
    }

    @RequestMapping("loginMostrar")
    public String loginMostrar() {
        return "login";
    }

    @RequestMapping("loginAccion")
    public ModelAndView loginAccion(@RequestParam String username,
                                    @RequestParam String password) {
        ModelAndView mv = null;

        User user = userService.login(username, password);

        if (user == null) {
            mv = new ModelAndView("login", "msgError", "Usuario y clave no existen. Vuelva a intentar!");
        } else {
            mv = new ModelAndView("home");
            mv.addObject("currentUser", user);
        }
        return mv;
    }

    @RequestMapping("registerMostrar")
    public ModelAndView registerMostrar() {
        return new ModelAndView("register", "userBean", new User());
    }

    @RequestMapping("registerAccion")
    public ModelAndView registerAccion(@Valid @ModelAttribute("userBean") User user,
                                       BindingResult result) {
        ModelAndView mv = null;

        if (result.hasErrors()) {
            mv = new ModelAndView("register", "userBean", user);
        } else {
            userService.register(user);
            mv = new ModelAndView("home");
            mv.addObject("currentUser", user);
        }

        return mv;
    }

    @RequestMapping("logoutAccion")
    public String logout(SessionStatus sessionStatus) {
        sessionStatus.setComplete();
        return "login";
    }

}
