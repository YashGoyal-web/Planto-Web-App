package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/OrderStatusUpdate")
public class OrderStatusUpdate extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getSession(false).getAttribute("adminName")!=null){
        try{
            String status = request.getParameter("status");
            String pageName = request.getParameter("pageName");
            int order_id = Integer.parseInt(request.getParameter("order_id"));
            dao.DbConnect db = new dao.DbConnect();
            db.updateOrderStatus(order_id,status);
            HttpSession session = request.getSession();
            session.setAttribute("msg","Orders Updated Successfully");
            response.sendRedirect("viewOrders.jsp?status="+pageName);
        }catch(Exception e){
            e.printStackTrace();
        }
        
    }else{
            request.getSession(false).setAttribute("msg", "Warning ! Plzz Login First .. ");
            response.sendRedirect("adminLogin.jsp");
        }
   
   }
}