package myclasses;	

/** A catalog that lists the items available in inventory.
 *  <P>
 *  Taken from Core Servlets and JavaServer Pages 2nd Edition
 *  from Prentice Hall and Sun Microsystems Press,
 *  http://www.coreservlets.com/.
 *  &copy; 2003 Marty Hall; may be freely used or adapted.
 */
import mybean.CatalogItem;
import java.util.ArrayList;
import java.util.HashMap;
import java.io.*;
import java.util.Iterator;

public class Catalog {
  // This would come from a database in real life.
  // We use a static table for ease of testing and deployment.
  // See JDBC chapters for info on using databases in
  // servlets and JSP pages.
 private static HashMap products = new HashMap();
  
 
 public Catalog() {
	
	products.put("item1", new CatalogItem("item1","Nike Basketball","Nike Men's Size Basketball","Equipments","/sports4hawks/images/Equipments/Basketball1.jpg",34));
	products.put("item2", new CatalogItem("item2","Chicago Bulls Basketball","Chicago Bulls Men's Size Basketball","Equipments","/sports4hawks/images/Equipments/Basketball2.jpg",32));
    products.put("item3", new CatalogItem("item3","Nike United","Nike United Soccer Ball(RED)","Equipments","/sports4hawks/images/Equipments/Football1.jpg",22.50));
    products.put("item4", new CatalogItem("item4","Adidas Soccer Ball","Adidas Soccer Ball(ORANGE) Size 5","Equipments","/sports4hawks/images/Equipments/Football2.jpg",29.99));
    products.put("item5", new CatalogItem("item5","Tennis Racquet","Tennis Racquet For Men","Equipments","/sports4hawks/images/Equipments/Tennis_Racquet1.jpg",27.99));
    products.put("item6", new CatalogItem("item6","Snow Helmet Small","Snow Helmets (BLACK)","Equipments","/sports4hawks/images/helmets/snow_helmet1.jpg",48.99));
	products.put("item7", new CatalogItem("item7","Snow Helmet Medium","Unisex Adult Snow Helmet (Grey)","Equipments","/sports4hawks/images/helmets/snow_helmet2.jpg",46.99));
    products.put("item8", new CatalogItem("item8","Snow Helmet Large","Adult Snow Helmet for Men (BLUE)","Equipments","/sports4hawks/images/helmets/snow_helmet3.jpg",43.50));
	products.put("item9",new CatalogItem("item9","Green Snow Helmet","Unisex Adult Snow Helmet (Green)","Equipments","/sports4hawks/images/helmets/snow_helmet4.jpg",56.99));
	products.put("item10", new CatalogItem("item10","Snow Helmet","Snow Helmet for Women (WHITE)","Equipments","/sports4hawks/images/helmets/snow_helmet5.jpg",58.99));
	products.put("item11", new CatalogItem("item11","Adidas Basketball Shoes","Basketball Shows for Men","footwear","/sports4hawks/images/footwear/adidas_basketball1.jpg",99.99));
	products.put("item12", new CatalogItem("item12","Adidas Soccer Studs Black","Soccer Studs for Men","footwear","/sports4hawks/images/footwear/adidas_shoes1.jpg",149.99));
	products.put("item13", new CatalogItem("item13","Adidas Soccer Studs Blue","Soccer Studs for Men","footwear","/sports4hawks/images/footwear/adidas_shoes2.jpg",89.99));
	products.put("item14", new CatalogItem("item14","Adidas Soccer Studs Black and White","Soccer Studs for Men","footwear","/sports4hawks/images/footwear/adidas_shoes3.jpg",89.99));
	products.put("item15", new CatalogItem("item15","Adidas Soccer Studs White","Soccer Studs","footwear","/sports4hawks/images/footwear/shoes_4.jpg",128.99));
	products.put("item16",  new CatalogItem("item16","Chicago Bulls Jersey","Chicago Bulls Jersey for Men","men","/sports4hawks/images/Men/jersey1.jpg",48.99));
	products.put("item17", new CatalogItem("item17","Nike T-Shirt (Yellow) ","Yellow T Shirt Men","men","/sports4hawks/images/Men/T_shirt1.jpg",34.99));
	products.put("item18",  new CatalogItem("item18","Nike T-Shirt (Green) ","T Shirt Men","men","/sports4hawks/images/Men/T-Shirt2.jpg",32.50));
	products.put("item19",  new CatalogItem("item19","Nike T-Shirt (Black) ","Black T Shirt Men","men","/sports4hawks/images/Men/T-Shirt3.jpg",28.99));
	products.put("item20",  new CatalogItem("item20","Puma T-Shirt (Black) ","Black full T Shirt Men","men","/sports4hawks/images/Men/T-Shirt4.jpg",25.99));
	products.put("item21",  new CatalogItem("item21","Adidas T-Shirt (Red) ","Red T Shirt Men","men","/sports4hawks/images/Men/T-Shirt5.jpg",35.99));
	products.put("item22",  new CatalogItem("item22","Adidas T-Shirt (Red) ","Red T Shirt Men","men","/sports4hawks/images/Men/tshirt.jpg",38.99));
	products.put("item23",  new CatalogItem("item23","T-Shirt (Blue) ","Blue T Shirt Women","women","/sports4hawks/images/Women/T-Shirt1.jpg",45.99));
	products.put("item24",  new CatalogItem("item24","T-Shirt (Sky Blue) ","Skyblue T Shirt Men","women","/sports4hawks/images/Women/T-Shirt3.jpg",35));
	products.put("item25",new CatalogItem("item25","T-Shirt (White-Blue) ","White Blue T Shirt Men","women","/sports4hawks/images/Women/T-Shirt4.jpg",27.99));
	products.put("item26", new CatalogItem("item26","Wilson Tennis Racquet","Tennis Racquet For Women (White)","Equipments","/sports4hawks/images/Equipments/Tennis_Racquet2.jpg",28.99));
	products.put("item27", new CatalogItem("item27","Prestige Tennis Racquet","Tennis Racquet For Women (White)","Equipments","/sports4hawks/images/Equipments/Tennis_Racquet3.jpg",30.00));
	products.put("item28", new CatalogItem("item28","Tachikara VolleyBall (BLUE)","Tachikara Indoor VolleyBall","Equipments","/sports4hawks/images/Equipments/VolleyBall1.jpg",49.99));
	products.put("item29", new CatalogItem("item29","Tachikara VolleyBall (YELLOW)","Tachikara Indoor VolleyBall","Equipments","/sports4hawks/images/Equipments/VolleyBall2.jpg",49.99));
	products.put("item30", new CatalogItem("item30","Wilson Power Touch VolleyBall","Wilson Power Touch VolleyBall (RED/WHITE/BLUE)","Equipments","/sports4hawks/images/Equipments/VolleyBall3.jpg",39.99));
	products.put("item31", new CatalogItem("item31","Nike Indoor VolleyBall","Nike Indoor VolleyBall (WHITE)","Equipments","/sports4hawks/images/Equipments/VolleyBall4.jpg",59.99));
	products.put("item32", new CatalogItem("item32","Calvin Klein T-Shirt Blue","Calvin Klein Logo Print V-Neck T-Shirt (BLUE)","casuals","/sports4hawks/images/Casuals/Casual1.jpg",21.99));
	products.put("item33", new CatalogItem("item33","Calvin Klein T-Shirt Black","Calvin Klein Core Slim Fit V-Neck Slub Tee (BLACK)","casuals","/sports4hawks/images/Casuals/Casual2.jpg",24.99));
	products.put("item34", new CatalogItem("item34","Polo Ralph Lauren T-Shirt Black","Polo Ralph Lauren Classic-Fit Jersey Pocket Crew-Neck T-Shirt (Bittersweet)","casuals","/sports4hawks/images/Casuals/Casual3.jpg",21.99));
	products.put("item35", new CatalogItem("item35","Alfani RED T Shirt","Alfani RED T Shirt, Fitted V Neck T Shirt","casuals","/sports4hawks/images/Casuals/Casual4.jpg",14.50));
	products.put("item36", new CatalogItem("item36","Calvin Klein Coat","Calvin Klein Hooded Quilted Packable Down Puffer Coat","casuals","/sports4hawks/images/Casuals/Casual5.jpg",79.99));
	products.put("item37", new CatalogItem("item37","International Concepts Coat","International Concepts Double-Breasted Contrast-Trim Pea Coat","casuals","/sports4hawks/images/Casuals/Casual6.jpg",50.99));
	products.put("item38", new CatalogItem("item38","Ralph Lauren Sweater","Lauren Ralph Lauren Long-Sleeve Turtleneck Sweater","casuals","/sports4hawks/images/Casuals/Casual7.jpg",39.99));
	products.put("item39", new CatalogItem("item39","Ralph Lauren Pointelle-Knit Sweater","Lauren Ralph Lauren Pointelle-Knit Crew-Neck Sweater","casuals","/sports4hawks/images/Casuals/Casual8.jpg",98.00));
	products.put("item40", new CatalogItem("item40","Charter Club Sweater","Charter Club Ombre-Stripe Cashmere Sweater","casuals","/sports4hawks/images/Casuals/Casual9.jpg",94.99));
	products.put("item41", new CatalogItem("item41","Under Armour Bag","Under Armour Undeniable Medium Duffle Bag","Equipments","/sports4hawks/images/Equipments/Bag1.jpg",44.99));
	products.put("item42", new CatalogItem("item42","Nike Bag","Nike Brasilia 6 Medium Duffle Bag","Equipments","/sports4hawks/images/Equipments/Bag2.jpg",40.00));
	products.put("item43", new CatalogItem("item43","Total Gym 1900","Total Gym 1900 Exercise system","Equipments","/sports4hawks/images/Equipments/Gym1.jpg",399.99));
	products.put("item44", new CatalogItem("item44","Powerline Gym","Powerline P2X Home Gym","Equipments","/sports4hawks/images/Equipments/Gym2.jpg",1498.99));
	products.put("item45", new CatalogItem("item45","Shoulder Press Machine","Body Solid Leverage LVSP Shoulder Press Machine","Equipments","/sports4hawks/images/Equipments/Gym3.jpg",994.99));
	products.put("item46", new CatalogItem("item46","Leg and Preacher Attachment","Best Fitness BFPL10 Leg and Preacher Attachment","Equipments","/sports4hawks/images/Equipments/Gym4.jpg",99.99));
	products.put("item47", new CatalogItem("item47","SOREL Winter Boots","SOREL Women's Joan of Arctic Winter Boots","footwear","/sports4hawks/images/footwear/Boots1.jpg",149.99));
	products.put("item48", new CatalogItem("item48","Columbia Winter Boots","Columbia Women's Minx Mid II Omni-Heat Winter Boots","footwear","/sports4hawks/images/footwear/Boots2.jpg",119.99));
	products.put("item49", new CatalogItem("item49","SOREL High Winter Boots","SOREL Women's Tivoli II High Winter Boots","footwear","/sports4hawks/images/footwear/Boots3.jpg",139.99));
	products.put("item50", new CatalogItem("item50","Merrell Winter Boots","Merrell Men's Polarand 8 Waterproof Insulated Winter Boots","footwear","/sports4hawks/images/footwear/Boots4.jpg",174.99));
	products.put("item51", new CatalogItem("item51","Timberland Winter Boots","Timberland Men's Earthkeepers Chillberg Mid Waterproof 200g Plain Toe Winter Boots","footwear","/sports4hawks/images/footwear/Boots5.jpg",134.99));
	products.put("item54", new CatalogItem("item54","Reebok HandBag","Reebok Women's Studio Bag","women","/sports4hawks/images/Women/HandBag1.jpg",60.00));
	products.put("item55", new CatalogItem("item55","Nike HandBag","Nike Graphic Reversible Tote Bag","women","/sports4hawks/images/Women/HandBag2.jpg",35.00));
	products.put("item56", new CatalogItem("item56","Oakley HandBag","Oakley Performance Tote Bag","women","/sports4hawks/images/Women/HandBag3.jpg",80.00));
	}
	
  public static HashMap getItems(String catagory,String filePath) {
   
	HashMap catalogItems = new HashMap();
    if (catagory == null) {
      return(null);
    }
		try
		{
         FileInputStream fileIn = new FileInputStream(filePath);
		 ObjectInputStream srpin = new ObjectInputStream(fileIn);
         int productsize=0;
		 HashMap e = null;
		 e = (HashMap)srpin.readObject();
		 if (e!= null){
		  Iterator it = products.keySet().iterator();

                while (it.hasNext()) {
                    String id = (String) it.next();
                    CatalogItem catItem = (CatalogItem) products.get(id);
					if (catagory.equals(catItem.getProdCatagory())) {
						catalogItems.put(id,catItem);
					}
			}
		 }
         srpin.close();
         fileIn.close();
		}catch(IOException ex){ ex.printStackTrace();}
		 catch(ClassNotFoundException c){c.printStackTrace();}
    return catalogItems;
		}
	 public  HashMap getProductsItems() {
        return products;
    }	
	
}
               
