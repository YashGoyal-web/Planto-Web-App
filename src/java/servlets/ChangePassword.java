package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {

    protected void service(HttpServletRequest request , HttpServletResponse response)
            throws ServletException, IOException {
        
        String opass = request.getParameter("opass");
        String npass = request.getParameter("npass");
        String cpass = request.getParameter("cpass");
        String email = request.getParameter("email");
        
        if(cpass.equals(npass)){
            try{
                dao.DbConnect db = new dao.DbConnect();
                String res = db.chagePassword(email,opass,npass);
                HttpSession session=request.getSession();
                session.setAttribute("msg",res);
                response.sendRedirect("updateProfile.jsp");
            }catch(Exception e){
                e.printStackTrace();
            }
        }else{
            HttpSession session=request.getSession();
            session.setAttribute("msg","New Password and OldPassword didn't mathched .. ");
            response.sendRedirect("updateProfile.jsp");
        }
        
    }
  
}
