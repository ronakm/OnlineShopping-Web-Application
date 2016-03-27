<%@page import="mybean.UserBean" %>
<html>
<TITLE>Sport4Hawks</TITLE>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="">
<link href="themes/1/js-image-slider.css" rel="stylesheet" type="text/css" />
<script src="themes/1/js-image-slider.js" type="text/javascript"></script>
 <script type="text/javascript" src="javascript.js"></script>

<link href="generic.css" rel="stylesheet" type="text/css" />
</head>


<body onload='init()'>
	<%
	String cartItems="";
	try{
		cartItems = session.getAttribute("cartItems").toString();
		if (cartItems == null){
			session.setAttribute("cartItems","0");
			cartItems = "0";
		}
	}
	catch(Exception e){
		cartItems = "0";
	}
	UserBean usrBean=null;
	String userName="";
	try{
		usrBean = (UserBean)session.getAttribute("usrbean");
		if (usrBean == null){
			userName = "Guest";
		}
		else{
			userName=usrBean.getFirstName();
			
		}
	}
	catch(Exception e){
		cartItems = "0";
	}
	
	%>
	<div id="container">
	
		<div class="header">
		
			<div class="logo">

			</div>
			<div class="links">
			
				<ul>
					<li><a href="signup.jsp">Registration</a></li>
						<%if(userName.equals("Guest")){%>
					<li><a href="login.jsp">Log In</a></li>
					<%}%>
					<li><a href="/sports4hawks/OrderPage.jsp">Checkout</a></li>
					<li><a href="viewOrders.jsp">View Orders</a></li>
					<li><b><i><a style="color:blue" href="">WelCome <%= userName%></a></i></b></li>
					<%if(!(userName.equals("Guest"))){%>
					<li><a href="/sports4hawks/LogOutServlet">Log Off</a></li>
					<%}%>
				</ul>
				
				<% if(cartItems.equals("0")) { %>
				
				<div class="cart" onclick="window.location ='/sports4hawks/OrderPage.jsp';">
				
				<% } else { %>
				
				<div class="cart_full" onclick="window.location ='/sports4hawks/OrderPage.jsp';">
				
				<% } %>
				
				</div>
				<p><%=cartItems%></p>
			
			</div>
		</div>
		&nbsp
		<div class="navigatation">
			<ul>
				<li><a href="/sports4hawks/index.jsp">Home</a></li>
				<li><a href="aboutus.jsp">About</a></li>
				<li><a href="/sports4hawks/contactus.jsp">Contacts</a></li>
			</ul>
			
			
			
			
			
			<div class="search">
			<form name='autofillform' action='autocomplete'>
				<input type='text' size='40' id='complete-field' onkeyup='doCompletion()'>
				<input type="submit"  value="" >
				<table id="complete-table"> 
				</table>
				
			</form>
			</div>
		</div>
