package project.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import project.persistence.entities.Item;
import project.persistence.entities.User;
import project.persistence.repositories.ItemRepository;
import project.persistence.repositories.UserRepository;
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
    
    @Autowired
    private ItemRepository itemRepository;
    
    @Autowired
    private UserRepository userRepository;

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
    	Long userId = (Long)httpSession.getAttribute("loggedInUser");
        
        if (userId != null) {
        	return "redirect:/forsidaloggedin";
        }

        
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
  
    
    /**
     * Mitt svæði
     * @param model
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "/mittsvaedi", method = RequestMethod.GET)
    public String getMittSvaedi(Model model, HttpSession httpSession){
    	
        String userName = (String) httpSession.getAttribute("loggedInUsername");
    	
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
    public String skodaItemLoggedIn(Model model, Item item, HttpSession httpSession) {
    			
        Item skodaNanarItem = itemService.findOne(item.getId());
        
        String userName = (String) httpSession.getAttribute("loggedInUsername");
        
        if(skodaNanarItem.getUsers().contains(userName)) {
            model.addAttribute("skodaitem", itemService.findOne(skodaNanarItem.getId()));
            
        	return "SkodaItemIRod";
        }
       
        model.addAttribute("skodaitem", itemService.findOne(skodaNanarItem.getId()));
    	
        // Return the view
        return "SkodaItemLoggedIn";
    }
    
    @RequestMapping(value = "/skodaitemirod/{id}", method = RequestMethod.GET)
    public String skodaItemIRod(Model model, Item item) {
    	
       
        Item skodaNanarItem = itemService.findOne(item.getId());
       
        model.addAttribute("skodaitem", itemService.findOne(skodaNanarItem.getId()));
    	
        // Return the view
        return "SkodaItemIRod";
    }
    
    /*
     * Skoða eitt Item sem eigandi Items
     */
    @RequestMapping(value = "/skodaitemeigandi/{id}", method = RequestMethod.GET)
    public String seeItemAsOwner(Model model, Item item, HttpSession httpSession) {
    	
        Long userId = (Long)httpSession.getAttribute("loggedInUser");
        
        String userName = (String) httpSession.getAttribute("loggedInUsername");

        Item skodaNanarItem = itemService.findOne(item.getId());
        
        model.addAttribute("skodaitem", itemService.findOne(skodaNanarItem.getId()));
    	
        // Return the view
       return "SkodaItemEigandi";
    }
    
    /*
     * Skoða eitt accepted Item sem þú hefur verið merktur sem þiggjandi fyrir
     */
    @RequestMapping(value = "/skodaitemaccepted/{id}", method = RequestMethod.GET)
    public String seeItemAccepted(Model model, Item item) {

        Item skodaNanarItem = itemService.findOne(item.getId());
        User user = userService.findByuserName(skodaNanarItem.getUserName());
        
        model.addAttribute("userEmail", user.getEmail());
        model.addAttribute("skodaitem", itemService.findOne(skodaNanarItem.getId()));
    	
        // Return the view
       return "SkodaItemAccepted";
    }
    
    
    /**
     * Fara í röð fyrir hlut
     */
    @RequestMapping(value = "/skodaitemloggedin/{id}", method = RequestMethod.POST)
    public String enterQueue(@ModelAttribute("item") Item item, Model model, HttpSession httpSession) {
         
        
       Long userId = (Long)httpSession.getAttribute("loggedInUser");
       System.out.println("UserID: "+userId);
       
       String userName = (String) httpSession.getAttribute("loggedInUsername");
       System.out.println("Username: "+userName);
       
       
       if(userId==null)
           return "Innskra";
       
       
       Long itemId = item.getId();
       
       System.out.println("ItemID: "+item.getId());
       
       Item theitem = itemService.findOne(itemId);
       System.out.println("Users fyrir: "+theitem.getUsers());
       
       //bætir username við users
       theitem.addUsers(userName);

       //save-ar itemið með breytingum
       itemService.save(theitem);
       
       return "redirect:/skodaitemirod/{id}";
    }
    
    
    /**
     * Fara úr röð fyrir hlut
     */
    @RequestMapping(value = "/skodaitemirod/{id}", method = RequestMethod.POST)
    public String leaveQueue(@ModelAttribute("item") Item item, Model model, HttpSession httpSession) {
    	
        Long userId = (Long)httpSession.getAttribute("loggedInUser");
        String userName = (String) httpSession.getAttribute("loggedInUsername");
        
        if(userId==null)
             return "Innskra";
         
        Item theitem = itemService.findOne(item.getId());
        
        System.out.println(userName+theitem.getAcceptedUser());

        if(userName == theitem.getAcceptedUser()) 
        	userName="";
        	theitem.setAcceptedUser("");
        
        System.out.println("Username: "+userName+"AcceptedUser: "+theitem.getAcceptedUser());
        
        //User user = userService.findByuserName(theitem.getUsers().get(0));
        
        //deletar username frá users
       theitem.removeUsers(userName);
       //user.subtractFromNotify();
       

        //savear itemið með breitingum
        itemService.save(theitem);
        //userService.save(user);
       return "redirect:/skodaitemloggedin/{id}";
    }
    
    /**
     * Skoða Item þar sem búið er að accepta þig sem þiggjanda.
     */
    @RequestMapping(value = "/skodaitemeigandi/{id}", method = RequestMethod.POST)
    public String skodaSemEigandi(@ModelAttribute("item") Item item, Model model, HttpSession httpSession) {
    	
        Long userId = (Long)httpSession.getAttribute("loggedInUser");
        String userName = (String) httpSession.getAttribute("loggedInUsername");

        Item theitem = itemService.findOne(item.getId());
        theitem.setAcceptedUser(theitem.getUsers().get(0));
        //theitem.setAcceptedUser(userName);

        User user = userService.findByuserName(theitem.getUsers().get(0));
        user.addToNotify();
        
        System.out.println("acceptedUser: "+theitem.getAcceptedUser());

        //savear itemið með breytingum
        itemService.save(theitem);
        userService.save(user);

        return "redirect:/skodaitemeigandi/{id}";
    }
    
    /**
     * 
     */
    @RequestMapping(value = "/skodaitemeigandiremove/{id}", method = RequestMethod.POST)
    public String removeUserAsOwner(@ModelAttribute("item") Item item, Model model, HttpSession httpSession) {
    	
        Long userId = (Long)httpSession.getAttribute("loggedInUser");
        String userName = (String) httpSession.getAttribute("loggedInUsername");

        Item theitem = itemService.findOne(item.getId());
        //deletar username frá users
        
        
        List<String> usersInQueue = theitem.getUsers();
        System.out.println("usersInQueue: "+usersInQueue);
        
        theitem.removeUsers(usersInQueue.get(0));
        System.out.println("removedUser: "+theitem.getUsers());

        //savear itemið með breytingum
        itemService.save(theitem);
        

        return "redirect:/skodaitemeigandi/{id}";
    }
    
    /**
     * Skoða Item þar sem búið er að accepta þig sem þiggjanda.
     */
    @RequestMapping(value = "/skodaitemaccepted/{id}", method = RequestMethod.POST)
    public String skodaAccepted(@ModelAttribute("item") Item item, Model model, HttpSession httpSession) {
    	
        Long userId = (Long)httpSession.getAttribute("loggedInUser");
        String userName = (String) httpSession.getAttribute("loggedInUsername");

        Item theitem = itemService.findOne(item.getId());
        //deletar username frá users
        
        //savear itemið með breytingum
        itemService.save(theitem);
        

        return "ForsidaLoggedIn";
    }
    
    /*
     * Leitar af auglýsingum sem innihalda leitarorð í heiti(itemName) og lýsingu(description) í lista af items
     */
    @RequestMapping(value = "searchlistx", method = RequestMethod.GET)
    public String searchItems(@RequestParam (value = "searching", required = false) String searchwords, Model model) {
                 
        model.addAttribute("items", itemService.findByItemNameContainsIgnoreCaseOrDescriptionContainsIgnoreCase(searchwords, searchwords));
        
        return "Forsida";
    }
    
    /*
     * Hreinsar leitina og skilar aftur fullum lista af items
     */
    @RequestMapping(value = "clearsearch", method = RequestMethod.GET)
    public String clearSearch(Model model, Item item) { 
        
        model.addAttribute("item",new Item());
        model.addAttribute("items",itemService.findAllReverseOrder());
        
        return "Forsida";
    }
    
    /*
     * Sækir valið póstnúmer á forsíðunni og sendir í sorter
     */
    @RequestMapping(value = "sortzip" , method = RequestMethod. GET)
    public String selectZip(@RequestParam("zip") String Value, Integer zipcode, HttpSession httpSession, Model model, Item item) 
    {
        System.out.println(Value);
       
        httpSession.setAttribute("zip", Value);
        if (Value.equals("100")) {
            httpSession.removeAttribute("zip");
        }
      
        return "redirect:sorter";
    }
    
    /*
     * Sækir valinn flokk á forsíðunni og sendir í sorter 
     */
    @RequestMapping(value = "sortcategory" , method = RequestMethod. GET)
    public String selectTag(@RequestParam("category") String Value, HttpSession httpSession, Model model, Item item) 
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
    System.out.println(zip + "og " + tag);
    
    if( (zip != null) && ( tag == null)){
          int zipcode = Integer.parseInt(zip);      
          Integer zipc = item.getZipcode();
          System.out.println(zipc);
          model.addAttribute("items", itemService.findByZipcodeReverseOrder(zipcode));
        //  model.addAttribute("zippid", itemService.findByZipcode(zipcode));
        }
    else if((tag != null) && (zip == null)) {
      model.addAttribute("items", itemService.findByTagReverseOrder(tag));
    }
    else if((tag != null) && (zip != null)) {
      int zipcode = Integer.parseInt(zip);      
      model.addAttribute("items", itemService.findByZipcodeAndTagReverseOrder(zipcode, tag));
    //  model.addAttribute("zippid", itemService.findByZipcode(zipcode));
    }
    else {
        model.addAttribute("item",new Item());
        model.addAttribute("items",itemService.findAllReverseOrder());
        
    }
       Long userId = (Long)httpSession.getAttribute("loggedInUser");
       if(userId != null) {
    	   return "ForsidaLoggedIn";
       }
      return "Forsida";
    }
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String prufaViewGet(){
    	
    	return "redirect:/forsida";
    }
    
    @RequestMapping(value = "/ratings", method = RequestMethod.GET)
    public String itemRatings(Model model, Item item) {
    	
    	
        System.out.println("username: "+item.getUserName());
        
    	model.addAttribute("item",new Item());
        model.addAttribute("items",itemService.findAllReverseOrder());
     
        
        
        return "Ratings";
    }
    
    @RequestMapping(value = "/ratings", method = RequestMethod.POST)
    public String formRatings(@ModelAttribute("item") Item item, Model model, HttpServletRequest httpServletRequest, HttpSession httpSession) {
        

        String userName = (String) httpSession.getAttribute("loggedInUsername");
        item.setUserName(userName);
        
        String location = item.getLocation();
        item.setLocation(location);
       
        
        itemService.save(item); 
        model.addAttribute("items", itemService.findAllReverseOrder());
        model.addAttribute("item", new Item());

        return "ForsidaLoggedIn";
    }
    
    
}
