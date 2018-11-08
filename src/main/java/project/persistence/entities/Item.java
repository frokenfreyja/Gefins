package project.persistence.entities;

import javax.persistence.*;
import javax.swing.ImageIcon;

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
    private String pickupTime;
    private String description;
    private ImageIcon mynd;
    private String location;
    private String generalLocation;
    private String phone;
    private String itemName;
    private String email;
    private String users;
    private int zipcode;
    private String tag;
    private String authorized;
    
    
    // Notice the empty constructor, because we need to be able to create an empty PostitNote to add
    // to our model so we can use it with our form
    public Item() {
    }

    public Item(String userName, String pickupTime, String description, ImageIcon mynd, String location,
    		String generalLocation, String phone, String itemName, String email, String users, int zipcode,
    		String tag, String authorized) {
    	
        this.userName = userName;
        this.pickupTime = pickupTime;
        this.description = description;
        this.mynd = mynd;
        this.location = location;
        this.generalLocation = generalLocation;
        this.phone = phone;
        this.itemName = itemName;
        this.email = email;
        this.users = users;
        this.zipcode = zipcode;
        this.tag = tag;
        this.authorized = authorized;
      
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

	public String getPickupTime() {
		return pickupTime;
	}

	public void setPickupTime(String pickupTime) {
		this.pickupTime = pickupTime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public ImageIcon getImage() {
		return mynd;
	}

	public void setImage(ImageIcon mynd) {
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

	public String getUsers() {
		return users;
	}

	public void setUsers(String users) {
		this.users = users;
	}

	public int getZipcode() {
		return zipcode;
	}

	public void setZipcode(int zipcode) {
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
	

	/*// This is for easier debug.
    @Override
    public String toString() {
        return String.format(
                "Postit Note[heiti=%s, lysing=%s, aftimi%s]",
                );
    }*/
}