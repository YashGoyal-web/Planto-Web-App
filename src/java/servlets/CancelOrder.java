package servlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet("/CancelOrder")
public class CancelOrder extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if(request.getSession().getAttribute("name") !=  null){
        
        try{
            int order_id = Integer.parseInt(request.getParameter("order_id"));
            dao.DbConnect db = new dao.DbConnect();
            ArrayList<HashMap<String,Object>> allOrderItems = db.getOrderItem(order_id);
            
            for(HashMap<String,Object> orderItem : allOrderItems){
                db.deleteOrder(order_id,(String)orderItem.get("name"));
            }
            
            HttpSession session = request.getSession();
            session.setAttribute("msg", "Order Cancelled Successfully");
            response.sendRedirect("orders.jsp");
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        }
    }
}
