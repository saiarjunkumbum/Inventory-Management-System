package com.ivms.controllers;

import com.ivms.entities.Carzspa;
import com.ivms.services.SparesRepo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class SparesController
{
    @GetMapping("/edit")
    public String getEditPage(@RequestParam("id") int id, Model model){
        SparesRepo repo = new SparesRepo();
        Carzspa spare = repo.findById(id);
        model.addAttribute("spare", spare); // adding data to the page
        return "edit";
    }

    @PostMapping("/submitUpdate")
    public String submitUpdate(Carzspa spares, Model model){
        System.out.println("IN UPDATE ---");
        SparesRepo repo = new SparesRepo();
        if(repo!=null)
            repo.update(spares);
        return "redirect:/view?id="+spares.getId();
    }

    @RequestMapping("/new")
    public String newCarzspa(Model model)
    {
        return "new" ;
    }

    @PostMapping("/submitNew")
    public String addCarzspa(Carzspa spares, Model model) {

        SparesRepo repository = new SparesRepo();
        if(spares == null )
        {
            model.addAttribute("error_message","Values not received!");
            return "new";
        }
        if(spares.getName()==null || spares.getName().isEmpty()){
            model.addAttribute("error_message","Name is required!");
            return "new";
        }

        repository.save(spares);
        model.addAttribute("success_message","Added "+spares.getName()+" successfully"); // sending the data
        return "new";
    }

    @GetMapping("/view")
    public String view(@RequestParam("id") int id , Model model){
        SparesRepo repository = new SparesRepo();
        Carzspa spares = repository.findById(id); // id for fetching data from DB
        model.addAttribute("spares", spares); // addAttribute - putting the data
        return "view";
    }

    @PostMapping("/delete")
    public String deleteForm(@RequestParam("id") int id, Model model)
    {
        SparesRepo repo = new SparesRepo();
        repo.delete(id);
        return "redirect:/login";
    }


}
