package project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

import javax.validation.Valid;

import java.util.ArrayList;
import project.persistence.entities.User;
import project.service.UserService;

@Controller
public class UserController {

    // Instance Variables
    private UserService userService;

    // Dependency Injection
    @Autowired
    public UserController(UserService userService) {
        this.userService = userService;
    }

    
    // Returns the view of Nyskra.jsp 
    @RequestMapping(value = "/nyskra", method = RequestMethod.GET)
    public String nyskra(Model model){
    	
    	 model.addAttribute("user",new User());
    	 

        return "Nyskra";
    }
    
    @RequestMapping(value = "/nyskra", method = RequestMethod.POST)
    public String nyskraPost(@ModelAttribute("nyskra") User user,
            Model model){
    	
    	user = userService.save(user);

        // Here we get all the Postit Notes (in a reverse order) and add them to the model
        //model.addAttribute("nyskraningar", nyskraService.findAllReverseOrder());
        
        model.addAttribute("userinn", user);
        // Add a new Postit Note to the model for the form
        // If you look at the form in PostitNotes.jsp, you can see that we
        // reference this attribute there by the name `postitNote`.
        //model.addAttribute("nyskraning", nyskraning);
        
   	 	model.addAttribute("user",new User());
    
        return "Nyskra";
    }
    
    @RequestMapping(value = "/innskra", method = RequestMethod.GET)
    public String innskra(Model model){
    	
    	model.addAttribute("user",new User());

        return "Innskra";
    }
    
    @RequestMapping(value = "/innskra", method = RequestMethod.POST)
    public String innskraUser(@ModelAttribute("user") User user,
            Model model){
    	
    	userService.save(user);

        // Here we get all the Postit Notes (in a reverse order) and add them to the model
        model.addAttribute("users", userService.findAllReverseOrder());
       
        // Add a new Postit Note to the model for the form
        // If you look at the form in PostitNotes.jsp, you can see that we
        // reference this attribute there by the name `postitNote`.
        model.addAttribute("user", new User());
    
        return "Innskra";
    }
    
   /* @RequestMapping(value = "/nyskra", method = RequestMethod.GET)
    public ModelAndView showForm() {
        return new ModelAndView("nyskraningar", "nyskraning", new Nyskraning());
    }
 
    @RequestMapping(value = "/nyskra", method = RequestMethod.POST)
    public String submit(@Valid @ModelAttribute("nyskra")Nyskraning nyskraning, 
      BindingResult result, ModelMap model) {
        model.addAttribute("nafn", nyskraning.getNafn());
        model.addAttribute("lykilord", nyskraning.getLykilord());
        model.addAttribute("netfang", nyskraning.getNetfang());
        model.addAttribute("simi", nyskraning.getSimi());
        model.addAttribute("heimili", nyskraning.getHeimili());
        model.addAttribute("zip", nyskraning.getzip());
        return "Nyskra";
    }*/

    
 
}

  
