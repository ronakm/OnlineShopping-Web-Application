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
        <form action="SendEmail" method="post" name="contactus" >
            <fieldset>
                <legend>Contact Us</legend>
				
				<div>
					<div class="small">First Name: </div>
                    <input type="text" name="firstname" placeholder="First Name"/>
                </div>
				
				<div>
					<div class="small">Last Name: </div>
                    <input type="text" name="lastname" placeholder="Last Name"/>
                </div>
                <div>
					<div class="small">Email ID: </div>
                    <input type="text" name="email_id" placeholder="Emaid Address"/>
                </div>
                <div>
					<div class="small">Password : </div>
                    <input type="password" name="pass" placeholder="Password of your Email Id "/>
                </div>
                <div>
					<div class="small">Title : </div>
                    <input type="text" name="subject" placeholder="Enter your Title"/>
                </div>
                
                <div>
					
                    <div class="small">Shipping Address: </div>
                    <textarea name="body" placeholder="Write your Query"></textarea>
                </div>    
                <input type="submit" value="Send"/>
            </fieldset>    
        </form>
    </div>
	<h3 align="left"> Click on SEND Button to send query/request to admin </h3>
				</td>
			</tr>
			</table
	</div>
</body>
</html>
