package project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import project.persistence.entities.Item;
import project.persistence.entities.User;
import project.service.ItemService;
import project.service.UserService;

@Controller
public class UserController {

    // Instance Variables
    private ItemService itemService;
    private UserService userService;

    // Dependency Injection
    @Autowired
    public UserController(UserService userService, ItemService itemService) {
        this.userService = userService;
    	this.itemService = itemService;
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
    public String nyskraPost(User user, Model model){
    	
    	User exist = this.userService.findOneByName(user);
    	if (exist!=null) {
    		model.addAttribute("user", new User());
    		model.addAttribute("nyskraError", "Notendanafn er nú þegar til.");
    		return "Nyskra";
    	}
    	
    	user = userService.save(user);
    	model.addAttribute("user", new User());
        return "Innskra";
    }
    
    
    /**
     * Innskrá - GET
     * @param model
     * @return
     */
    @RequestMapping(value = "/innskra", method = RequestMethod.GET)
    public String innskra(Model model){
    	
    	model.addAttribute("user",new User());

        return "Innskra";
    }

   
    /**
     * Innskrá - POST
     * @param model
     * @param httpSession
     * @param user
     * @return
     */

    @RequestMapping(value = "/innskra", method = RequestMethod.POST)
    public String innskraUser(Model model, HttpSession httpSession, User user){
    	User currentUser =this.userService.findOneByName(user);
    	
    	if (currentUser!=null && currentUser.getPassword().contentEquals(user.getPassword())) {
    	httpSession.setAttribute("loggedInUser", currentUser.getId());
    	httpSession.setAttribute("loggedInUsername", currentUser.getUserName());
    	
    	return "redirect:/forsidaloggedin";
    	}
    	model.addAttribute("innskraError", "Notendanafn eða lykilorð er ekki rétt. Reyndu aftur.");
    	return"Innskra";
    }
    
    
    /**
     * Útskrá
     * @param session
     * @return
     */
    @RequestMapping(value = "/utskra", method = RequestMethod.GET)
    public String utskra(HttpSession session){
    	
    	session.removeAttribute("loggedInUser");
    	
    	return "redirect:/forsida";
    }
    
    
    /**
     * Settings - GET
     * @param model
     * @param httpSession
     * @return
     */
	@RequestMapping(value = "/settings", method = RequestMethod.GET)
    public String viewSettings(Model model, HttpSession httpSession) {
		
    	Long userId = (Long)httpSession.getAttribute("loggedInUser");
        String userName = (String) httpSession.getAttribute("loggedInUsername");

    	if(userId==null)
    		return "Innskra";
    	
       User user = this.userService.findByuserName(userName);
       
       model.addAttribute("user", user);
       
       return "Settings";
    }
    
    /**
     * Settings - POST
     * @param model
     * @param httpSession
     * @param user
     * @return
     */
    @RequestMapping(value = "/settings", method = RequestMethod.POST)
    public String changesSettings(User user, Model model, HttpSession httpSession) {
    	
    	Long userId = (Long)httpSession.getAttribute("loggedInUser");
        String userName = (String) httpSession.getAttribute("loggedInUsername");
        
    	if(userId==null)
    		return "Innskra";
       
    	
        User theuser = userService.findByuserName(userName);
        
    	User exist = this.userService.findOneByName(user);
    	if (exist != null && !user.getUserName().equals(theuser.getUserName())) {
            model.addAttribute("user", theuser);
    		model.addAttribute("stillingarError", "Notendanafn er nú þegar til.");
    		return "Settings";
    	} 
            
    	itemService.changeName(userName,user.getUserName());
    	theuser.setUserName(user.getUserName());     
    	theuser.setPassword(user.getPassword());      
    	theuser.setEmail(user.getEmail());
        theuser.setPhone(user.getPhone());
        theuser.setLocation(user.getLocation());
        theuser.setZipcode(user.getZipcode());
        
        httpSession.setAttribute("loggedInUsername", theuser.getUserName());
       
        userService.save(theuser);
        
        model.addAttribute("user", theuser);
       
        return "Settings";
    }
    
    /**
     * Eyða aðgangi - GET
     * @param model
     * @param httpSession
     * @return
     */
	@RequestMapping(value = "/settings/{id}", method = RequestMethod.GET)
    public String deleteAccount(Model model, HttpSession httpSession) {
		
    	Long userId = (Long)httpSession.getAttribute("loggedInUser");
        String userName = (String) httpSession.getAttribute("loggedInUsername");

    	if(userId==null)
    		return "Innskra";
    	
    	
       User user = this.userService.findByuserName(userName);

       model.addAttribute("user", user);
       
       return "Settings";
    }
	
	/**
	 * Eyða aðgangi - POST
	 * @param user
	 * @param model
	 * @param httpSession
	 * @return
	 */
    @RequestMapping(value = "/settings/{id}", method = RequestMethod.POST)
    public String deleteAccountPost(@ModelAttribute("user") User user, Model model, HttpSession httpSession) {
    	
    	Long userId = (Long)httpSession.getAttribute("loggedInUser");
        String userName = (String) httpSession.getAttribute("loggedInUsername");     
    	
        User theuser = userService.findByuserName(userName);
        Item item = new Item();
        
        if(userName == item.getAcceptedUser()) 
        	userName="";
        	item.setAcceptedUser("");
        	
        itemService.deleteUserLinks(userName);
        userService.delete(theuser);
        
        model.addAttribute("items",itemService.findAllReverseOrder());
       
        return "Forsida";
    }
    
}

  
