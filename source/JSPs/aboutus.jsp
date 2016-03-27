<%@page import="mybean.UserBean" %>
<html>
<TITLE>Sport4Hawks</TITLE>
<head>
<link rel="stylesheet" type="text/css" href="css/style.css">
<link href="themes/1/js-image-slider.css" rel="stylesheet" type="text/css" />
<script src="themes/1/js-image-slider.js" type="text/javascript"></script>
 <script type="text/javascript" src="JS/javascript.js"></script>

<link href="css/generic.css" rel="stylesheet" type="text/css" />
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
				
				<td ALIGN="center" WIDTH="80%">
				
				<div id="sliderFrame">
					<div id="slider">
					<a href="images/image1.jpg" target="_blank">
						<img src="images/image1.jpg" alt="Welcome to Sports4hawk.com" />
					</a>
					<img src="images/image2.jpg" alt="" />
					<img src="images/image3.jpg" alt="" />
					<img src="images/image4.jpg" alt="" />
					</div>
				</div>
				</td>
				
			</tr>
			</table>
		<br>
		
			<TABLE BORDER="0" WIDTH="100%">
			<tr>
			
			<H2> <p> <br> <br>About Us </p></H2>
			
			<H3> 
			<p>Through our services, you can buy Sports equipements under different categories such as Casuals, Equipment, Footwear, Men, and Women. 
			This site is for Students of Illinois Institute of Technology, Chicago who can buy Sport Goods using their Hawk Email ids. 
			<br>We provide better offers and services for HAWKS!!!!</p> 
			
			<p>You only need to register your account by giving basic information.</p>
			Get started today!
			
			<p>Developing Team :<br>
			<br>
			Sushil Pangarkar<br>
			Ronak Makadiya<br>
			Rohit Jadhav<br></p>
			</H3>
				
			</tr>
			</table>
		

	</div>
			


</body>


</html>
