package project.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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

   
    /** 
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

    /**
     * Aðferð sem tekur inn item  
     * Vistar upplýsingarnar úr forminu í Database
     * Birtir forsíðuna aftur 
     * Hér hefur item verið bætt efst í listann
     */
    @RequestMapping(value = "/nyauglysing", method = RequestMethod.POST)
    public String newItem(@ModelAttribute("item") Item item, Model model, HttpServletRequest httpServletRequest, HttpSession httpSession) throws IOException{
    	String userName = (String) httpSession.getAttribute("loggedInUsername");
        
        if (userName == null) {
        	return "redirect:/innskra";
        }
    	
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
     */
    @RequestMapping(value = "/forsida", method = RequestMethod.GET)
    public String viewItemList(Model model, HttpSession httpSession){
    	Long userId = (Long)httpSession.getAttribute("loggedInUser");
    	
    	if (userId != null) {
        	return "redirect:/forsidaloggedin";
        }
        

        //núl stillir zip og tag breiturnar sem eru notaðar í að leita að itemum
    	httpSession.removeAttribute("zip");
    	httpSession.removeAttribute("tag");
    	
        model.addAttribute("items",itemService.findAllReverseOrder());
        
        return "Forsida";
    }
    

    /**
     * Birtir listann af item á forsíðunni í öfugri röð, nýjasta efst
     * þarf að vera loggedin
     */
    @RequestMapping(value = "/forsidaloggedin", method = RequestMethod.GET)
    public String viewItemListLoggedIn(Model model, HttpSession httpSession){
    	String userName = (String) httpSession.getAttribute("loggedInUsername");
        
        if (userName == null) {
        	return "redirect:/innskra";
        }
    	
    	httpSession.removeAttribute("zip");
    	httpSession.removeAttribute("tag");
        
        model.addAttribute("items",itemService.findAllReverseOrder());

        return "ForsidaLoggedIn";
    }
  
    
    /**
     * Mitt svæði
     * Sýnir Item sem User bjó til,
     * Item sem User er í röð fyrir
     * og star raiting
     */
    @RequestMapping(value = "/mittsvaedi", method = RequestMethod.GET)
    public String userViewGet(Model model, HttpSession httpSession){
    	String userName = (String) httpSession.getAttribute("loggedInUsername");
        
        if (userName == null) {
        	return "redirect:/innskra";
        }
                
        User ownerUser = userService.findByuserName(userName);
        
    	// nær í Item sem User bjó til
        model.addAttribute("myItems", itemService.findByuserName(userName));
        
        // nær í Item sem User er í röð fyrir
        model.addAttribute("itemsIWant", itemService.findByusers(userName));
        
        // nær í rating
        model.addAttribute("ownerRating", userService.getImg(ownerUser.getratings()));
    
        return "Mittsvaedi";
    }
    
    /**
     * Eyða auglýsingu - GET
     */
    @RequestMapping(value = "/mittsvaedi/{id}", method = RequestMethod.GET)
    public String getRemoveAd(Model model, HttpSession httpSession){
    	String userName = (String) httpSession.getAttribute("loggedInUsername");
        
        if (userName == null) {
        	return "redirect:/innskra";
        }
               
        User ownerUser = userService.findByuserName(userName);
        
    	// nær í Item sem User bjó til
        model.addAttribute("myItems", itemService.findByuserName(userName));
        
        // nær í Item sem User er í röð fyrir
        model.addAttribute("itemsIWant", itemService.findByusers(userName));
        
        // nær í rating
        model.addAttribute("ownerRating", userService.getImg(ownerUser.getratings()));
        
    	return "Mittsvaedi";
    }
    
    /**
     * Eyða auglýsingu - POST
     */
    @RequestMapping(value = "/mittsvaedi/{id}", method = RequestMethod.POST)
    public String removeAd(@ModelAttribute("item") Item item, Model model, HttpSession httpSession) {

    	String userName = (String) httpSession.getAttribute("loggedInUsername");
        
        if (userName == null) {
        	return "redirect:/innskra";
        }
               
        Long itemId = item.getId();
        
        Item theitem = itemService.findOne(itemId);
        
        itemService.delete(theitem);
        
    	return "redirect:/mittsvaedi/{id}";
    }
    
    /**
     * Skoða item nánar
     */
    @RequestMapping(value = "/skodaitem/{id}", method = RequestMethod.GET)
    public String viewItem(Model model, Item item) {
    	
        Item skodaNanarItem = itemService.findOne(item.getId());
        
        User ownerUser = userService.findByuserName(skodaNanarItem.getUserName());
       
        model.addAttribute("skodaitem", itemService.findOne(skodaNanarItem.getId()));
        model.addAttribute("ownerRating", userService.getImg(ownerUser.getratings()));
    	
        // Return the view
        return "SkodaItem";
    }
    
    /** 
     * Skoða item þar sem notandi er loggedin,
     * ekki accepded 
     * og er ekki í röð
     */
    @RequestMapping(value = "/skodaitemloggedin/{id}", method = RequestMethod.GET)
    public String viewItemLoggedIn(Model model, Item item, HttpSession httpSession) {
    	String userName = (String) httpSession.getAttribute("loggedInUsername");
        
        if (userName == null) {
        	return "redirect:/innskra";
        }
    	
        Item skodaNanarItem = itemService.findOne(item.getId());
        
        if(skodaNanarItem.getUsers().contains(userName)) {
            model.addAttribute("skodaitem", itemService.findOne(skodaNanarItem.getId()));
            
        	return "SkodaItemIRod";
        }
        
        User ownerUser = userService.findByuserName(skodaNanarItem.getUserName());
        
        model.addAttribute("skodaitem", itemService.findOne(skodaNanarItem.getId()));
        model.addAttribute("ownerRating", userService.getImg(ownerUser.getratings()));
    	
        // Return the view
        return "SkodaItemLoggedIn";
    }
    
    /** 
     * Skoða item þar sem notandi er loggedin,
     * ekki accepded 
     * og er í röð
     */
    @RequestMapping(value = "/skodaitemirod/{id}", method = RequestMethod.GET)
    public String veiwItemInRow(Model model, Item item, HttpSession httpSession) {
    	String userName = (String) httpSession.getAttribute("loggedInUsername");
        
        if (userName == null) {
        	return "redirect:/innskra";
        }
       
        Item skodaNanarItem = itemService.findOne(item.getId());
        
        User ownerUser = userService.findByuserName(skodaNanarItem.getUserName());
       
        model.addAttribute("skodaitem", itemService.findOne(skodaNanarItem.getId()));
        model.addAttribute("ownerRating", userService.getImg(ownerUser.getratings()));
    	
        // Return the view
        return "SkodaItemIRod";
    }
    
    /**
     * Skoða eitt Item sem eigandi Items
     */
    @RequestMapping(value = "/skodaitemeigandi/{id}", method = RequestMethod.GET)
    public String seeItemAsOwner(Model model, Item item, HttpSession httpSession) {
    	String userName = (String) httpSession.getAttribute("loggedInUsername");
        
        if (userName == null) {
        	return "redirect:/innskra";
        }
        
        Long userId = (Long)httpSession.getAttribute("loggedInUser");
        
        Item skodaNanarItem = itemService.findOne(item.getId());
        
        List<String> myndir = userService.getImages(skodaNanarItem);
        
        User ownerUser = userService.findByuserName(skodaNanarItem.getUserName());

        model.addAttribute("skodaitem", itemService.findOne(skodaNanarItem.getId()));
        model.addAttribute("user", myndir);
        model.addAttribute("ownerRating", userService.getImg(ownerUser.getratings()));
    	
        // Return the view
       return "SkodaItemEigandi";
    }
    
    /**
     * Skoða eitt accepted Item sem þú hefur verið merktur sem þiggjandi fyrir
     */
    @RequestMapping(value = "/skodaitemaccepted/{id}", method = RequestMethod.GET)
    public String seeItemAccepted(Model model, Item item, HttpSession httpSession) {
    	String userName = (String) httpSession.getAttribute("loggedInUsername");
        
        if (userName == null) {
        	return "redirect:/innskra";
        }
    	
        Item skodaNanarItem = itemService.findOne(item.getId());
        User user = userService.findByuserName(skodaNanarItem.getUserName());
        
        model.addAttribute("userEmail", user.getEmail());
        model.addAttribute("skodaitem", itemService.findOne(skodaNanarItem.getId()));
        model.addAttribute("ownerRating", userService.getImg(user.getratings()));
    	
        // Return the view
       return "SkodaItemAccepted";
    }
    
    
    /**
     * Fara í röð fyrir hlut
     */
    @RequestMapping(value = "/skodaitemloggedin/{id}", method = RequestMethod.POST)
    public String enterQueue(@ModelAttribute("item") Item item, Model model, HttpSession httpSession) {
    	String userName = (String) httpSession.getAttribute("loggedInUsername");
        
        if (userName == null) {
        	return "redirect:/innskra";
        }
       
       
       Long itemId = item.getId();
       
       Item theitem = itemService.findOne(itemId);
       
       //bætir username við users breytuna í Item
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
    	String userName = (String) httpSession.getAttribute("loggedInUsername");
        
        if (userName == null) {
        	return "redirect:/innskra";
        }
         
        Item theitem = itemService.findOne(item.getId());

        if(userName.equals(theitem.getAcceptedUser()))        	
        theitem.setAcceptedUser("");
        
        //deletar username frá users
        theitem.removeUsers(userName);

        //savear itemið með breitingum
        itemService.save(theitem);
        
       return "redirect:/skodaitemloggedin/{id}";
    }
    
    /**
     * Skoða Item þar sem búið er að accepta þig sem þiggjanda.
     */
    @RequestMapping(value = "/skodaitemeigandi/{id}", method = RequestMethod.POST)
    public String viewAsOwner(@ModelAttribute("item") Item item, Model model, HttpSession httpSession) {
    	String userName = (String) httpSession.getAttribute("loggedInUsername");
        
        if (userName == null) {
        	return "redirect:/innskra";
        }
        
        Item theitem = itemService.findOne(item.getId());
        theitem.setAcceptedUser(theitem.getUsers().get(0));

        User user = userService.findByuserName(theitem.getUsers().get(0));
        
        itemService.save(theitem);
        userService.save(user);

        return "redirect:/skodaitemeigandi/{id}";
    }
    
    /**
     * Eyðir user sem er fyrstur í röðinni
     */
    @RequestMapping(value = "/skodaitemeigandiremove/{id}", method = RequestMethod.POST)
    public String removeUserAsOwner(@ModelAttribute("item") Item item, Model model, HttpSession httpSession) {
    	String userName = (String) httpSession.getAttribute("loggedInUsername");
        
        if (userName == null) {
        	return "redirect:/innskra";
        }
        Item theitem = itemService.findOne(item.getId());
       
        //deletar username frá users        
        List<String> usersInQueue = theitem.getUsers();
        theitem.removeUsers(usersInQueue.get(0));

        //savear itemið með breytingum
        itemService.save(theitem);
        

        return "redirect:/skodaitemeigandi/{id}";
    }
  
    
    /**
     * Leitar af auglýsingum sem innihalda leitarorð í heiti(itemName) og lýsingu(description) í lista af items
     */
    @RequestMapping(value = "searchlistx", method = RequestMethod.GET)
    public String searchItems(@RequestParam (value = "searching", required = false) String searchwords, Model model) {
                 
        model.addAttribute("items", itemService.findByItemNameContainsIgnoreCaseOrDescriptionContainsIgnoreCase(searchwords, searchwords));
        
        return "Forsida";
    }
    
    /**
     * Hreinsar leitina og skilar aftur fullum lista af items
     */
    @RequestMapping(value = "clearsearch", method = RequestMethod.GET)
    public String clearSearch(Model model, Item item) { 
        
        model.addAttribute("item",new Item());
        model.addAttribute("items",itemService.findAllReverseOrder());
        
        return "Forsida";
    }
    
    /**
     * Sækir valið póstnúmer á forsíðunni og sendir í sorter
     */
    @RequestMapping(value = "sortzip" , method = RequestMethod. GET)
    public String selectZip(@RequestParam("zip") String Value, Integer zipcode, HttpSession httpSession, Model model, Item item) 
    {

   
        httpSession.setAttribute("zip", Value);
        if (Value.equals("100")) {
            httpSession.removeAttribute("zip");
        }
      
        return "redirect:sorter";
    }
    
    /**
     * Sækir valinn flokk á forsíðunni og sendir í sorter 
     */
    @RequestMapping(value = "sortcategory" , method = RequestMethod. GET)
    public String selectTag(@RequestParam("category") String Value, HttpSession httpSession, Model model, Item item) 
    {
    
    httpSession.setAttribute("tag", Value);
    if (Value.equals("Allir")) {
        httpSession.removeAttribute("tag");
    }
      
      return "redirect:sorter";
    }
    
    /**
     * Birtir listann af Item eftir póstnúmeri og/eða flokki
     */
    @RequestMapping(value = "sorter" , method = RequestMethod. GET)
    public String sortZipTag(HttpSession httpSession, Model model, Item item) 
    {
        
    String tag =(String)httpSession.getAttribute("tag");
    String zip =(String)httpSession.getAttribute("zip");
    
    if( (zip != null) && ( tag == null)){
          int zipcode = Integer.parseInt(zip);      
          Integer zipc = item.getZipcode();
          model.addAttribute("items", itemService.findByZipcodeReverseOrder(zipcode));
        }
    else if((tag != null) && (zip == null)) {
      model.addAttribute("items", itemService.findByTagReverseOrder(tag));
    }
    else if((tag != null) && (zip != null)) {
      int zipcode = Integer.parseInt(zip);      
      model.addAttribute("items", itemService.findByZipcodeAndTagReverseOrder(zipcode, tag));
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
    public String redirectForsida() {
    	
    	return "redirect:/forsida";
    }
    
    
    @RequestMapping(value = "/ratings/{id}", method = RequestMethod.GET)
    public String itemRatings(Model model, Item item, HttpSession httpSession) {
    	String userName = (String) httpSession.getAttribute("loggedInUsername");
        
        if (userName == null) {
        	return "redirect:/innskra";
        }
        
        Item skodaNanarItem = itemService.findOne(item.getId());
        model.addAttribute("skodaitem", itemService.findOne(skodaNanarItem.getId()));
        
        return "Ratings";
    }
    
    @RequestMapping(value = "/ratings/{id}", method = RequestMethod.POST)
    public String formRatings(@ModelAttribute("item") Item item, @ModelAttribute("user") User user, Model model, HttpSession httpSession) {
    	String userName = (String) httpSession.getAttribute("loggedInUsername");
        
        if (userName == null) {
        	return "redirect:/innskra";
        }
        
        Item theitem = itemService.findOne(item.getId());
        
        model.addAttribute("skodaitem", itemService.findOne(theitem.getId()));
        
        return "Ratings";
    }
    
    /** 
     * Leyfir user að gefa rating
     */
    @RequestMapping(value = "/giveRatings/{id}", method = RequestMethod.POST)
    public String giveRatings(@ModelAttribute("item") Item item, @ModelAttribute("user") User user, Model model, HttpSession httpSession) {
    	String userName = (String) httpSession.getAttribute("loggedInUsername");
        
        if (userName == null) {
        	return "redirect:/innskra";
        }
        
        Item skodaNanarItem = itemService.findOne(item.getId());
        
        int stjornur = user.getStars();
        
        // ef true þá er loggedInUser eigandi Itemsins
        if(skodaNanarItem.getUserName().equals(userName)) {
        	User user3 = userService.findByuserName(skodaNanarItem.getAcceptedUser());
        	user3.rate(stjornur);
        	
        	//ef þiggjandi er búinn að gefa rating þá er Itemið deletað
        	if(skodaNanarItem.getAuthorized().equals(""))
        	skodaNanarItem.setAuthorized(user3.getUserName());
        	else itemService.delete(skodaNanarItem);
        	
        	userService.save(user3);
        }
        // hér er loggedInUser þiggjandi Itemsins
        else {
        	User user3 = userService.findByuserName(skodaNanarItem.getUserName());
        	user3.rate(stjornur);
        	
        	//ef gefandi er búinn að gefa rating þá er Itemið deletað        	
        	if(skodaNanarItem.getAuthorized().equals(""))
            	skodaNanarItem.setAuthorized(user3.getUserName());
            	else itemService.delete(skodaNanarItem);
        	
        		userService.save(user3);
        }

        model.addAttribute("items", itemService.findAllReverseOrder());
        
        return "redirect:/mittsvaedi";
    }

    
    @RequestMapping(value = "/umgefins", method = RequestMethod.GET)
    public String umGefins() {
    	    	     
        
        
        return "UmGefins";
    }
    
    @RequestMapping(value = "/notkunarleidbeiningar", method = RequestMethod.GET)
    public String hofundar() {
    	
    	   
        
        return "Notkunarleidbeiningar";
    }
    
    @RequestMapping(value = "/notkunarskilmalar", method = RequestMethod.GET)
    public String notkunarskilmalar() {
    	
    	   
        
        return "Notkunarskilmalar";
    }
    
    @RequestMapping(value = "/hafasamband", method = RequestMethod.GET)
    public String hafasamband() {
    	
 	   
        
        return "HafaSamband";
    }
    
    
}
