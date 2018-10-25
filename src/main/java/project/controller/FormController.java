package project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.ArrayList;
import project.persistence.entities.Form;
import project.service.FormService;

@Controller
public class FormController {

    // Instance Variables
    private FormService formService;

    // Dependency Injection
    @Autowired
    public FormController(FormService formService) {
        this.formService = formService;
    }

    // Method that returns the correct view for the URL /postit
    // This handles the GET request for this URL
    // Notice the `method = RequestMethod.GET` part
    @RequestMapping(value = "/formid", method = RequestMethod.GET)
    public String formViewGet(Model model){

        // Add a new Postit Note to the model for the form
        // If you look at the form in PostitNotes.jsp, you can see that we
        // reference this attribute there by the name `postitNote`.
        model.addAttribute("form",new Form());

        // Here we get all the Postit Notes (in a reverse order) and add them to the model
        model.addAttribute("forms",formService.findAllReverseOrder());
        
        return "Forms";
    }

    // Method that receives the POST request on the URL /postit
    // and receives the ModelAttribute("postitNote")
    // That attribute is the attribute that is mapped to the form, so here
    // we can save the postit note because we get the data that was entered
    // into the form.
    // Notice the `method = RequestMethod.POST` part
    @RequestMapping(value = "/formid", method = RequestMethod.POST)
    public String formViewPost(@ModelAttribute("form") Form form,
                                     Model model){

        // Save the Postit Note that we received from the form
        formService.save(form);

        // Here we get all the Postit Notes (in a reverse order) and add them to the model
        model.addAttribute("forms", formService.findAllReverseOrder());

        // Add a new Postit Note to the model for the form
        // If you look at the form in PostitNotes.jsp, you can see that we
        // reference this attribute there by the name `postitNote`.
        model.addAttribute("form", new Form());

        // Return the view
        return "Prufa";
    }
    


    // Method that returns the correct view for the URL /postit/{name}
    // The {name} part is a Path Variable, and we can reference that in our method
    // parameters as a @PathVariable. This enables us to create dynamic URLs that are
    // based on the data that we have.
    // This method finds all Postit Notes posted by someone with the requested {name}
    // and returns a list with all those Postit Notes.
    @RequestMapping(value = "/formid/{heiti}", method = RequestMethod.GET)
    public String formGetNotesFromName(@PathVariable String heiti,
                                             Model model){

        // Get all Postit Notes with this name and add them to the model
        model.addAttribute("forms", formService.findByHeiti(heiti));

        // Add a new Postit Note to the model for the form
        // If you look at the form in PostitNotes.jsp, you can see that we
        // reference this attribute there by the name `postitNote`.
        model.addAttribute("form", new Form());

        // Return the view
        return "Prufa";
    }
    /*
    @RequestMapping(value = "/prufa", method = RequestMethod.GET)
    public String prufa(){

        // The string "Prufa" that is returned here is the name of the view
        // (the Prufa.jsp file) that is in the path /main/webapp/WEB-INF/jsp/
        // If you change "Prufa" to something else, be sure you have a .jsp
        // file that has the same name
        return "Prufa";
    }*/
    
    @RequestMapping(value = "/prufa", method = RequestMethod.GET)
    public String prufaViewGet(Model model){

        // Add a new Postit Note to the model for the form
        // If you look at the form in PostitNotes.jsp, you can see that we
        // reference this attribute there by the name `postitNote`.
        model.addAttribute("form",new Form());

        // Here we get all the Postit Notes (in a reverse order) and add them to the model
        model.addAttribute("forms",formService.findAllReverseOrder());

        // Return the view
        return "Prufa";
    }
    
    @RequestMapping(value = "/prufa", method = RequestMethod.POST)
    public String prufaViewPost(@ModelAttribute("form") Form form,
                                     Model model){

        // Save the Postit Note that we received from the form
        formService.save(form);

        // Here we get all the Postit Notes (in a reverse order) and add them to the model
        model.addAttribute("forms", formService.findAllReverseOrder());

        // Add a new Postit Note to the model for the form
        // If you look at the form in PostitNotes.jsp, you can see that we
        // reference this attribute there by the name `postitNote`.
        model.addAttribute("form", new Form());

        // Return the view
        return "Prufa";
    }
   /*
    // Returns the view of Nyskra.jsp 
    @RequestMapping(value = "/nyskra", method = RequestMethod.GET)
    public String nyskra(Model model){
    	
    	 model.addAttribute("form",new Form());
    	 

        return "Nyskra";
    }
    
    @RequestMapping(value = "/nyskra", method = RequestMethod.POST)
    public String nyskraPost(@ModelAttribute("nyskra") Form form,
            Model model){
    	
    	formService.save(form);

        // Here we get all the Postit Notes (in a reverse order) and add them to the model
        model.addAttribute("forms", formService.findAllReverseOrder());
       
        // Add a new Postit Note to the model for the form
        // If you look at the form in PostitNotes.jsp, you can see that we
        // reference this attribute there by the name `postitNote`.
        model.addAttribute("form", new Form());
    
        return "Nyskra";
    }*/
    
  
    // Returns the view of Innskra.jsp
    @RequestMapping(value = "/innskra", method = RequestMethod.GET)
    public String innskra(Model model){
    	
    	model.addAttribute("form",new Form());

        return "Innskra";
    }
    
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
    }
    
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
