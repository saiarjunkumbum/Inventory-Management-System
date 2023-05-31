package com.ivms.controllers;

import com.ivms.entities.Carzspa;
import com.ivms.services.SparesRepo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;

@Controller
public class LoginController {
//    public String username = "Arjun";
//    public String password = "Ar1234";

    SparesRepo repo = new SparesRepo();

    @GetMapping("/login")
    public String login( Model model)
    {
       /* if(!username.equals(this.username)){
            model.addAttribute("message","User doesn't exist");
            return "error";
        } else if (!this.password.equals(password)) {
            model.addAttribute("message","The password you entered was incorrect");
            return "error";
        }*/
        //model.addAttribute("name", username);
        ArrayList<Carzspa> spares = repo.listAll();
        model.addAttribute("spares", spares);

        return "home";
    }

}
