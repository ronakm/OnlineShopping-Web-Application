<%@include file="header2.jsp" %>

<%@page import="java.util.*" %>
<%@page import="java.io.*" %>
<%@page import="mybean.*" %>
<%@page import="java.text.*" %>

<script type="text/javascript">

function validateInput(){
	
	var x = document.forms["signupForm"]["email"].value;
		var atpos = x.indexOf("@");
		var dotpos = x.lastIndexOf(".");
		
	if(document.signupForm.first_name.value==""){
		alert("Please Enter First Name: ");
		return false;
	}
	else if(document.signupForm.last_name.value==""){
		alert("Please Enter Last Name: ");
		return false;	
	}
	else if(document.signupForm.password.value==""){
		alert("Please Enter PassWord: ");
		return false;
	}
	else if(x==""){
		alert("Please Enter Email: ");
		return false;
	}
	else if (atpos< 1 || dotpos<atpos+2 || dotpos+2>=x.length){
		alert("Not a valid e-mail address");
        return false;
    }
	else if(document.signupForm.shippingAddress.value==""){
		alert("Please Enter shippingAddress: ");
		return false;
	}
	else{
		document.signupForm.submit();
		return true;
	}
	
}

</script>
	
	<br>
		
			<TABLE BORDER="0" WIDTH="100%">
			<tr>
				<td ALIGN="LEFT" WIDTH="10%">
				
				<H3><img src="images/products.png" alt="" /></H3>
				<a href="casuals.jsp" ><img src="images/casuals.png" alt="" /></a>
				<br><br>
				<a href="equipements.jsp" ><img src="images/equipe.png" alt="" /></a>
				<br><br>
				<a href="footwears.jsp" ><img src="images/footwear.png" alt="" /></a>
				<br><br>
				<a href="menproducts.jsp" ><img src="images/men.png" alt="" /></a>
				<br><br>
				<a href="womenproduct.jsp" ><img src="images/women.png" alt="" /></a>
				<br><br>
							
				</td>
				
				<td>
				<div id="wrapper">
        <form action="/sports4hawks/AddUser" name="signupForm" >
            <fieldset>
                <legend>Register Form</legend>
                <div>
					<div class="small">First Name: </div>
                    <input type="text" name="first_name" placeholder="First Name"/>
                </div>
                <div>
					<div class="small">Last Name: </div>
                    <input type="text" name="last_name" placeholder="Last Name "/>
                </div>
                <div>
					<div class="small">Password: </div>
                    <input type="password" name="password" placeholder="Password"/>
                </div>
                <div>
					<div class="small">Email: </div>
                    <input type="text" name="email" placeholder="Email"/>
                </div>
                <div>
					
                    <div class="small">Shipping Address: </div>
                    <textarea name="shippingAddress" placeholder="shippingAddress"></textarea>
                </div>    
                <input type="button" name="button" value="Register" onclick="return validateInput()"  />
            </fieldset>    
        </form>
    </div>
				</td>
			
			</tr>
			</table>
	
	</div>
</body>
</html>
