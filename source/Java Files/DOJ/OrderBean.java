package mybean;
import java.util.List;


public class OrderBean implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private String orderNo;
	private String firstName;
	private String lastName;
	private String emailId;
	private String deliveryDate;
	private List itemsOrdered;
	
	public String getEmailId() {
		return emailId;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public List getItemsOrdered() {
		return itemsOrdered;
	}
	public String getFirstName() {
		return firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public String getDeliveryDate() {
		return deliveryDate;
	}
	
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public void setItemsOrdered(List itemsOrdered) {
		this.itemsOrdered = itemsOrdered;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

}
