package project.service.Implementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.persistence.entities.Item;
import project.persistence.entities.User;
import project.persistence.repositories.ItemRepository;
import project.service.ItemService;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
public class ItemServiceImplementation implements ItemService {

    // Instance Variables
    ItemRepository repository;

    // Dependency Injection
    @Autowired
    public ItemServiceImplementation(ItemRepository repository) {
        this.repository = repository;
    }

    @Override
    public Item save(Item item) {
        return repository.save(item);
    }

    @Override
    public void delete(Item item) {
        repository.delete(item);
    }
    

    @Override
    public List<Item> findAll() {
        return repository.findAll();
    }

    @Override
    public List<Item> findAllReverseOrder() {
        // Get all the Postit notes
        List<Item> items = repository.findAll();

        // Reverse the list
        Collections.reverse(items);

        return items;
    }

    @Override
    public Item findOne(Long id) {
        return repository.findOne(id);
    }
    
    public void changeName(String userName, String newName) {
        List<Item> items = findByuserName(userName);
        for(int i=0; i<items.size(); i++){
            items.get(i).setUserName(newName);
            
        }
        items = findByusers(userName);
        for(int i=0; i<items.size(); i++){
            items.get(i).getUsers().set(items.get(i).getUsers().indexOf(userName), newName);
            
            if(items.get(i).getAcceptedUser().equals(userName))
                items.get(i).setAcceptedUser(newName);
        }
            
    }
    
    public void deleteUserLinks(String userName) {
        
        List<Item> items = findByuserName(userName);
        for(int i=0; i<items.size(); i++){
            delete(items.get(i));
        }
        
        items = findByusers(userName);
        for(int i=0; i<items.size(); i++){
            items.get(i).getUsers().remove(userName);
            
            if(items.get(i).getAcceptedUser().equals(userName))
                items.get(i).setAcceptedUser("");
        }
    }
  
    @Override
    public List<Item> findByItemName(String itemName) {
        return repository.findByItemName(itemName);
    }
    
    @Override
    public Item findOneByItemName(String itemName) {
        return repository.findOneByItemName(itemName);
    }
    
    @Override
  	public List<Item> findByuserName(String userName) {
      	return repository.findByuserName(userName);
    }
    
    @Override
    public List<Item> findByusers(String user) {
      	return repository.findByusers(user);
    }
    
    @Override
    public List<Item> findByTag(String tag) {
    	return repository.findByTag(tag);
    }
    
    @Override 
    public List<Item> findByZipcode(Integer zipcode) {
    	return repository.findByZipcode(zipcode);
    }
    
    @Override 
    public Item findOneByZipcode(Integer zipcode) {
    	return repository.findOneByZipcode(zipcode);
    }
    
    @Override
    public List<Item> findByItemNameContainsIgnoreCaseOrDescriptionContainsIgnoreCase(String itemname, String description) {
        return repository.findByItemNameContainsIgnoreCaseOrDescriptionContainsIgnoreCase(itemname, description);
    }
    
    @Override    
   	public List<Item> findByZipcodeAndTag(Integer zipcode, String tag) {
           return repository.findByZipcodeAndTag(zipcode, tag);
     	    }
    
    
    @Override
    public List<Item> findByZipcodeAndTagReverseOrder(Integer zipcode, String tag) {
        List<Item> items = repository.findByZipcodeAndTag(zipcode, tag);
        // Reverse the list
        Collections.reverse(items);
        return items;
    }
    
    @Override
    public List<Item> findByZipcodeReverseOrder(Integer zipcode) {
        List<Item> items = repository.findByZipcode(zipcode);
        // Reverse the list
        Collections.reverse(items);
        return items;
    }
    
    @Override
    public List<Item> findByTagReverseOrder(String tag) {
        List<Item> items = repository.findByTag(tag);
        // Reverse the list
        Collections.reverse(items);
        return items;
    }
    
}
