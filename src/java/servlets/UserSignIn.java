package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserSignIn extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String email = (String) request.getParameter("email");
        String password = (String) request.getParameter("password");
        
        try{
            dao.DbConnect db = new dao.DbConnect();
            String name = db.getUserLogin(email, password);
            if(name!=null){
                HttpSession session = request.getSession();
                session.setAttribute("name",name);
                session.setAttribute("email",email);
                response.sendRedirect("index.jsp");
            }else{
                HttpSession session = request.getSession();
                session.setAttribute("msg","Wrong Entries!");
                response.sendRedirect("index.jsp");
            }
        }catch(Exception ex){
            ex.printStackTrace();
        }
    }

}
