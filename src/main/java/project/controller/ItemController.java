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
    public String formViewItem(@ModelAttribute("item") Item item, Model model, HttpServletRequest httpServletRequest, HttpSession httpSession) throws IOException{
        
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
    	

        String userName = (String) httpSession.getAttribute("loggedInUsername");
        item.setUserName(userName);
        
        String location = item.getLocation();
        item.setLocation(location);
        
        
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

    	httpSession.removeAttribute("zip");
    	httpSession.removeAttribute("tag");
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
    public String prufaViewGet2(Model model, HttpSession httpSession){

    	httpSession.removeAttribute("zip");
    	httpSession.removeAttribute("tag");
        //model.addAttribute("item",new Item());
        model.addAttribute("items",itemService.findAllReverseOrder());

        return "ForsidaLoggedIn";
    }
    

    /*
     * Birtir listann af Item á forsíðunni eftir flokkum
     */
    /*@RequestMapping(value = "sortflokkar" , method = RequestMethod. GET)
    public String selectTag(@RequestParam("flokkar") String value, Model model, Item item) 
    {

       if (value.equals("Allir")) {
    	  model.addAttribute("item",new Item());
    	  model.addAttribute("items",itemService.findAllReverseOrder());
       }
       else {
    	model.addAttribute("item",new Item());
        model.addAttribute("items", itemService.findByTag(value));
       }
      
      return "Forsida";
    }*/
    
    
	/*
     * Sækir valið póstnúmer á forsíðunni og sendir í sorter
     */
    @RequestMapping(value = "sortzip" , method = RequestMethod. GET)
    public String selectZip(@RequestParam("zip") String Value, Integer zipcode, HttpSession httpSession, Model model, Item item) 
    {
    	System.out.println(Value);
       
    	httpSession.setAttribute("zip", Value);
    	httpSession.setAttribute("zippath", zipcode);

        if (Value.equals("100")) {
        	httpSession.removeAttribute("zip");
        }
      
        return "redirect:sorter";
    }
    
    /*
     * Sækir valinn flokk á forsíðunni og sendir í sorter 
     */
    @RequestMapping(value = "sortflokkar" , method = RequestMethod. GET)
    public String selectTag(@RequestParam("flokkar") String Value, HttpSession httpSession, Model model, Item item) 
    {
    
    	System.out.println(Value);
    httpSession.setAttribute("tag", Value);

    if (Value.equals("Allir")) {
    	httpSession.removeAttribute("tag");
    }
      
      return "redirect:sorter";
    }
    
    /*
     * Birtir listann af Item eftir póstnúmeri og/eða flokki
     */
    @RequestMapping(value = "sorter" , method = RequestMethod. GET)
    public String sortZipTag(HttpSession httpSession, Model model, Item item) 
    {
    	
    String tag =(String)httpSession.getAttribute("tag");
    String zip =(String)httpSession.getAttribute("zip");
    String zippath =(String)httpSession.getAttribute("zippath");

    
    if( (zip != null) && ( tag == null)){
          int zipcode = Integer.parseInt(zip);		
          Integer zipc = item.getZipcode();
          System.out.println(zipc);
	      model.addAttribute("items", itemService.findByZipcode(zipcode));
	    }
	else if((tag != null) && (zip == null)) {
      model.addAttribute("items", itemService.findByTag(tag));
    }
	else if((tag != null) && (zip != null)) {
      int zipcode = Integer.parseInt(zip);		
	  model.addAttribute("items", itemService.findByZipcodeAndTag(zipcode, tag));

	}
	else {
		model.addAttribute("item",new Item());
        model.addAttribute("items",itemService.findAllReverseOrder());
	}
       
      return "Forsida";
    }
    
    
    

	/*
     * Sækir valið póstnúmer á logged in forsíðunni og sendir í sorter
     */
    @RequestMapping(value = "sortziploggedin" , method = RequestMethod. GET)
    public String selectZipLogged(@RequestParam("zip") String Value, HttpSession httpSession, Model model, Item item) 
    {
    	System.out.println(Value);
       
    	httpSession.setAttribute("zip", Value);

        if (Value.equals("100")) {
        	httpSession.removeAttribute("zip");
        }
      
        return "redirect:sorterloggedin";
    }
    

	/*
     * Sækir valinn flokk á logged in forsíðunni og sendir í sorter
     */
    @RequestMapping(value = "sortflokkarloggedin" , method = RequestMethod. GET)
    public String selectTagLogged(@RequestParam("flokkar") String Value, HttpSession httpSession, Model model, Item item) 
    {
    
    	System.out.println(Value);
    httpSession.setAttribute("tag", Value);

    if (Value.equals("Allir")) {
    	httpSession.removeAttribute("tag");
    }
      
      return "redirect:sorterloggedin";
    }
    
    /*
     * Birtir listann af Item eftir póstnúmeri og/eða flokki
     */
    @RequestMapping(value = "sorterloggedin" , method = RequestMethod. GET)
    public String sortZipTagLogged(HttpSession httpSession, Model model, Item item) 
    {
    	
    String tag =(String)httpSession.getAttribute("tag");
    String zip =(String)httpSession.getAttribute("zip");
    
    if( (zip != null) && ( tag == null)){
          int zipcode = Integer.parseInt(zip);	
	      model.addAttribute("items", itemService.findByZipcode(zipcode));
	    }
	else if((tag != null) && (zip == null)) {
      model.addAttribute("items", itemService.findByTag(tag));
    }
	else if((tag != null) && (zip != null)) {
      int zipcode = Integer.parseInt(zip);		
	  model.addAttribute("items", itemService.findByZipcodeAndTag(zipcode, tag));

	}
	else {
		model.addAttribute("item",new Item());
        model.addAttribute("items",itemService.findAllReverseOrder());
	}
       
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
    	
        model.addAttribute("myItems", itemService.findByuserName(userName));

        model.addAttribute("itemsIWant", itemService.findByusers(userName));
    
        return "Mittsvaedi";
    }
    
    /**
     * Eyða auglýsingu - GET
     * @param model
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "/mittsvaedi/{id}", method = RequestMethod.GET)
    public String getRemoveAd(Model model, HttpSession httpSession){
    	
    	Long userId = (Long)httpSession.getAttribute("loggedInUser");
    	System.out.println(userId);
    	
        String userName = (String) httpSession.getAttribute("loggedInUsername");
        System.out.println("Username: "+userName);
        
        if(userId==null)
    		return "Innskra";
        
        model.addAttribute("myItems", itemService.findByuserName(userName));
        
        model.addAttribute("itemsIWant", itemService.findByusers(userName));
        
    	return "Mittsvaedi";
    }
    
    /**
     * Eyða auglýsingu - POST
     * @param item
     * @param model
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "/mittsvaedi/{id}", method = RequestMethod.POST)
    public String removeAd(@ModelAttribute("item") Item item, Model model, HttpSession httpSession) {

        Long userId = (Long)httpSession.getAttribute("loggedInUser");
        System.out.println("UserID: "+userId);
        
        String userName = (String) httpSession.getAttribute("loggedInUsername");
        System.out.println("Username: "+userName);
        
        Long itemId = item.getId();
        
        System.out.println("ItemID: "+item.getId());
        
        Item theitem = itemService.findOne(itemId);
        
        itemService.delete(theitem);

        model.addAttribute("myItems", itemService.findByuserName(userName));

        model.addAttribute("itemsIWant", itemService.findByusers(userName));
    	
    	return "redirect:/mittsvaedi/{id}";
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
    
    
    /**
     * Fara í röð fyrir hlut
     */
    @RequestMapping(value = "/skodaitemloggedin/{id}", method = RequestMethod.POST)
    public String enterQueue(@ModelAttribute("item") Item item, Model model, HttpSession httpSession) {

    	 Item skodaNanarItem = itemService.findOne(item.getId());
    	
    	 httpSession.setAttribute("idRod", skodaNanarItem);

         
         model.addAttribute("skodaitem", itemService.findOne(skodaNanarItem.getId()));
         
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
        
        //bætir username við users
        theitem.setUsers(userName);
        httpSession.setAttribute("theitem", theitem);

        //theitem.addUsers(user.getUserName());

        //save-ar itemið með breytingum
        itemService.save(theitem);

        return "SkodaItemIRod";
    }
    
    
    /**
     * Fara úr röð fyrir hlut
     */
    @RequestMapping(value = "/skodaitemirod", method = RequestMethod.POST)
    public String leaveQueue(@ModelAttribute("item") Item item, Model model, HttpSession httpSession){
    	 
    	 Item itemId = (Item)httpSession.getAttribute("idRod");
         
         model.addAttribute("skodaitem", itemService.findOne(itemId.getId()));
         System.out.println(itemId);
        
       /*Long userId = (Long)httpSession.getAttribute("loggedInUser");
       if(userId==null)
            return "Innskra";
        
       User user = userService.findOne(userId);

       Item theitem = itemService.findOne(item.getId());
       //deletar username frá users
       theitem.setUsers("");
       //theitem.removeUsers(user.getUserName());

       //savear itemið með breitingum
       itemService.save(theitem);*/

      /*  Long itemId = item.getId();
        
        String userName = (String) httpSession.getAttribute("loggedInUsername");
        
        Item theitem = itemService.findOne(itemId);
       
        
        //eyðir username úr users
       // theitem.remove(userName);

        //theitem.addUsers(user.getUserName());

        //save-ar itemið með breytingum
        itemService.save(theitem);*/
       return "SkodaItemLoggedIn";
    }
    
    /*
     * Skoða eitt Item sem eigandi Items
     */
    @RequestMapping(value = "/skodaitemeigandi", method = RequestMethod.GET)
    public String seeItemAsOwner(Model model, Item item, HttpSession httpSession) {
    	
       
    	Item itemId = (Item)httpSession.getAttribute("idRod");
        
        model.addAttribute("skodaitem", itemService.findOne(itemId.getId()));
    	
        // Return the view
    
       return "SkodaItemEigandi";
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
