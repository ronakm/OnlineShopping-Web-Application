

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- 
Simple example of jsp:useBean and manipulating properties
with jsp:setProperty and jsp:getProperty and
with explicit Java code in scriptlets and expressions. 

Taken from Core Servlets and JavaServer Pages 2nd Edition
from Prentice Hall and Sun Microsystems Press,
http://www.coreservlets.com/.
(C) 2003 Marty Hall; may be freely used or adapted.
-->


<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="mybean.*" %>
<%@page import="java.text.*" %>
<%@include file="Header.jsp"%>

<%	
	String ordernumber=request.getParameter("ordernumber");
	String orderEmailId="";
	
	if(userName.equals("Guest")){
		orderEmailId=request.getParameter("orderEmail");
		if(orderEmailId==null)
			orderEmailId="";
	}
	else{
			orderEmailId=usrBean.getUserName();
	}
	
	String filePath=request.getRealPath("OrderDetails.txt");
	String errmess="";
	
	int datediff=0;

	Date currentDate=new Date();
	Calendar startCal;  
    Calendar endCal;  
    startCal = Calendar.getInstance();  
    startCal.setTime(currentDate);
	endCal = Calendar.getInstance(); 
	
	
	ArrayList<mybean.OrderBean> orderList = new ArrayList(); 
	  if(ordernumber!=null)
	  {
		OrderBean e=null;
				try
				{
					FileInputStream fileIn = new FileInputStream(filePath);
					ObjectInputStream srpin = new ObjectInputStream(fileIn);
					int productsize=0;
			
					while(fileIn.available()>0){
					SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy");
						e = (OrderBean)srpin.readObject();
						productsize++;
						if (!ordernumber.equals(e.getOrderNo())) {
							orderList.add(e);
						}
						else{
							endCal.setTime(sdf.parse(e.getDeliveryDate()));
							if (startCal.getTimeInMillis() == endCal.getTimeInMillis()) {  
								datediff= 0;  
							}
							if (startCal.getTimeInMillis() > endCal.getTimeInMillis()) {  
								startCal.setTime(sdf.parse(e.getDeliveryDate()));  
								endCal.setTime(currentDate);  
							}  
		
							do {  
								startCal.add(Calendar.DAY_OF_MONTH, 1);  
								if (startCal.get(Calendar.DAY_OF_WEEK) != Calendar.SATURDAY && startCal.get(Calendar.DAY_OF_WEEK) != Calendar.SUNDAY) {  
									++datediff;  
								}  
							} while (startCal.getTimeInMillis() < endCal.getTimeInMillis());  
							if(datediff<=5){
								orderList.add(e);
								errmess=" Its too late to delete this order.Order Can be deleted 5 'BUSINESS' days before delivery Date";
							}
						}
					}
					srpin.close();
					fileIn.close();
				}catch(IOException ex){ ex.printStackTrace();}
				try
				{
					FileOutputStream fileOut =new FileOutputStream(filePath);
					ObjectOutputStream srpout = new ObjectOutputStream(fileOut);
					for(int i=0; i<orderList.size(); i++){
						srpout.writeObject(orderList.get(i));
					}
					srpout.close();
					fileOut.close();
				}catch(IOException i){
					i.printStackTrace();
				}
		}
	File orderFile= new File(filePath);

	if(orderFile.canRead()){

	String title = "Your Orders";
  %>
  
   <div id="vieworder_page">
  
  
  <%if(!errmess.equals("")){%>
	<h2><font color="RED"><%=errmess%></font></h2>
	<%}
	if(userName.equals("Guest") && orderEmailId.equals("")){
	%>
	
	<h2 align='center'> Welcome Guest</h2>
	
	<FORM name="" ACTION="/sports4hawks/viewOrders.jsp" METHOD="POST" class="searchorder">
	<table>
		<tr>
			<td>Enter Emails Id to get your Order Details</td>
			<td><input type="text" name="orderEmail" ></td>
			<td><INPUT TYPE='SUBMIT' VALUE='Get Order Details'></td>
		<tr>
	</table>
	</FORM>
	<%}
	 if(!orderEmailId.equals("")){
	 %>
	
	<h2 align="center"> Your Orders  </h2>
				
	<%
	 try
      {
         FileInputStream fileIn = new FileInputStream(filePath);
         ObjectInputStream srpin = new ObjectInputStream(fileIn);
         int size=0;
		 OrderBean ordBean=null;
         while(fileIn.available()>0){
         ordBean = (OrderBean) srpin.readObject();
		 List itemsOrdered=ordBean.getItemsOrdered();
		 if(ordBean.getEmailId().equals(orderEmailId)){
		 %>
		 <div id="orderno">
		 <TABLE BORDER=1 ALIGN='LEFT'><TR BGCOLOR="#B8E2EF">
          <TH>Order Number<TH>First Name<TH>Last Name<TH>Email Id<TH>Order Delivery Date
		
		 <TR><TD><%=ordBean.getOrderNo()%></TD><TD><%=ordBean.getFirstName()%></TD><TD><%=ordBean.getLastName()%></TD><TD><%=ordBean.getEmailId()%></TD><TD><%=ordBean.getDeliveryDate()%></TD></TR>
		 </table>
		 
		 <h4>Product details of order no : <%=ordBean.getOrderNo()%> </h4>
		 <table class="productdetails" BORDER=1>
		 
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
			</TR>
		</table>
		</div>
         <% size++;
		 }
         }
         srpin.close();
         fileIn.close();
      }catch(IOException i)
      {
         i.printStackTrace();
         return;
      }catch(ClassNotFoundException c)
      {
         System.out.println(" class not found");
         c.printStackTrace();
         return;
      }
	
	%>
	
	
	<div id="deleteorder">
	<FORM> Enter Order Id to Delete : <INPUT TYPE='TEXT' NAME='ordernumber' SIZE=10 VALUE=''>&nbsp&nbsp<INPUT TYPE='SUBMIT' VALUE='Delete Order'></FORM>
    <FORM ACTION="/sports4hawks/index.jsp" METHOD="POST">
	<INPUT TYPE='SUBMIT' VALUE='Back to Store'></FORM>
	
	
	</div>
	
<%
	}	
	}
	else{
	%><h2>NO ORDER Details Found</h2><%
	}
  
%>
  
  
  
  
	</div>
	</div>
</body>
</html>
  
  
	

