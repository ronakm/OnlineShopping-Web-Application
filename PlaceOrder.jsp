<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@include file="Header.jsp"%>



<H1 ALIGN="CENTER">Add your personal details for this order</H1>
<FORM ACTION="/sports4hawks/Checkout.jsp" 
      METHOD="POST">
  <HR>
  <TABLE id="order_form">
  <%
  if(userName.equals("Guest") || usrBean==null){
  %>
  
	<TR><TD>First Name:</TD><TD> <INPUT TYPE="TEXT" NAME="firstName"></TD></TR>
	<TR><TD>Last Name:</TD><TD> <INPUT TYPE="TEXT" NAME="lastName"></TD></TR>
	<TR><TD>Email Id:</TD><TD> <INPUT TYPE="TEXT" NAME="email"</TD></TR>
	<TR><TD>Shipping Address:</TD><TD><TEXTAREA NAME="address" ROWS='3' COLS='40'></TEXTAREA></TR>
	<%}
	else{
	
	%>
	
	<TR><TD>First Name:</TD><TD> <INPUT TYPE="TEXT" NAME="firstName" value=<%=usrBean.getFirstName()%>></TD></TR>
	<TR><TD>Last Name:</TD><TD> <INPUT TYPE="TEXT" NAME="lastName" value=<%=usrBean.getLastName()%>></TD></TR>
	<TR><TD>Email Id:</TD><TD> <INPUT TYPE="TEXT" NAME="email" value=<%=usrBean.getEmail() %>></TD></TR>
	
	<TR><TD>Shipping Address:</TD><TD><TEXTAREA NAME="address" ROWS='3' COLS='40' ><%=usrBean.getShippingAddress()%></TEXTAREA></TR>
	<%}%>
	<TR><TD>Credit Card:</TD><BR><TD> 
  
  
  &nbsp;&nbsp;<INPUT TYPE="RADIO" NAME="cardType"
                     VALUE="Visa">Visa<BR>
  &nbsp;&nbsp;<INPUT TYPE="RADIO" NAME="cardType"
                     VALUE="MasterCard">MasterCard<BR>
  &nbsp;&nbsp;<INPUT TYPE="RADIO" NAME="cardType"
                     VALUE="Amex">American Express<BR>
  &nbsp;&nbsp;<INPUT TYPE="RADIO" NAME="cardType"
                     VALUE="Discover">Discover<BR>
  &nbsp;&nbsp;<INPUT TYPE="RADIO" NAME="cardType"
                     VALUE="Java SmartCard">Java SmartCard<BR>
					 </TR>
  <TR><TD>Credit Card Number:</TD><TD><INPUT TYPE="PASSWORD" NAME="cardNum"></TD></TR>
  <TR><TD>Repeat Credit Card Number:</TD><TD><INPUT TYPE="PASSWORD" NAME="cardNum"></TD></TR>
  <TR></TR><TR></TR><TR></TR><TR></TR><TR></TR><TR></TR><TR></TR><TR></TR>
  <TD></TD><TD><INPUT align='right' TYPE="SUBMIT" VALUE="Submit Order"></TD></TABLE>
</FORM>
</BODY></HTML>