package project.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.List;

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
    	
    	
        System.out.println("username: "+item.getUserName());
        
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

    
    /**
     * Birtir listann af item á forsíðunni í öfugri röð, nýjasta efst
     * @param model
     * @return
     */
    @RequestMapping(value = "/forsida", method = RequestMethod.GET)
    public String prufaViewGet(Model model, HttpSession httpSession){

        //model.addAttribute("item",new Item());
        model.addAttribute("items",itemService.findAllReverseOrder());
        
        return "Forsida";
    }
    

    /**
     * Birtir listann af item á forsíðunni í öfugri röð, nýjasta efst
     * @param model
     * @return
     */
    @RequestMapping(value = "/forsidaloggedin", method = RequestMethod.GET)
    public String prufaViewGet2(Model model){

        //model.addAttribute("item",new Item());
        model.addAttribute("items",itemService.findAllReverseOrder());

        return "ForsidaLoggedIn";
    }
    

    /**
     * Birtir listann af Item á forsíðunni eftir flokkum
     * @param value
     * @param model
     * @return
     */
    @RequestMapping(value = "sortflokkar" , method = RequestMethod. GET)
    public String selectTag(@RequestParam("flokkar") String value, Model model) 
    {
     
        System.out.println(value);
    	model.addAttribute("item",new Item());
        model.addAttribute("items", itemService.findByTag(value));
        
      
      return "Forsida";
    }
    

    /**
     * Birtir listann af Item á forsíðunni eftir póstnúmeri
     * @param value
     * @param model
     * @return
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
    
    
    /**
     * Birtir listann af Item á forsíðunni eftir flokkum
     * @param value
     * @param model
     * @return
     */
    @RequestMapping(value = "sortflokkarloggedin" , method = RequestMethod. GET)
    public String selectTagLoggedIn(@RequestParam("flokkar") String value, Model model) 
    {
     
        System.out.println(value);
    	model.addAttribute("item",new Item());
        model.addAttribute("items", itemService.findByTag(value));
        
      
      return "ForsidaLoggedIn";
    }
    

    /**
     * Birtir listann af Item á forsíðunni eftir póstnúmeri
     * @param value
     * @param model
     * @return
     */
    @RequestMapping(value = "sortziploggedin" , method = RequestMethod. GET)
    public String selectZipLoggedIn(@RequestParam("zip") String value, Model model) 
    {
     
        System.out.println(value);
        int zipcode = Integer.parseInt(value);	
    	model.addAttribute("item",new Item());
        model.addAttribute("items", itemService.findByZipcode(zipcode));
        
      
      return "ForsidaLoggedIn";
    }
    
    
    /**
     * Mitt svæði
     * @param model
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "/mittsvaedi", method = RequestMethod.GET)
    public String getMittSvaedi(Model model, HttpSession httpSession){
    	
    	Long userId = (Long)httpSession.getAttribute("loggedInUser");
    	System.out.println(userId);
    	
        String userName = (String) httpSession.getAttribute("loggedInUsername");
        System.out.println("Username: "+userName);
        
        if(userId==null)
    		return "Innskra";
    	
        //User user = userService.findOne(userId);  --VILLA
       
        //Itemin sem Userinn er að gefa
        //model.addAttribute("myItems", itemService.findByuserName(user.getUserName()));
        model.addAttribute("myItems", itemService.findByuserName(userName));
       
        //Itemin sem Userinn er að bíða eftir
        //model.addAttribute("itemsIWant", itemService.findByusers(user.getUserName()));
        model.addAttribute("itemsIWant", itemService.findByusers(userName));
    
        return "Mittsvaedi";
    }
    
    /**
     * Skoða item nánar
     * @param model
     * @param item
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "/skodaitem/{id}", method = RequestMethod.GET)
    public String skodaItem(Model model, Item item) {
    	
       
        Item skodaNanarItem = itemService.findOne(item.getId());
       
        model.addAttribute("skodaitem", itemService.findOne(skodaNanarItem.getId()));
    	
        // Return the view
        return "SkodaItem";
    }
    
    @RequestMapping(value = "/skodaitemloggedin/{id}", method = RequestMethod.GET)
    public String skodaItemLoggedIn(Model model, Item item) {
    	
       
        Item skodaNanarItem = itemService.findOne(item.getId());
       
        model.addAttribute("skodaitem", itemService.findOne(skodaNanarItem.getId()));
    	
        // Return the view
        return "SkodaItemLoggedIn";
    }
    
    
    
    
    /*
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
    */
    
    /**
     * Fara í röð fyrir hlut
     */
    @RequestMapping(value = "/skodaitemloggedin/{id}", method = RequestMethod.POST)
    public String enterQueue(@ModelAttribute("item") Item item, Model model, HttpSession httpSession) {
        System.out.println("Users fyrst: "+item.getUsers());
        Long userId = (Long)httpSession.getAttribute("loggedInUser");
        System.out.println("UserID: "+userId);
        
        String userName = (String) httpSession.getAttribute("loggedInUsername");
        System.out.println("Username: "+userName);
        
        
        if(userId==null)
            return "Innskra";
        
        //User user = userService.findOne(userId);
        
        Long itemId = item.getId();
        
        System.out.println("ItemID: "+item.getId());
        
        Item theitem = itemService.findOne(itemId);
        System.out.println("Users fyrir: "+theitem.getUsers());
        
        List<User> users = userService.findByItemId(itemId);
        System.out.println("USERS: "+users.indexOf(0));
        
        //bætir username við users
        theitem.setUsers(userName);

        //theitem.addUsers(user.getUserName());

        System.out.println("HALLO "+theitem.getUsers().length());
        System.out.println("Users eftir: "+theitem.getUsers());
        //save-ar itemið með breytingum
        itemService.save(theitem);

        return "redirect:/skodaitemloggedin/{id}";
    }
    
    
    /**
     * Fara úr röð fyrir hlut
     */
    @RequestMapping(value = "/skodaitem/leavequeue", method = RequestMethod.POST)
    public String leaveQueue(@ModelAttribute("item") Item item, Model model, HttpSession httpSession){
         
       Long userId = (Long)httpSession.getAttribute("loggedInUser");
       if(userId==null)
            return "Innskra";
        
       User user = userService.findOne(userId);

       Item theitem = itemService.findOne(item.getId());
       //deletar username frá users
       theitem.setUsers("");
       //theitem.removeUsers(user.getUserName());

       //savear itemið með breitingum
       itemService.save(theitem);


       return "SkodaItemLoggedIn";
    }
    
    /*
     * Leitar af auglýsingum sem innihalda leitarorð í heiti(itemName) og lýsingu(description) í lista af items
     */
    @RequestMapping(value = "searchlisti", method = RequestMethod.GET)
    public String searchItems(@RequestParam (value = "leita", required = false) String searchwords, Model model) {
                    
        model.addAttribute("items", itemService.findByItemNameContainsOrDescriptionContains(searchwords, searchwords));
        
        return "Forsida";
    }
    

    
}
