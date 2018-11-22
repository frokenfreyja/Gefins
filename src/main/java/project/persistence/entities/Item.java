package project.persistence.entities;

import javax.persistence.*;
import javax.swing.ImageIcon;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.util.ArrayList;
import java.util.List;

/**
 * The class for the Form itself.
 * The system generates a table schema based on this class for this entity.
 * Be sure to annotate any entities you have with the @Entity annotation.
 */
@Entity
@Table(name = "item") // If you want to specify a table name, you can do so here
public class Item {

    // Declare that this attribute is the id
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String userName;
    private Long userId;
    private String acceptedUser;
    private String pickupTime;
    private String description;
    private String location;
    private String generalLocation;
    private String phone;
    private String itemName;
    private String email;
    private Integer zipcode;
    private String tag;
    private String authorized;
    @Transient
    private MultipartFile mynd;
    private String myndName;
   
    @OneToMany
    private List<User> users;

    
    // Notice the empty constructor, because we need to be able to create an empty PostitNote to add
    // to our model so we can use it with our form
    public Item() {
    }

    public Item(Long id, String userName, Long userId, String acceptedUser, String pickupTime, String description, MultipartFile mynd, String myndName, String location,
    		String generalLocation, String phone, String itemName, String email, Integer zipcode,List<User> users,
    		String tag, String authorized, List<String> usersNames) {
    	
    	this.id = id;
    	this.userId = userId;
        this.userName = userName;
        this.pickupTime = pickupTime;
        this.description = description;
        this.mynd = mynd;
        this.location = location;
        this.generalLocation = generalLocation;
        this.phone = phone;
        this.itemName = itemName;
        this.email = email;
        this.zipcode = zipcode;
        this.tag = tag;
        this.authorized = authorized;
        this.myndName = myndName;
        this.acceptedUser = acceptedUser;
        this.users = users;
      
    }

	public Long getId() {
		return id;
	}
    
	public void remove(String userName) {
		remove(userName);
	}
	
	public void setId(Long id) {
		this.id = id;
	}
	
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	
	public String getMyndName() {
		return myndName;
	}
	public void setMyndName(String myndName) {
		this.myndName = myndName;
	}
	
	
	public String getAcceptedUser() {
		return acceptedUser;
	}
	public void setAcceptedUser(String acceptedUser) {
		this.acceptedUser = acceptedUser;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPickupTime() {
		return pickupTime;
	}

	public void setPickupTime(String pickupTime) {
		this.pickupTime = pickupTime;
	}
	
	public List<User> getUsers() {
		return this.users;
	}
	
	public List<String> getUsersNames() {
		List<String> a = new ArrayList<>();
		for(int i=0; i<this.users.size(); i++) {
			a.add(this.users.get(i).getUserName());
		}
		return a;
	
	}
	
	public void addUsers(User user) {
		this.users.add(user);
		
	}

	public void removeUsers(User user) {
		
		this.users.remove(user);
		
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public MultipartFile getMynd() {
		return mynd;
	}

	public void setMynd(MultipartFile mynd) {
		this.mynd = mynd;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getGeneralLocation() {
		return generalLocation;
	}

	public void setGeneralLocation(String generalLocation) {
		this.generalLocation = generalLocation;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getZipcode() {
		return zipcode;
	}

	public void setZipcode(Integer zipcode) {
		this.zipcode = zipcode;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getAuthorized() {
		return authorized;
	}

	public void setAuthorized(String authorized) {
		this.authorized = authorized;
	}
}