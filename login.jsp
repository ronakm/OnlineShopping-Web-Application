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
		<td>
				<div id="wrapper">
        <form action="/sports4hawks/ValidateServlet" method="post" name="loginForm" >
            <fieldset>
                <legend>Login Form</legend>
                <div>
					<div class="small">User: </div>
                    <input type="text" name="user_name" placeholder="Enter Email address"/>
                </div>
                <div>
					<div class="small">Password: </div>
                    <input type="password" name="password" placeholder="Password"/>
                </div>
                
                <input type="Submit" value="LogIn">
            </fieldset>    
        </form>
    </div>
				</td>
				
			</tr>
			</table>
			
	</div>

</body>
</html>