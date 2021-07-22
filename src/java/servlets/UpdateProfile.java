package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet {

    protected void service(HttpServletRequest request , HttpServletResponse response)
            throws ServletException, IOException {
      if(request.getSession().getAttribute("name") != null){    
          
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        
            try{
                dao.DbConnect db = new dao.DbConnect();
                String res = db.updateProfile(name, phone, email);
                HttpSession session=request.getSession();
                session.setAttribute("msg",res);
                session.setAttribute("name",name);
                response.sendRedirect("updateProfile.jsp");
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
