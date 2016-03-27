
<%@page import="mybean.CatalogItem" %>
<%@page import="myclasses.Catalog" %>
<%@page import="java.util.*" %>
<%@page import="java.io.*" %>

<%

	
	String filePath=request.getRealPath("ProductCatalog.txt");
	Catalog catalog= new Catalog();
	HashMap catalogItems= catalog.getProductsItems();
	try
      {
		 File f=new File(filePath);  
		 
		FileOutputStream fileOut =new FileOutputStream(f);
		ObjectOutputStream fout = new ObjectOutputStream(fileOut);
        fout.writeObject(catalogItems);
         fout.close();
         fileOut.close();
         System.out.printf("Serialized data is saved in file ");
      }catch(IOException i)
      {
          i.printStackTrace();
      }
	
	
%>

<%@include file="Header.jsp"%>

			
			<div class="itemgrid">
				<h3>Featured Products</h3>
				
				<div class="items">
					<ul>
					<%
					CatalogItem cat=null;
					for(int i=0; i<4; i++) {
					
					Random r = new Random();
				int Low = 0;
				int High = catalogItems.size();
				int R = r.nextInt(High-Low) + Low;
					cat= (CatalogItem)catalogItems.get("item"+R);
					
					
					%>
				
						<li>
						<img src="<%=cat.getImagePath()%>" alt="No Image found for this product" width="250" height="238">
						<h3><%=cat.getShortDescription()%></h3>
						<p><b>$ <%=cat.getCost()%> <a href="/sports4hawks/OrderPage.jsp?itemID=<%=cat.getItemID()%>"> Add To Cart </a></b></p>
						</li>
				
					<%}%>
				
				</ul>
				
					
				</div>
				
				<div class="footer">
				
				<p>Sports4Hawks powered by Sushil Ronak Rohit</p>
				
				</div>
				
			</div>
		

	</div>
	



</body>


</html>
