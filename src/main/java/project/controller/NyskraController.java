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
import project.persistence.entities.Nyskraning;
import project.service.NyskraService;

@Controller
public class NyskraController {

    // Instance Variables
    private NyskraService nyskraService;

    // Dependency Injection
    @Autowired
    public NyskraController(NyskraService nyskraService) {
        this.nyskraService = nyskraService;
    }

    
    // Returns the view of Nyskra.jsp 
    @RequestMapping(value = "/nyskra", method = RequestMethod.GET)
    public String nyskra(Model model){
    	
    	 model.addAttribute("nyskraning",new Nyskraning());
    	 

        return "Nyskra";
    }
    
    @RequestMapping(value = "/nyskra", method = RequestMethod.POST)
    public String nyskraPost(@ModelAttribute("nyskra") Nyskraning nyskraning,
            Model model){
    	
    	nyskraning = nyskraService.save(nyskraning);

        // Here we get all the Postit Notes (in a reverse order) and add them to the model
        //model.addAttribute("nyskraningar", nyskraService.findAllReverseOrder());
        
        model.addAttribute("nyskraningar", nyskraning);
        // Add a new Postit Note to the model for the form
        // If you look at the form in PostitNotes.jsp, you can see that we
        // reference this attribute there by the name `postitNote`.
        //model.addAttribute("nyskraning", nyskraning);
        
   	 	model.addAttribute("nyskraning",new Nyskraning());
    
        return "Nyskra";
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
    /*
    @RequestMapping(value = "/innskra", method = RequestMethod.POST)
    public String innskraUser(@ModelAttribute("form") Form form,
            Model model){
    	
    	formService.save(form);

        // Here we get all the Postit Notes (in a reverse order) and add them to the model
        model.addAttribute("forms", formService.findAllReverseOrder());
       
        // Add a new Postit Note to the model for the form
        // If you look at the form in PostitNotes.jsp, you can see that we
        // reference this attribute there by the name `postitNote`.
        model.addAttribute("form", new Form());
    
        return "Innskra";
    }*/
    
    /*
    @RequestMapping(value = "/formid", method = RequestMethod.GET)
    public String addUser(Model model) {
 	   Form form = new Form();
 	   List<String> preCheckedVals = new ArrayList<String>();
 	   preCheckedVals.add("Húsgögn");
 	   form.setFlokkar(preCheckedVals);
 	   model.addAttribute("form", form);
 	   List<String> flokkar = new ArrayList<String>();
 	   flokkar.add("Húsgögn");
 	   model.addAttribute("flokkar", flokkar);
       return "Forms";
    }*/
    
  /*
    @RequestMapping(value="/formid", method = RequestMethod.GET)
    public ModelAndView user() {        
        return new ModelAndView("form", "command", new Form());
    }
     
    @RequestMapping(value = "/formid", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("SpringWeb")Form form, 
       Model model) {
       model.addAttribute("notaupplys", form.getNotaupplys());
       return "Forms";
    }*/
}

  
