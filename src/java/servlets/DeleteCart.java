package servlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet("/DeleteCart")
public class DeleteCart extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if(request.getSession().getAttribute("name") !=  null){
        
        Integer plant_id = Integer.parseInt(request.getParameter("plant_id"));
        String email = request.getParameter("email");
        
        try{
            dao.DbConnect db = new dao.DbConnect();
            
            boolean result = db.deleteFromCart(email, plant_id);
            if(result){
                HttpSession session = request.getSession();
                session.setAttribute("msg", "Plant Removed From Cart ! ");
                response.sendRedirect("cart.jsp");
            }else{
                HttpSession session = request.getSession();
                session.setAttribute("msg", "Unable To Remove Plant From Cart ! ");
                response.sendRedirect("cart.jsp");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        }
    }
}
