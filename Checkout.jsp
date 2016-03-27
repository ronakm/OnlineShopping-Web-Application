<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="mybean.*" %>
<%@page import="java.text.*" %>

<%  Random r = new Random( System.currentTimeMillis() );
	int rand= 10000 + r.nextInt(20000);
	String randString=Integer.toString(rand);
    String title = "Your Order Placed Successfully";
	ShoppingCart cart;
	cart = (ShoppingCart)session.getAttribute("shoppingCart");
	List itemsOrdered=cart.getItemsOrdered();
	
    %>
	<%@page import="mybean.UserBean" %>

<%@include file="header2.jsp" %>
		<br>
		
			<TABLE BORDER="0" WIDTH="100%">
			<tr>
				<td ALIGN="LEFT" WIDTH="10%">
				
				<H3><img src="images/products.png" alt="" /></H3>
				<a href="Products.jsp?category=casuals" ><img src="images/casuals.png" alt="" /></a>
				<br><br>
				<a href="Products.jsp?category=Equipments" ><img src="images/equipe.png" alt="" /></a>
				<br><br>
				<a href="Products.jsp?category=footwear" ><img src="images/footwear.png" alt="" /></a>
				<br><br>
				<a href="Products.jsp?category=men" ><img src="images/men.png" alt="" /></a>
				<br><br>
				<a href="Products.jsp?category=women" ><img src="images/women.png" alt="" /></a>
				<br><br>
							
				</td>
				

						 <%
    
	String filePath=request.getRealPath("Data/OrderDetails.txt");
	%>
				<td width="90%">
					<div id="checkout_order" width="100%"> 
							<h3 align="center">Your Order Placed Successfully <h3>
							<p>Your Order Number :<%= randString %> </p>
							<p>First Name: <%= request.getParameter("firstName")%></p>
							<p>Last Name: <%= request.getParameter("lastName") %></p>
							<p>Address: <%= request.getParameter("address") %> </p>
							
							
	<%
    Calendar cal = Calendar.getInstance();
	cal.add(Calendar.DAY_OF_MONTH, 14);
	Date newDate = cal.getTime();

	SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
	%>
	
							<p>Delivery Date: <%=dateFormat.format(newDate) %> </p>
<%
	
      // New visitors get a fresh shopping cart.
      // Previous visitors keep using their existing cart.
      
	OrderBean ordbean = new OrderBean();
      ordbean.setOrderNo(randString);
	  ordbean.setFirstName(request.getParameter("firstName"));
	  ordbean.setLastName(request.getParameter("lastName"));
	  ordbean.setEmailId(request.getParameter("email"));
	  ordbean.setDeliveryDate(dateFormat.format(newDate));
	  if (cart != null) {
		ordbean.setItemsOrdered(cart.getItemsOrdered());
      }
	  
      try
      {
         File orderFile= new File(filePath);
		 if(!orderFile.exists()) {
			orderFile.createNewFile();
			FileOutputStream fileOut =new FileOutputStream(orderFile);
			ObjectOutputStream objout = new ObjectOutputStream(fileOut);
			
			objout.writeObject(ordbean);
			objout.close();
			fileOut.close();
		} 
		else
		{
			FileInputStream fileIn = new FileInputStream(orderFile);
			ObjectInputStream objin = new ObjectInputStream(fileIn);
			ArrayList<mybean.OrderBean> orderBeans = new ArrayList(); 
			orderBeans.add(ordbean);
			OrderBean e=null;
			while(fileIn.available()>0){
				e = (OrderBean) objin.readObject();
				orderBeans.add(e);
			}
			objin.close();
			fileIn.close();
			FileOutputStream fileOut =new FileOutputStream(orderFile);
			ObjectOutputStream objout = new ObjectOutputStream(fileOut);
			for(int i=0;i<orderBeans.size();i++)
			{
				objout.writeObject(orderBeans.get(i));
			}
			objout.close();
			fileOut.close();
			
		}	
      }catch(IOException i)
      {
         i.printStackTrace();
         return;
      }catch(ClassNotFoundException c)
      { c.printStackTrace();
         return;
      }
      
	 String backURL =response.encodeURL("/sports4hawks/index.jsp");
%>	

	<TABLE BORDER=1 ALIGN=CENTER>
	<h3>Products Ordered are</h3>
                <TR BGCOLOR=\"#75E9F2\">
                <TH>Product Name<TH>Product Quantity<TH>Product Cost
				<%
				for(int i=0;i<itemsOrdered.size();i++){
				ItemOrder itemorder=(ItemOrder)itemsOrdered.get(i);
				%>
				<TR>
					<TD><%=itemorder.getShortDescription()%></TD>
					<TD><%=itemorder.getNumItems() %></TD>
					<TD><%=itemorder.getTotalCost() %></TD>
				</TR>
				<%}%>
	</TABLE>		
	
	<FORM ACTION=<%=backURL %>>
           <BIG><CENTER>
           <INPUT TYPE="SUBMIT" VALUE="Back to Best Deal Store">
           </CENTER></BIG></FORM>





	</div>
				
				
				
				</td>
			</tr>
			</table
	</div>
</body>
</html>
	<%
	request.getSession().invalidate();
	
	%>
