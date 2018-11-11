package project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

    
    /*
     *  Birtir nýskráningarsíðu með 
     *  innskráningarformi í Nyskra.jsp 
     */
    @RequestMapping(value = "/nyskra", method = RequestMethod.GET)
    public String nyskra(Model model){
    	
    	model.addAttribute("user", new User());
    	 
        return "Nyskra";
    }
    
    /*
     * Vistum user í Database
     */
    @RequestMapping(value = "/nyskra", method = RequestMethod.POST)
    public String nyskraPost(@ModelAttribute("nyskra") User user,
            Model model){
    	user = userService.save(user);     
        model.addAttribute("userinn", user); 
   	 	model.addAttribute("user",new User());
    
        return "Innskra";
    }
    
    
    @RequestMapping(value = "/innskra", method = RequestMethod.GET)
    public String innskra(Model model){
    	
    	model.addAttribute("user",new User());

        return "Innskra";
    }

    
  /*  @RequestMapping(value = "/innskra", method = RequestMethod.POST)
    /*
    @RequestMapping(value = "/innskra", method = RequestMethod.POST)
    public String innskraUser(@ModelAttribute("innskra") User user,
            Model model){
    	
    	user = userService.save(user);
        model.addAttribute("userinnskra", user);
        model.addAttribute("user", new User());
    
        return "Innskra";
    }*/

   
    // FRÁ JÖKLI

    @RequestMapping(value = "/innskra", method = RequestMethod.POST)
    public String innskraUser(Model model, HttpSession httpSession, User user){
    	User currentUser =this.userService.findOneByName(user);
    	
    	if (currentUser!=null && currentUser.getPassword().contentEquals(user.getPassword())) {
    	httpSession.setAttribute("loggedInUser", currentUser.getId());
    	
    	return "redirect:/forsida";
    	}
    	model.addAttribute("loginError", "Notendanafn eða lykilorð er ekki rétt. Reyndu aftur.");
    	return"Innskra";
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

  
