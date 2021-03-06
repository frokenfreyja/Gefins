package project.persistence.entities;
import javax.persistence.*;

import java.util.ArrayList;
import java.util.List;
/**
 * The class for the Form itself.
 * The system generates a table schema based on this class for this entity.
 * Be sure to annotate any entities you have with the @Entity annotation.
 */
@Entity
@Table(name = "UserX") // If you want to specify a table name, you can do so here
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
    private Integer zipcode;
    private Integer stars=0;
    private String generalLocation;
    private Long itemId;
	private int notify;    
    private int starsnumber=0;
    private String userReview;
    
        
    //private int starsnumber;
    
    // Notice the empty constructor, because we need to be able to create an empty PostitNote to add
    // to our model so we can use it with our form
    public User() {
    }
    public User(String userName, String password, String phone, String email,
            String location, Integer zipcode, Integer stars /*String generalLocation*/,String userReview) {
        
        this.userName = userName;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.location = location;
        this.zipcode = zipcode;
        this.stars = stars;
        this.generalLocation = getGL(this.zipcode);
        this.notify = 0;
        this.starsnumber = 0;
        this.userReview = userReview;
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
    public Integer getZipcode() {
        return zipcode;
    }
    public void setZipcode(Integer zipcode) {
        this.zipcode = zipcode;
    }
    public Integer getStars() {
        return stars;
    }
    public void setStars(Integer stars) {
        this.stars = stars;
    }
    
    public String getGeneralLocation() {
        return generalLocation;
    }
    public void setGeneralLocation(int zipcode) {
        this.generalLocation = getGL(zipcode);
    }
    
	public int getStarsnumber() {
		return starsnumber;
	}
	public void setStarsnumber(int starsnumber) {
		this.starsnumber = starsnumber;
	}
    
    
    public void rate(int stars) {
    	this.starsnumber++;
    	this.stars+=stars;
    	
    }
    
    public int getratings() {
    	if(this.starsnumber>=1)
    	return (int)(Math.round(this.stars*2.0/this.starsnumber));
    	return -1;
    }
    
	public int getNotify() {
		return notify;
	}
	public void setNotify(int notify) {
		this.notify = notify;
	}
	public void addToNotify() {
		this.notify++;
	}
	public void subtractFromNotify() {
		this.notify--;
	}
	
	public String getUserReview() {
		return userReview;
	}

	public void setUserReview(String userReview) {
		this.userReview = userReview;
	}

}



