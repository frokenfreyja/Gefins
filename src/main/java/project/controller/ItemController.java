package project.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import project.persistence.entities.User;
import project.service.ItemService;
import project.service.UserService;

@Controller
public class ItemController {

    // Instance Variables
    private ItemService itemService;
    private UserService userService;

    // Dependency Injection
    @Autowired
    public ItemController(ItemService itemService, UserService userService) {
    	this.userService= userService;
    	this.itemService = itemService;
    }

    // Instance Variables
   
    /* 
     * Síðan þar sem sett er inn ný auglýsing
     * Bætir Item við Database
     * Raðar þeim í öfuga stafrófsröð þar sem nýjasta
     * auglýsing birtist efst í auglýsingalistanum
     * Sér um Get request fyrir URL-ið
     */
    @RequestMapping(value = "/nyauglysing", method = RequestMethod.GET)
    public String itemViewGet(Model model, Item item) {	
        
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
    public String formViewItem(@ModelAttribute("item") Item item, Model model, HttpServletRequest httpServletRequest) throws IOException{
        
        MultipartFile imagefile = item.getMynd();
        String fileName;
        
    	imagefile.getInputStream();
    	
    	if (item.getMynd()==null) throw new NullPointerException("unable to fetch"+imagefile);
    	String rootDirectory = httpServletRequest.getSession().getServletContext().getRealPath("/");
    	if(item.getMynd() != null && !item.getMynd().isEmpty())
    		try {
    			File path = new File(rootDirectory + "resources/images/"+imagefile.getOriginalFilename());
    			imagefile.transferTo(path);

    			fileName = imagefile.getOriginalFilename();
    			item.setMyndName(fileName);
    			
    		} catch (IllegalStateException | IOException e) {
    			e.printStackTrace();
    		}   	
        itemService.save(item); 
        model.addAttribute("items", itemService.findAllReverseOrder());
        model.addAttribute("item", new Item());

        return "ForsidaLoggedIn";
    }
    
    /*
     * Birtir listann af item á forsíðunni í öfugri röð, nýjasta efst
     */
    @RequestMapping(value = "/forsida", method = RequestMethod.GET)
    public String prufaViewGet(Model model){

        //model.addAttribute("item",new Item());
        model.addAttribute("items",itemService.findAllReverseOrder());

        return "Forsida";
    }
    
    /*
     * Birtir listann af item á forsíðunni í öfugri röð, nýjasta efst
     */
    @RequestMapping(value = "/forsidaloggedin", method = RequestMethod.GET)
    public String prufaViewGet2(Model model){

        //model.addAttribute("item",new Item());
        model.addAttribute("items",itemService.findAllReverseOrder());

        return "ForsidaLoggedIn";
    }
    
    @RequestMapping(value = "/skodaitem/{itemName}", method = RequestMethod.GET)
    public String getUserName(Model model, Item item, HttpSession httpSession) {
    	
       
        Item skodaNanarItem = itemService.findOne(Long.parseLong(item.getItemName()));
       
        model.addAttribute("skodaitem", itemService.findOne(skodaNanarItem.getId()));
        
        // Return the view
        return "SkodaItem";
    }
    
    /*
     * Birtir listann af Item á forsíðunni eftir flokkum
     */
    @RequestMapping(value = "sortflokkar" , method = RequestMethod. GET)
    public String selectTag(@RequestParam("flokkar") String value, Model model) 
    {
     
        System.out.println(value);
    	model.addAttribute("item",new Item());
        model.addAttribute("items", itemService.findByTag(value));
        
      
      return "Forsida";
    }
    
	/*
     * Birtir listann af Item á forsíðunni eftir póstnúmeri
     */
    @RequestMapping(value = "sortzip" , method = RequestMethod. GET)
    public String selectZip(@RequestParam("zip") String value, Model model) 
    {
     
        System.out.println(value);
        int zipcode = Integer.parseInt(value);	
    	model.addAttribute("item",new Item());
        model.addAttribute("items", itemService.findByZipcode(zipcode));
        
      
      return "Forsida";
    }
    
    
    //ItemController
	//Myspace Síðan
    @RequestMapping(value = "/mittsvaedi", method = RequestMethod.GET)
    public String getMittSvaedi(Model model, HttpSession httpSession){
    	
    	Long userId = (Long)httpSession.getAttribute("loggedInUser");
    	System.out.println(userId);
    	if(userId==null)
    		return "Innskra";
    	
       User user = userService.findOne(userId);
       
       //Itemin sem Userinn er að gefa
        model.addAttribute("myItems", itemService.findByuserName(user.getUserName()));
       
       //Itemin sem Userinn er að bíða eftir
        model.addAttribute("itemsIWant", itemService.findByusers(user.getUserName()));
    
        return "Mittsvaedi";
    }
   
    

    
}
