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
import project.persistence.entities.Item;
import project.service.ItemService;

@Controller
public class ItemController {

    // Instance Variables
    private ItemService itemService;

    // Dependency Injection
    @Autowired
    public ItemController(ItemService itemService) {
        this.itemService = itemService;
    }

    // Method that returns the correct view for the URL /postit
    // This handles the GET request for this URL
    // Notice the `method = RequestMethod.GET` part
    @RequestMapping(value = "/nyauglysing", method = RequestMethod.GET)
    public String itemViewGet(Model model){

        // Add a new Postit Note to the model for the form
        // If you look at the form in PostitNotes.jsp, you can see that we
        // reference this attribute there by the name `postitNote`.
        model.addAttribute("item",new Item());

        // Here we get all the Postit Notes (in a reverse order) and add them to the model
        model.addAttribute("items",itemService.findAllReverseOrder());
        
        return "NyAuglysing";
    }

    // Method that receives the POST request on the URL /postit
    // and receives the ModelAttribute("postitNote")
    // That attribute is the attribute that is mapped to the form, so here
    // we can save the postit note because we get the data that was entered
    // into the form.
    // Notice the `method = RequestMethod.POST` part
    @RequestMapping(value = "/nyauglysing", method = RequestMethod.POST)
    public String formViewPost(@ModelAttribute("item") Item item,
                                     Model model){

        // Save the Postit Note that we received from the form
        itemService.save(item);

        // Here we get all the Postit Notes (in a reverse order) and add them to the model
        model.addAttribute("items", itemService.findAllReverseOrder());

        // Add a new Postit Note to the model for the form
        // If you look at the form in PostitNotes.jsp, you can see that we
        // reference this attribute there by the name `postitNote`.
        model.addAttribute("item", new Item());

        // Return the view
        return "Forsida";
    }
    


    // Method that returns the correct view for the URL /postit/{name}
    // The {name} part is a Path Variable, and we can reference that in our method
    // parameters as a @PathVariable. This enables us to create dynamic URLs that are
    // based on the data that we have.
    // This method finds all Postit Notes posted by someone with the requested {name}
    // and returns a list with all those Postit Notes.

    /*
    @RequestMapping(value = "/prufa", method = RequestMethod.GET)
    public String prufa(){

        // The string "Prufa" that is returned here is the name of the view
        // (the Prufa.jsp file) that is in the path /main/webapp/WEB-INF/jsp/
        // If you change "Prufa" to something else, be sure you have a .jsp
        // file that has the same name
        return "Prufa";
    }*/
    
    @RequestMapping(value = "/forsida", method = RequestMethod.GET)
    public String prufaViewGet(Model model){

        // Add a new Postit Note to the model for the form
        // If you look at the form in PostitNotes.jsp, you can see that we
        // reference this attribute there by the name `postitNote`.
        model.addAttribute("item",new Item());

        // Here we get all the Postit Notes (in a reverse order) and add them to the model
        model.addAttribute("items",itemService.findAllReverseOrder());

        // Return the view
        return "Forsida";
    }
    
    @RequestMapping(value = "/forsida", method = RequestMethod.POST)
    public String prufaViewPost(@ModelAttribute("item") Item item,
                                     Model model){

        // Save the Postit Note that we received from the form
        itemService.save(item);

        // Here we get all the Postit Notes (in a reverse order) and add them to the model
        model.addAttribute("items", itemService.findAllReverseOrder());

        // Add a new Postit Note to the model for the form
        // If you look at the form in PostitNotes.jsp, you can see that we
        // reference this attribute there by the name `postitNote`.
        model.addAttribute("item", new Item());

        // Return the view
        return "Forsida";
    }
    
  
    
}
