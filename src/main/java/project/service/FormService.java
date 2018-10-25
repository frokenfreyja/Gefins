package project.service;

import project.persistence.entities.Form;

import java.util.List;

public interface FormService {

    /**
     * Save a {@link Form}
     * @param form {@link Form} to be saved
     * @return {@link Form} that was saved
     */
    Form save(Form form);

    /**
     * Delete {@link Form}
     * @param form {@link Form} to be deleted
     */
    void delete(Form form);

    /**
     * Get all {@link Form}s
     * @return A list of {@link Form}s
     */
    List<Form> findAll();

    /**
     * Get all {@link PostitNote}s in a reverse order
     * @return A reversed list of {@link PostitNote}s
     */
    List<Form> findAllReverseOrder();

    /**
     * Find a {@link PostitNote} based on {@link Long id}
     * @param id {@link Long}
     * @return A {@link PostitNote} with {@link Long id}
     */
    Form findOne(Long id);

    /**
     * Find all {@link PostitNote}s with {@link String name}
     * @param name {@link String}
     * @return All {@link PostitNote}s with the {@link String name} passed
     */
    List<Form> findByHeiti(String heiti);
    
    List<Form> findAllWithNameLongerThan3Chars();
    

}
