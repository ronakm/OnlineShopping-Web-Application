import java.util.Date;
import java.util.Calendar;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.io.*;
import javax.servlet.*;
import java.util.Random;
import javax.servlet.http.*;
import java.util.*;

import javax.mail.BodyPart ;
import javax.mail.Message ; 
import javax.mail.* ;
import javax.mail.MessagingException ;
import javax.mail.Multipart;
import javax.mail.SendFailedException;
import javax.mail.Session ;
import javax.mail.Transport; 
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage ; 
import javax.mail.PasswordAuthentication;
import javax.mail.internet.MimeMultipart;  


public class SendEmail extends HttpServlet {
  public void doGet(HttpServletRequest request,
                    HttpServletResponse response)
      throws ServletException, IOException {
	
	
    final String userid=request.getParameter("email_id");
	final String password=request.getParameter("pass");
	String subject=request.getParameter("subject");
	String body=request.getParameter("body");
	String  firstname=request.getParameter("firstname");
	String  lastname=request.getParameter("lastname");
	

	
	
			String to = "sports4hawks@gmail.com";

          // Sender's email ID needs to be mentioned
          String from = userid;


          // Get system properties
          Properties properties = System.getProperties();

          properties.put("mail.smtp.starttls.enable", "true"); 
          properties.put("mail.smtp.host", "smtp.gmail.com");

          properties.put("mail.smtp.port", "587");
          properties.put("mail.smtp.auth", "true");
          Authenticator authenticator = new Authenticator () {
                public PasswordAuthentication getPasswordAuthentication(){
                    return new PasswordAuthentication(userid,password);
                }
            };

			
			
			
            Session session1 = Session.getInstance( properties , authenticator);  
          try{
             // Create a default MimeMessage object.
             
			 
			 
			 MimeMessage message = new MimeMessage(session1);

			 
			 
             // Set From: header field of the header.
             message.setFrom(new InternetAddress(from));

			 
			 
			 
             // Set To: header field of the header.
             message.addRecipient(Message.RecipientType.TO,
                                      new InternetAddress(to));

									  
			 
									  
             // Set Subject: header field
             message.setSubject(subject);

			body="First Name:"+firstname+"\n Last Name:"+lastname+"\n"+"Your Query:\n"+body;
			 
             // Now set the actual message
             message.setText(body);

			 
			 response.getWriter().println("Here");
			 
             // Send message
             Transport.send(message);
			 
			 response.getWriter().println("Success");
	
	}
	catch(Exception e)
	{}
	
	
	response.sendRedirect("/sports4hawks/contactus.jsp");
	
	
  }

  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
      throws ServletException, IOException {
    doGet(request, response);
  }
}