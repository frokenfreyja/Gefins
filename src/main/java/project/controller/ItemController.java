package project.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;

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
    public String formViewItem(@ModelAttribute("item") Item item, Model model, @RequestParam("mynd") MultipartFile imagefile, HttpServletRequest httpServletRequest) throws IOException{
        itemService.save(item); 
        
    	imagefile.getInputStream();
    	
    	if (item.getMynd()==null) throw new NullPointerException("unable to fetch"+imagefile);
    	String rootDirectory = httpServletRequest.getSession().getServletContext().getRealPath("/");
    	if(item.getMynd() != null && !item.getMynd().isEmpty())
    		try {
    			File path = new File(rootDirectory + "resources/images/"+imagefile.getOriginalFilename());
    			imagefile.transferTo(path);
    			System.out.println(path);
    		} catch (IllegalStateException | IOException e) {
    			e.printStackTrace();
    		}
    	System.out.println(imagefile);
    	
    	System.out.println(item.getMynd());

    	model.addAttribute("mynd", imagefile.getOriginalFilename());
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
    	model.addAttribute("mynd",itemService.findAllReverseOrder());
        model.addAttribute("items",itemService.findAllReverseOrder());

        return "Forsida";
    }
    
    @RequestMapping(value = "/mittsvaedi", method = RequestMethod.GET)
    public String getMittSvaedi(){

        // The string "Index" that is returned here is the name of the view
        // (the Index.jsp file) that is in the path /main/webapp/WEB-INF/jsp/
        // If you change "Index" to something else, be sure you have a .jsp
        // file that has the same name
        return "Mittsvaedi";
    }
    
    @RequestMapping(value = "/nyauglysing/{itemName}", method = RequestMethod.GET)
    public String getUserName(@PathVariable String itemName,
                                             Model model){


    	model.addAttribute("item",new Item());
       
        model.addAttribute("items", itemService.findByItemName(itemName));

        // Return the view
        return "SkodaItem";
    }
    
   /* @RequestMapping(value = "nyauglysing/{itemName}", method = RequestMethod.POST)
    public String formSkodaItem(@ModelAttribute("item") Item item, String itemName, Model model, @RequestParam("mynd") MultipartFile imagefile, HttpServletRequest httpServletRequest) throws IOException{
       itemService.save(item); */

    	/*imagefile.getInputStream();
    	
    	if (item.getMynd()==null) throw new NullPointerException("unable to fetch"+imagefile);
    	String rootDirectory = httpServletRequest.getSession().getServletContext().getRealPath("/");
    	if(item.getMynd() != null && !item.getMynd().isEmpty())
    		try {
    			File path = new File(rootDirectory + "resources/images/"+imagefile.getOriginalFilename());
    			imagefile.transferTo(path);
    			System.out.println(path);
    		} catch (IllegalStateException | IOException e) {
    			e.printStackTrace();
    		}
    	System.out.println(imagefile);
    	model.addAttribute("items", itemService.findByItemName(itemName));
    	System.out.println(item.getMynd());
        model.addAttribute("itemName", item.getItemName());
    	model.addAttribute("mynd", imagefile.getOriginalFilename());
        model.addAttribute("item", new Item());
        

        return "SkodaItem";
    }*/
    
}
