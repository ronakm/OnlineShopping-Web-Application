
import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.HashMap;
import java.util.Iterator;
import mybean.CatalogItem;
import myclasses.Catalog;

/**
 *
 * @author nbuser
 */
public class AutoCompleteServlet extends HttpServlet {

    private ServletContext context;
    private Catalog productsData = new Catalog();
    private HashMap products = productsData.getProductsItems();

    @Override
    public void init(ServletConfig config) throws ServletException {
        this.context = config.getServletContext();
    }

    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String action = request.getParameter("action");
       String targetId = request.getParameter("id");
	   
        StringBuffer sb = new StringBuffer();

        if (targetId != null) {
            targetId = targetId.trim().toLowerCase();
        } else {
            context.getRequestDispatcher("/error.jsp").forward(request, response);
        }

        boolean productsAdded = false;
		
        if (action.equals("complete")) {
		System.out.println("Am Here in Complete :" +action +" ID: "+targetId);
            // check if user sent empty string
            if (!targetId.equals("")) {

                Iterator it = products.keySet().iterator();

                while (it.hasNext()) {
                    String id = (String) it.next();
                    CatalogItem catItem = (CatalogItem) products.get(id);
					
                    if ( // targetId matches first name
							
                         //catItem.getItemID().toLowerCase().startsWith(targetId) ||
                         // targetId matches last name
                         catItem.getShortDescription().toLowerCase().startsWith(targetId) ){
						 
						 // ||
                         // targetId matches full name
                         //catItem.getItemID().toLowerCase().concat(" ")
                           // .concat(catItem.getShortDescription().toLowerCase()).startsWith(targetId)) {
							

                        sb.append("<catItem>");
                        sb.append("<id>" + catItem.getItemID() + "</id>");
                        sb.append("<shortdescription>" + catItem.getShortDescription() + "</shortdescription>");
                        //sb.append("<longdescription>" + catItem.getLongDescription() + "</longdescription>");
                        sb.append("</catItem>");
                        productsAdded = true;
                    }
                }
            }

            if (productsAdded) {
                response.setContentType("text/xml");
                response.setHeader("Cache-Control", "no-cache");
                response.getWriter().write("<products>" + sb.toString() + "</products>");
            } else {
                //nothing to show
                response.setStatus(HttpServletResponse.SC_NO_CONTENT);
            }
        }
		
        if (action.equals("lookup")) {
			System.out.println("Am Here" +targetId);
            // put the target catItem in the request scope to display 
            if ((targetId != null) && products.containsKey(targetId)) {
				
                request.setAttribute("catItem", products.get(targetId));
				//response.getWriter().println("Reached Here");
                context.getRequestDispatcher("/SelectedProduct.jsp").forward(request, response);
            }
        }
    }
}
