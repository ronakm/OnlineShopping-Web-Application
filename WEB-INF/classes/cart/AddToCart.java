package cart;

import java.util.*;


public class AddToCart
{
	private int count=0;
	private String productid;
	
	private int[] quantities = new int[20];
	

	private String[] myproduct=new String[20];
	private String[] productname=new String[20];
	private String[] productdesc=new String[20];
 	private String[] productprice=new String[20];
	

	
	public void setQuantities(String id,String quanti) {
		 
		int position=Arrays.asList(this.myproduct).indexOf(id);	
		int temp= Integer.parseInt(quanti);
		
		this.quantities[position]=temp;
		
		
	}
	
	
	
	public int[] getQuantities() {
		 
			return this.quantities;
		
	}
	
	
	// Set and Get of product price 
	
	public void setProductprice(String value) {
	
		this.productprice[count-1]=value;
	
	}
	public String[] getProductprice() {
		 
			return this.productprice;
		
	}
	// Set and Get of product name
	
	public void setProductname(String value) {
	
		this.productname[count-1]=value;
	
	}
	
	public String[] getProductname() {
		 
			return this.productname;
		
	}
	

	// Set and Get of product description
	
	public void setProductdesc(String value) {
	
		this.productdesc[count-1]=value;
	
	}
	public String[] getProductdesc() {
		 
			return this.productdesc;
		
	}
	
	
	// Set and Get of product id
	public int setProductid(String value) {
	
        this.productid = value;
	
		 boolean b = Arrays.asList(this.myproduct).contains(value);
		 
		 if(b==false) 
		 {	
			this.myproduct[count]=value;
			this.quantities[count]=1;
			this.count++;
			return 1;
		 }
		 else {
		 
		 int position=Arrays.asList(this.myproduct).indexOf(value);
		 this.quantities[position] += 1;
		 return 0;
		
		 
		} 
		
	}
	public String[] getProductid() {
		 
			return this.myproduct;
		
	}
	
	public void setNull()
	{
	this.count=0;
	
		for(int i=0;i<this.myproduct.length;i++) 
		{
			this.myproduct[i]=null;
		}
	
	}
		
		 
		/* int flag=0;
		
		
		
		for(int j=0; j < myproduct.length; j++) 
		{
			if(myproduct[j].equals(value)) 
			{
				flag=1;
				
			}
		
		}
		if(flag==0)
		{
			this.myproduct[count]=value;
			this.quantities[count]=1;
			this.count++;
			
		}
		else 
		{
			this.quantities[count] += 1;
		}
		*/
	

	
	
	 /* public void setList(int values[]) {
        this.list = values;
    }


  public int[] getList() {
        return this.list;
    }
*/
  
  
  public int getcount() {
    return this.count;
	}
  public  void setcount(int count)
  {
	this.count=0;
  }
  
  
  
}