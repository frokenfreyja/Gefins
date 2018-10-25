package project.service;

import project.persistence.entities.Nyskraning;

import java.util.List;

public interface NyskraService {

    /**
     * Save a {@link Form}
     * @param form {@link Form} to be saved
     * @return {@link Form} that was saved
     */
    Nyskraning save(Nyskraning nyskraning);

    /**
     * Delete {@link Form}
     * @param form {@link Form} to be deleted
     */
    void delete(Nyskraning nyskraning);

    /**
     * Get all {@link Form}s
     * @return A list of {@link Form}s
     */
    List<Nyskraning> findAll();

    /**
     * Get all {@link PostitNote}s in a reverse order
     * @return A reversed list of {@link PostitNote}s
     */
    List<Nyskraning> findAllReverseOrder();

    /**
     * Find a {@link PostitNote} based on {@link Long id}
     * @param id {@link Long}
     * @return A {@link PostitNote} with {@link Long id}
     */
    Nyskraning findOne(Long id);

    /**
     * Find all {@link PostitNote}s with {@link String name}
     * @param name {@link String}
     * @return All {@link PostitNote}s with the {@link String name} passed
     */
    

}
