package project.service;

import project.persistence.entities.User;

import java.util.List;

public interface UserService {

    /**
     * Save a {@link User}
     * @param form {@link User} to be saved
     * @return {@link User} that was saved
     */
    User save(User user);

    /**
     * Delete {@link User}
     * @param form {@link User} to be deleted
     */
    void delete(User user);

    /**
     * Get all {@link User}s
     * @return A list of {@link User}s
     */
    List<User> findAll();
    
    /**
     * Get all {@link User}s in a reverse order
     * @return A reversed list of {@link User}s
     */
    List<User> findAllReverseOrder();

    /**
     * Find a {@link User} based on {@link Long id}
     * @param id {@link Long}
     * @return A {@link User} with {@link Long id}
     */
    User findOne(Long id);

    /**
     * Find all {@link User}s with {@link String name}
     * @param name {@link String}
     * @return All {@link User}s with the {@link String name} passed
     */
    
    User findOneByName(User user);
    
    User findByuserName(String userName);
    
    /**
     * Find all users that are in queue for item
     * @param id
     * @return
     */
    List<User> findByItemId(Long id);
    
    User removeByUserName(String userName);

}
