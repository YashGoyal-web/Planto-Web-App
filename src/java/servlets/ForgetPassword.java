package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@WebServlet("/ForgetPassword")
public class ForgetPassword extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String email = (String) request.getParameter("email");
        
        try{
            dao.DbConnect db = new dao.DbConnect();
            String password = db.getPassword(email);
            if(password!=null){
                
            //mail code
		
			final String SEmail="yash30goyal.yg@gmail.com";
	                final String SPass="1945yash";
	                final String REmail=email;
	                final String Sub="PlantO: Your Password is Here.";
	                final String Body="Your User ID : "+email+" <br> Password: "+password;
	                
	                Properties prop = new Properties();  
					prop.put("mail.smtp.host", "smtp.gmail.com");
					prop.put("mail.smtp.port", "587");
					prop.put("mail.smtp.auth", "true");
					prop.put("mail.smtp.starttls.enable", "true");
					
					Session ses = Session.getInstance(prop,  
				    new javax.mail.Authenticator() {  
				      protected PasswordAuthentication getPasswordAuthentication() {  
				    return new PasswordAuthentication(SEmail,SPass);  
				      }  
				    });
					
			    Message message=new MimeMessage(ses);
		            message.setFrom(new InternetAddress(SEmail));
		            message.setRecipients(Message.RecipientType.TO, 
		            		InternetAddress.parse(REmail));
		            message.setSubject(Sub);
		            message.setContent(Body,"text/html" );
		            
		            Transport.send(message);
					response.sendRedirect("forgetPassword.jsp");
					
		//mail code end
                
                HttpSession session = request.getSession();
                session.setAttribute("msg", "Password Sent to your registered mail Seccessfully ..");
                response.sendRedirect("index.jsp");
            }else{
                HttpSession session = request.getSession();
                session.setAttribute("msg","Email id is invalid !!");
                response.sendRedirect("forgetPassword.jsp");
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }

}
