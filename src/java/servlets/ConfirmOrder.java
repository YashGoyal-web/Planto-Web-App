package servlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/ConfirmOrder")
@MultipartConfig
public class ConfirmOrder extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if(request.getSession().getAttribute("name") != null){
          
            try{
                dao.DbConnect db = new dao.DbConnect();
            String name = (String)request.getSession().getAttribute("name");
            String email = (String)request.getSession().getAttribute("email");
            String user_address = request.getParameter("address");
            System.out.println(user_address);
                    
                    
            if(user_address!=null && user_address.equals("new")){
                user_address = request.getParameter("new_address");
                db.setAdress(email,user_address);
            }
            
            String msg="";
            ArrayList<HashMap<String,Object>> cartPlants = db.getCartByEmail(email);
            
            for(HashMap<String,Object> cartPlant : cartPlants){
                int plant_id = (int)cartPlant.get("plant_id");
                ArrayList QtyName= db.getQtyNameFromPlants(plant_id);
                if((int)QtyName.get(1) == 0){
                    msg+=QtyName.get(0)+" is out of stock ! <br/>";
                }else if((int)QtyName.get(1) < (int)cartPlant.get("quantity")){
                    msg+="Only "+QtyName.get(1)+" piece remaining of "+QtyName.get(0)+"! <br/>";
                }
            }
             
            if(msg.equals("")){
                int order_id = db.setOrder(email, user_address);
                db.updateOrderList(cartPlants, order_id);
                db.UpdateQtyFromPlant(cartPlants);
                db.deleteFromCart(email);
                request.getSession().setAttribute("msg", "Your Order is Placed Successfully . Please confirm via mail .. ");
                try{            
        //mail code
		
			final String SEmail="yash30goyal.yg@gmail.com";
	                final String SPass="1945yash";            
	                final String REmail=email;
	                final String Sub="PlantO: By Yash Goel.";
	                final String Body="Contratulation "+name+" Your Order is Placed Successfully .<br> You can check Your Order Status by going into the Order Section in PlantO . <br> Thankss For Placing The Order .. ";
	                
	                Properties prop = new Properties();  
					prop.put("mail.smtp.host", "smtp.gmail.com");
					prop.put("mail.smtp.port", "587");
					prop.put("mail.smtp.auth", "true");
					prop.put("mail.smtp.starttls.enable", "true");
					
					Session ses = Session.getInstance(prop,new javax.mail.Authenticator() {  
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
                                        response.sendRedirect("orders.jsp");
                        }catch(Exception e){
                            e.printStackTrace();
                        }
                response.sendRedirect("orders.jsp");
            }else{
                HttpSession session = request.getSession();
                System.err.println(msg);
                session.setAttribute("msg",msg);
                response.sendRedirect("cart.jsp");
            }
            
            }catch(Exception e){
                e.printStackTrace();
            }
        
        }else{
            HttpSession session = request.getSession();
            session.setAttribute("msg", "Please Login First !");
            response.sendRedirect("signIn.jsp");
        }
        
    }
   
}
