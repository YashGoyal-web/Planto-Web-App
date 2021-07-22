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
@WebServlet("/UpdatePlant")
public class UpdatePlant extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if(request.getSession().getAttribute("adminName") !=  null){
          
        String name = request.getParameter("name");
        
        Integer plant_id = Integer.parseInt(request.getParameter("plant_id"));
        Integer price = Integer.parseInt(request.getParameter("price"));
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        Double height = Double.parseDouble(request.getParameter("height"));
        Integer quantity = Integer.parseInt(request.getParameter("quantity"));
        
        Part p1 = request.getPart("photo");
        Part p2 = request.getPart("photo1");
        Part p3 = request.getPart("photo2");
        
        HashMap<String,Object> map = new HashMap<String,Object>();
        
        map.put("plant_id", plant_id);
        map.put("name", name);
        map.put("price", price);
        map.put("description", description);
        map.put("category", category);
        map.put("height", height);
        map.put("quantity", quantity);
        if(p1.getSize()>0)
            map.put("photo", p1.getInputStream());
        if(p2.getSize()>0)
            map.put("photo1", p2.getInputStream());
        if(p3.getSize()>0)
            map.put("photo2", p3.getInputStream());
        
        try{
            dao.DbConnect db = new dao.DbConnect();
            db.updatePlant(map);
            request.setAttribute("plant_id",plant_id);
            HttpSession session = request.getSession();
            session.setAttribute("msg", "Plant Updated Sucessfully ! ");
            RequestDispatcher rd = request.getRequestDispatcher("editPlantDetails.jsp");
            rd.forward(request, response);
        }catch(Exception e){
            e.printStackTrace();
        }
        
        }
    }
}
