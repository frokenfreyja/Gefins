package project.service.Implementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.persistence.entities.User;
import project.persistence.repositories.UserRepository;
import project.service.UserService;

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
}

