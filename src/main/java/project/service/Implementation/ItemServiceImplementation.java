package project.service.Implementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.persistence.entities.Item;
import project.persistence.repositories.ItemRepository;
import project.service.ItemService;

import java.util.Collections;
import java.util.List;

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
  
    @Override
    public List<Item> findByItemName(String itemName) {
        return repository.findByItemName(itemName);
    }
    
    @Override
    public Item findOneByItemName(String itemName) {
        return repository.findOneByItemName(itemName);
    }
    
}
