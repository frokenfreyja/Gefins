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

   
    /* 
     * Síðan þar sem sett er inn ný auglýsing
     * Bætir Item við Database
     * Raðar þeim í öfuga stafrófsröð þar sem nýjasta
     * auglýsing birtist efst í auglýsingalistanum
     * Sér um Get request fyrir URL-ið
     */
    @RequestMapping(value = "/nyauglysing", method = RequestMethod.GET)
    public String itemViewGet(Model model) {	
    	
        
    	model.addAttribute("item",new Item());
        model.addAttribute("items",itemService.findAllReverseOrder());
        
        return "NyAuglysing";
    }

    /*
     * Aðferð sem tekur inn item  
     * Vistar upplýsingarnar úr forminu í Database
     * Birtir forsíðuna aftur 
     * Hér hefur item verið bætt efst í listann
     */
    @RequestMapping(value = "/nyauglysing", method = RequestMethod.POST)
    public String formViewItem(@ModelAttribute("item") Item item,
                                     Model model){
        itemService.save(item);
        model.addAttribute("items", itemService.findAllReverseOrder());
        model.addAttribute("item", new Item());

        return "Forsida";
    }
    
    /*
     * Birtir listann af item á forsíðunni í öfugri röð, nýjasta efst
     */
    @RequestMapping(value = "/forsida", method = RequestMethod.GET)
    public String prufaViewGet(Model model){

      //  model.addAttribute("item",new Item());
        model.addAttribute("items",itemService.findAllReverseOrder());

        return "Forsida";
    }
    
    
    
   /* @RequestMapping(value = "/forsida", method = RequestMethod.POST)
    public String prufaViewPost(@ModelAttribute("item") Item item,
                                     Model model){

        // Save the Postit Note that we received from the form
        itemService.save(item);

        // Here we get all the Postit Notes (in a reverse order) and add them to the model
       // model.addAttribute("items", itemService.findAllReverseOrder());

        // Add a new Postit Note to the model for the form
        // If you look at the form in PostitNotes.jsp, you can see that we
        // reference this attribute there by the name `postitNote`.
        model.addAttribute("item", new Item());

        // Return the view
        return "Forsida";
    }*/
    
  
    
}
