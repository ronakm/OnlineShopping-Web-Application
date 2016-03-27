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

<%@page import="java.util.ArrayList" %>
<%@page import="java.io.*" %>
<%@page import="mybean.CatalogItem" %>
<%@page import="myclasses.Catalog" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.Iterator" %>

<%  
	
	
	String filePath=request.getRealPath("Data/ProductCatalog.txt");
	HashMap productItems = Catalog.getItems(request.getParameter("category"),filePath);
	if (productItems == null) {
			response.sendError(response.SC_NOT_FOUND, "Missing Items.");
			return;
		} 
	
	
	String title="Equipments Available At Sports4Hawks ";
 %> 
<%@include file="Header.jsp"%>

			<div class="itemgrid">
				<h3><%= request.getParameter("category").toUpperCase() %></h3>
				
				<div class="items">
					<ul>
					<%
					
					Iterator it = productItems.keySet().iterator();

					while (it.hasNext()) {
                    String id = (String) it.next();
                    CatalogItem catItem = (CatalogItem) productItems.get(id);
					%>
				
						<li>
						<img src="<%=catItem.getImagePath()%>" alt="No Image found for this product" width="250" height="238">
						<h3><%=catItem.getShortDescription()%></h3>
						<p><b>$ <%=catItem.getCost()%> <a href="/sports4hawks/OrderPage.jsp?itemID=<%=catItem.getItemID()%>"> Add To Cart </a></b></p>
						</li>
				
					<%}%>
				
				</ul>
				
					
				</div>
				
			</div>
				
				<div class="footer">
				
				<p>Sports4Hawks powered by Sushil Ronak Rohit</p>
				
				</div>
				
				 </BODY></HTML>
	