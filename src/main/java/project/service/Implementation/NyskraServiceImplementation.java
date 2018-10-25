package project.service.Implementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.persistence.entities.Nyskraning;
import project.persistence.repositories.NyskraRepository;
import project.service.NyskraService;

import java.util.Collections;
import java.util.List;

@Service
public class NyskraServiceImplementation implements NyskraService {

    // Instance Variables
    NyskraRepository repository;

    // Dependency Injection
    @Autowired
    public NyskraServiceImplementation(NyskraRepository repository) {
        this.repository = repository;
    }

    @Override
    public Nyskraning save(Nyskraning nyskraning) {
        return repository.save(nyskraning);
    }

    @Override
    public void delete(Nyskraning nyskraning) {
        repository.delete(nyskraning);
    }

    @Override
    public List<Nyskraning> findAll() {
        return repository.findAll();
    }

    @Override
    public List<Nyskraning> findAllReverseOrder() {
        // Get all the Postit notes
        List<Nyskraning> nyskraningar = repository.findAll();

        // Reverse the list
        Collections.reverse(nyskraningar);

        return nyskraningar;
    }

    @Override
    public Nyskraning findOne(Long id) {
        return repository.findOne(id);
    }

    
}

