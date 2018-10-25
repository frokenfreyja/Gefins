package project.service.Implementation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.persistence.entities.Form;
import project.persistence.repositories.FormRepository;
import project.service.FormService;

import java.util.Collections;
import java.util.List;

@Service
public class FormServiceImplementation implements FormService {

    // Instance Variables
    FormRepository repository;

    // Dependency Injection
    @Autowired
    public FormServiceImplementation(FormRepository repository) {
        this.repository = repository;
    }

    @Override
    public Form save(Form form) {
        return repository.save(form);
    }

    @Override
    public void delete(Form form) {
        repository.delete(form);
    }

    @Override
    public List<Form> findAll() {
        return repository.findAll();
    }

    @Override
    public List<Form> findAllReverseOrder() {
        // Get all the Postit notes
        List<Form> forms = repository.findAll();

        // Reverse the list
        Collections.reverse(forms);

        return forms;
    }

    @Override
    public Form findOne(Long id) {
        return repository.findOne(id);
    }

    @Override
    public List<Form> findByHeiti(String heiti) {
        return repository.findByHeiti(heiti);
    }
    
    @Override
    public List<Form> findAllWithNameLongerThan3Chars() {
        return repository.findAllWithNameLongerThan3Chars();
    }
    
}
