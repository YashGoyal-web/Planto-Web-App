package servlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/AddToCart")
@MultipartConfig
public class AddToCart extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if(request.getSession().getAttribute("name") !=  null){
          
        int plant_id = Integer.parseInt(request.getParameter("plant_id"));
        String email = (String)request.getSession().getAttribute("email");
        
        try {
            dao.DbConnect db = new dao.DbConnect();
            boolean result = db.addToCart(email,plant_id);
            if(result){
                HttpSession session = request.getSession();
                session.setAttribute("msg", "Plant Added to cart Successfully !");
                response.sendRedirect("plantSearch.jsp");
            }else{
                HttpSession session = request.getSession();
                session.setAttribute("msg", "Unable to add to cart!");
                response.sendRedirect("plantSearch.jsp");
            }
            
        } catch (Exception ex) {
            HttpSession session = request.getSession();
            session.setAttribute("msg", ex.getMessage());
            response.sendRedirect("cart.jsp");
        }
        }else{
            HttpSession session = request.getSession();
            session.setAttribute("msg", "Please Login First !");
            response.sendRedirect("index.jsp");
        }
        
    }
   
}
