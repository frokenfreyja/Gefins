package project.service.Implementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.persistence.entities.Item;
import project.persistence.entities.User;
import project.persistence.repositories.UserRepository;
import project.service.UserService;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class UserServiceImplementation implements UserService {

    // Instance Variables
    UserRepository repository;

    // Dependency Injection
    @Autowired
    public UserServiceImplementation(UserRepository repository) {
        this.repository = repository;
    }

    @Override
    public User save(User user) {
        return repository.save(user);
    }

    @Override
    public void delete(User user) {
        repository.delete(user);
    }

    @Override
    public List<User> findAll() {
        return repository.findAll();
    }

    @Override
    public List<User> findAllReverseOrder() {
        // Get all the Postit notes
        List<User> users = repository.findAll();

        // Reverse the list
        Collections.reverse(users);

        return users;
    }

    @Override
    public User findOne(Long id) {
    	System.out.println("id: "+id);
    	User user = repository.findOne(id);
    	System.out.println("user: "+user);
        return user;
    }

    @Override
    public User findOneByName(User user) {
    	 return repository.findByuserName(user.getUserName()); 	
    	
    }
    
    @Override
    public User findByuserName(String userName) {
    	 return repository.findByuserName(userName); 	
    	
    }
    
    @Override
    public List<User> findByItemId(Long id) {
    	return repository.findByItemId(id);
    }


    @Override
    public User removeByUserName(String userName) {
    	return repository.removeByUserName(userName);
    }
    
    @Override
    public String getImg(int stars) {
    	    	
    	switch (stars) {
    		case -1: return "";
    		case 0: return "/images/halfStar.png";
    		case 1: return "/images/halfStar.png";
    		case 2: return "/images/oneStar.png";
    		case 3: return "/images/1halfStar.png";
    		case 4: return "/images/twoStar.png";
    		case 5: return "/images/2halfStar.png";
    		case 6: return "/images/threeStar.png";
    		case 7: return "/images/3halfStar.png";
    		case 8: return "/images/fourStar.png";
    		case 9: return "/images/4halfStar.png";
    		case 10: return "/images/fiveStar.png";
    	}
    	return "whops";
    }
    
    @Override
    public List<String> getImages(Item item) {
    	List<String> a = item.getUsers();
    	List<User> users = new ArrayList<User>();    	
    	List<String> images = new ArrayList<String>();
    	for(int i=0; i<a.size(); i++) {
    		users.add(findByuserName(a.get(i)));
    		images.add(getImg(users.get(i).getratings()));
    	}
    	return images;
    }
}

