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

public class CatalogItem implements java.io.Serializable{
  public CatalogItem(String itemID, String shortDescription,
			String longDescription,String prodCatagory,String imagePath, double cost) {
		super();
		this.itemID = itemID;
		this.shortDescription = shortDescription;
		this.longDescription = longDescription;
		this.prodCatagory=prodCatagory;
		this.imagePath=imagePath;
		this.cost = cost;
	}

private String itemID;
  private String shortDescription;
  private String longDescription;
  private String prodCatagory;
  private String imagePath;
  
  private double cost;
  
public String getImagePath() {
    return(imagePath);
  }

  public void setImagePath(String imagePath) {
    this.imagePath = imagePath;
  }
   public String getProdCatagory() {
    return(prodCatagory);
  }

  public void setProdCatagory(String itemID) {
    this.prodCatagory = prodCatagory;
  }

    
  public String getItemID() {
    return(itemID);
  }

  public void setItemID(String itemID) {
    this.itemID = itemID;
  }

  public String getShortDescription() {
    return(shortDescription);
  }

  public void setShortDescription(String shortDescription) {
    this.shortDescription = shortDescription;
  }

  public String getLongDescription() {
    return(longDescription);
  }

  public void setLongDescription(String longDescription) {
    this.longDescription = longDescription;
  }

  public double getCost() {
    return(cost);
  }

  public void setCost(double cost) {
    this.cost = cost;
  }
}
