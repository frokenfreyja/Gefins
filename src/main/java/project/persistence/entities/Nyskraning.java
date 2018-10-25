package project.persistence.entities;

import javax.persistence.*;
import java.util.List;

/**
 * The class for the Form itself.
 * The system generates a table schema based on this class for this entity.
 * Be sure to annotate any entities you have with the @Entity annotation.
 */
@Entity
@Table(name = "nyskra") // If you want to specify a table name, you can do so here
public class Nyskraning {

    // Declare that this attribute is the id
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nafn;
    private String lykilord;
    private String netfang;
    private String simi;
    private String heimili;
    private String zip;
    private String nyrsimi;
    private String newheimili;
    private String nyttzip;
    
   /* private List<String> flokkar;*/
   /* private boolean notaupplys;*/

    // Notice the empty constructor, because we need to be able to create an empty PostitNote to add
    // to our model so we can use it with our form
    public Nyskraning() {
    }

    public Nyskraning(String nafn, 
    		String lykilord, String netfang, String simi, String heimili, 
    		String zip, String nyrsimi, String newheimili, String nyttzip) {
    	
        this.nafn = nafn;
        this.lykilord = lykilord;
        this.netfang = netfang;
        this.simi = simi;
        this.heimili = heimili;
        this.zip = zip;
        this.nyrsimi = nyrsimi;
        this.newheimili = newheimili;
        this.nyttzip = nyttzip;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    public String getNafn() {
        return nafn;
    }

    public void setNafn(String nafn) {
        this.nafn = nafn;
    }
    
    public String getLykilord() {
        return lykilord;
    }

    public void setLykilord(String lykilord) {
        this.lykilord = lykilord;
    }
    
    public String getNetfang() {
        return netfang;
    }

    public void setNetfang(String netfang) {
        this.netfang = netfang;
    }
    
    public String getSimi() {
        return simi;
    }

    public void setSimi(String simi) {
        this.simi = simi;
    }
    
    public String getHeimili() {
        return heimili;
    }

    public void setHeimili(String heimili) {
        this.heimili = heimili;
    }
    
    public String getzip() {
    	return zip;
    }
    
    public void setZip(String zip) {
    	this.zip = zip;
    }
    public String getNyrSimi() {
        return nyrsimi;
    }

    public void setNyrSimi(String nyrsimi) {
        this.nyrsimi = nyrsimi;
    }
    
    public String getnewHeimili() {
        return newheimili;
    }

    public void setnewHeimili(String newheimili) {
        this.newheimili = newheimili;
    }
    
    public String getNyttzip() {
    	return nyttzip;
    }
    
    public void setNyttZip(String nyttzip) {
    	this.nyttzip = nyttzip;
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
   /* @Override
    public String toString() {
        return String.format(
                "Postit Note[heiti=%s, lysing=%s, aftimi%s]",
                heiti,lysing,aftimi);
    }*/
}
