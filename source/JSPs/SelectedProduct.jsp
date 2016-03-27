<%@page import="mybean.CatalogItem" %>

<%@include file="Header.jsp"%>

<div class="itemgrid">
				<h3>Featured Products</h3>
				
				<div class="items">
					<ul>
					<%
					  CatalogItem cat = (CatalogItem) request.getAttribute("catItem");
					%>
				
						<li>
						<img src="<%=cat.getImagePath()%>" alt="No Image found for this product" width="250" height="238">
						<h3><%=cat.getShortDescription()%></h3>
						<p><b>$ <%=cat.getCost()%> <a href="/sports4hawks/OrderPage.jsp?itemID=<%=cat.getItemID()%>"> Add To Cart </a></b></p>
						</li>
				
					
				</ul>
				</div>
				<div class="footer">
				<p>Sports4Hawks powered by Sushil Ronak Rohit</p>
				</div>
			</div>
	</div>
</body>
</html>
