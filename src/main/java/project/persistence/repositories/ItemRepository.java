package project.persistence.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import project.persistence.entities.Item;

import java.util.List;

/**
 * By extending the {@link JpaRepository} we have access to powerful methods.
 * For detailed information, see:
 * http://docs.spring.io/spring-data/commons/docs/current/api/org/springframework/data/repository/CrudRepository.html
 * http://docs.spring.io/spring-data/data-commons/docs/1.6.1.RELEASE/reference/html/repositories.html
 *
 */
public interface ItemRepository extends JpaRepository<Item, Long> {

    Item save(Item item);

    void delete(Item item);

    List<Item> findAll();

    List<Item> findAllByOrderByIdDesc();

    @Query(value = "SELECT p FROM Item p WHERE p.id = ?1")
    Item findOne(Long id);
    
    
}
