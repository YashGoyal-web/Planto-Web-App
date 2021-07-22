package servlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class AddPlant extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if(request.getSession().getAttribute("adminName") !=  null){
          
        String name = request.getParameter("name");
        
        Integer price = Integer.parseInt(request.getParameter("price"));
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        Double height = Double.parseDouble(request.getParameter("height"));
        Integer quantity = Integer.parseInt(request.getParameter("quantity"));
        Part p1 = request.getPart("photo");
        InputStream photo=p1.getInputStream();
        
        Part p2 = request.getPart("photo1");
        InputStream photo1=p2.getInputStream();
        Part p3 = request.getPart("photo2");
        InputStream photo2=p3.getInputStream();
        
        HashMap<String,Object> map = new HashMap<String,Object>();
        
        map.put("name", name);
        map.put("price", price);
        map.put("description", description);
        map.put("category", category);
        map.put("height", height);
        map.put("quantity", quantity);
        map.put("photo", photo);
        map.put("photo1", photo1);
        map.put("photo2", photo2);
        
        try {
            dao.DbConnect db = new dao.DbConnect();
            boolean result = db.addPlant(map);
            
            if(result){
                HttpSession session = request.getSession();
                session.setAttribute("msg", "Plant Added Successfully !");
                response.sendRedirect("adminHome.jsp");
            }else{
                HttpSession session = request.getSession();
                session.setAttribute("msg", "Plant Already Exists !");
                response.sendRedirect("adminHome.jsp");
            }
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        }else{
            HttpSession session = request.getSession();
            session.setAttribute("msg", "Please Login First !");
            response.sendRedirect("adminLogin.jsp");
        }
        
    }
   
}
