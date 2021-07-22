package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminLogin extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     
        String id = request.getParameter("id");
        String pass = request.getParameter("pass");
        
        try{
            dao.DbConnect db = new dao.DbConnect();
            String result = db.getAdminLogin(id, pass);
            if(result != null){
                HttpSession session = request.getSession();
                session.setAttribute("adminName", result);
                response.sendRedirect("adminHome.jsp");
            }else{
                HttpSession session = request.getSession();
                session.setAttribute("msg", "Warning ! Wrong Id or Pass !!");
                response.sendRedirect("index.jsp");
            }
        }catch(Exception e){
            
        }
    }

}
