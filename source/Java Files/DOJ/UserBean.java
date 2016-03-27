package mybean;

/** Describes a catalog item for on-line store. The itemID
 *  uniquely identifies the item, the short description
 *  gives brief info like the book title and author,
 *  the long description describes the item in a couple
 *  of sentences, and the cost gives the current per-item price.
 *  Both the short and long descriptions can contain HTML
 *  markup.
 *  <P>
 *  Taken from Core Servlets and JavaServer Pages 2nd Edition
 *  from Prentice Hall and Sun Microsystems Press,
 *  http://www.coreservlets.com/.
 *  &copy; 2003 Marty Hall; may be freely used or adapted.
 */

public class UserBean implements java.io.Serializable{
  /*public UserBean(String firstName, String lastName,String userName,String password,String shippingAddress){
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.userName = userName;
		this.password = password;
		this.shippingAddress = shippingAddress;
	}
*/
	private String firstName;
	private String lastName;
	private String userName;
	private String password;
	private String email;
	private String shippingAddress;

   public String getEmail() {
    return(email);
  }

  public void setEmail(String email) {
    this.email = email;
  } 
  public String getFirstName() {
    return(firstName);
  }

  public void setFirstName(String firstName) {
    this.firstName = firstName;
  }
public String getLastName() {
    return(lastName);
  }
public void setLastName(String lastName) {
    this.lastName = lastName;
  }
  public void setUserName(String userName) {
    this.userName = userName;
  }
public String getUserName() {
    return(userName);
  }
  public void setPassword(String password) {
    this.password = password;
  }
public String getPassword() {
    return(password);
  }
 public void setShippingAddress(String shippingAddress) {
    this.shippingAddress = shippingAddress;
  }
public String getShippingAddress() {
    return(shippingAddress);
  }
}
