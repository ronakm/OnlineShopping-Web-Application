import java.util.Date;
import java.util.Calendar;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.io.*;
import javax.servlet.*;
import java.util.Random;
import javax.servlet.http.*;
import java.util.*;
import mybean.UserBean;

/** Shows all the parameters sent to the servlet via either
 *  GET or POST. Specially marks parameters that have
 *  no values or multiple values.
 *  <P>
 *  Taken from Core Servlets and JavaServer Pages 2nd Edition
 *  from Prentice Hall and Sun Microsystems Press,
 *  http://www.coreservlets.com/.
 *  &copy; 2003 Marty Hall; may be freely used or adapted.
 */
@SuppressWarnings("unchecked")
public class ValidateServlet extends HttpServlet {
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {
	
	
	String mess="";
	String user_name=request.getParameter("user_name");
	if(user_name==null)
	user_name="";
	String password=request.getParameter("password");
	if(password==null)
	password="";
	 String filePath=request.getServletContext().getRealPath("Data/UserDetails.txt");
	 File file = new File(filePath);
	    response.setContentType("text/html");
	PrintWriter out = response.getWriter();
    String docType =
      "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 " +
      "Transitional//EN\">\n";
	out.println(docType +"<HTML>\n");
    
		if (file.exists()) {
			
		
	try
      {
         FileInputStream fileIn = new FileInputStream(filePath);
         ObjectInputStream srpin = new ObjectInputStream(fileIn);
         int size=0;
		 UserBean userbean=null;
		 
         while(fileIn.available()>0){
			userbean = (UserBean) srpin.readObject();
			if(userbean.getEmail().equals(user_name) && userbean.getPassword().equals(password))
			{
				//System.out.println("user_name: "+user_name+ " password: "+ password+" userbean.getEmail(): " +userbean.getEmail()+" userbean.getPassword());
				mess="SUCCESS";
				HttpSession session = request.getSession();
				session.setAttribute("usrbean", userbean);
				break;
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
         System.out.println("USer class not found");
         c.printStackTrace();
         return;
      }
	
		 if(mess.equals("SUCCESS")){
		
		response.sendRedirect( "/sports4hawks/index.jsp" );
		//out.println("<font color='RED'><h3>Login SuccessFully.... Click Below to Continue Shopping.. </h3></font>");
		//out.println("<a href= '/sports4hawks/index.jsp'> Contiue Shopping </a>");

		}
		else{
			//response.sendRedirect( "/sports4hawks/index.jsp?mess=FAIL" );
			out.println("<font color='RED'><h3>User not Found... Please Enter Correct Username and Password or Please Click here to Register </h3></font>");
			out.println("<a href= '/sports4hawks/signup.jsp'> Register for Sports4Hawks </a>");
		}
	
		

	}
	else{
		out.println("<font color='RED'><h3>User not Found... Please Enter Correct Username and Password or Please Click here to Register </h3></font>");
		out.println("<a href= '/sports4hawks/signup.jsp'> Register for Sports4Hawks </a>");
	}
	out.println("</BODY></HTML>");
  }

  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }
}
