package project.persistence.entities;
import javax.persistence.*;
import java.util.List;
/**
 * The class for the Form itself.
 * The system generates a table schema based on this class for this entity.
 * Be sure to annotate any entities you have with the @Entity annotation.
 */
@Entity
@Table(name = "User") // If you want to specify a table name, you can do so here
public class User {
    // Declare that this attribute is the id
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String userName;
    private String password;
    private String phone;
    private String email;
    private String location;
    private int zipcode;
    private int stars;
    private String generalLocation;
    
    // Notice the empty constructor, because we need to be able to create an empty PostitNote to add
    // to our model so we can use it with our form
    public User() {
    }
    public User(String userName, String password, String phone, String email,
            String location, int zipcode, int stars, String generalLocation) {
        
        this.userName = userName;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.location = location;
        this.zipcode = zipcode;
        this.stars = stars;
        this.generalLocation = getGL(this.zipcode);
    }
    
    public String getGL(int zipcode) {
        String a="blablablabla";
        return a;
    }
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getLocation() {
        return location;
    }
    public void setLocation(String location) {
        this.location = location;
    }
    public int getZipcode() {
        return zipcode;
    }
    public void setZipcode(int zipcode) {
        this.zipcode = zipcode;
    }
    public int getStars() {
        return stars;
    }
    public void setStars(int stars) {
        this.stars = stars;
    }
    public String getGeneralLocation() {
        return generalLocation;
    }
    public void setGeneralLocation(int zipcode) {
        this.generalLocation = getGL(zipcode);
    }
    // This is for easier debug.
   /* @Override
    public String toString() {
        return String.format(
                "Postit Note[heiti=%s, lysing=%s, aftimi%s]",
                heiti,lysing,aftimi);
    }*/
}



