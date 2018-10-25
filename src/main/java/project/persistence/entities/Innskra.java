package project.persistence.entities;

import javax.persistence.*;
import java.util.List;

/**
 * The class for the Form itself.
 * The system generates a table schema based on this class for this entity.
 * Be sure to annotate any entities you have with the @Entity annotation.
 */
@Entity
@Table(name = "innskra") // If you want to specify a table name, you can do so here
public class Innskra {

    // Declare that this attribute is the id
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String notenda;
    private String passlogin;
   /* private List<String> flokkar;*/
   /* private boolean notaupplys;*/

    // Notice the empty constructor, because we need to be able to create an empty PostitNote to add
    // to our model so we can use it with our form
    public Innskra() {
    }

    public Innskra(String notenda, String passlogin) {
    	
        this.notenda = notenda;
        this.passlogin = passlogin;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    public String getNotenda() {
        return notenda;
    }

    public void setNotenda(String notenda) {
        this.notenda = notenda;
    }
    
    public String getPasslogin() {
    	return passlogin;
    }
    
    public void setPasslogin(String passlogin) {
    	this.passlogin = passlogin;
    }
   /*
    public List<String> getFlokkar() {
        return flokkar;
    }
    
    public void setFlokkar(List<String> flokkar) {
        this.flokkar = flokkar;
    }*/
    /*
    public boolean getNotaupplys() {
        return notaupplys;
     }
     public void setNotaupplys(boolean notaupplys) {
        this.notaupplys = notaupplys;
     }*/

    // This is for easier debug.
  /*  @Override
    public String toString() {
        return String.format(
                "Postit Note[heiti=%s, lysing=%s, aftimi%s]",
                heiti,lysing,aftimi);
    }*/
}
