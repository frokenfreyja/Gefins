package project.service;

import project.persistence.entities.Item;

import java.util.List;
import java.util.Optional;

public interface ItemService {

    /**
     * Save a {@link Item}
     * @param form {@link Item} to be saved
     * @return {@link Item} that was saved
     */
    Item save(Item item);

    /**
     * Delete {@link Item}
     * @param form {@link Item} to be deleted
     */
    void delete(Item item);

    /**
     * Get all {@link Item}s
     * @return A list of {@link Item}s
     */
    List<Item> findAll();

    /**
     * Get all {@link Item}s in a reverse order
     * @return A reversed list of {@link Item}s
     */
    List<Item> findAllReverseOrder();

    /**
     * Find a {@link Item} based on {@link Long id}
     * @param id {@link Long}
     * @return A {@link PostitNote} with {@link Long id}
     */
    Item findOne(Long id);


    List<Item> findByItemName(String itemName);
    
    Item findOneByItemName(String itemName);
    

    //ItemService
  	List<Item> findByuserName(String userName);
     
    List<Item> findByusers(String name);
    
  	List<Item> findByTag(String tag);
  	
  	List<Item> findByZipcode(Integer zipcode);
  	
    List<Item> findByItemNameContainsOrDescriptionContains(String itemname, String description);
 
    List<Item> findByZipcodeAndTag(Integer zipcode, String tag);

    Item findOneByZipcode(Integer zipcode);
}
