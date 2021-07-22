/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class DeletePlant extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getSession(false).getAttribute("adminName")!=null){
        try{
            HttpSession session = request.getSession();
            HashMap map = (HashMap)session.getAttribute("map");
            int plant_id = Integer.parseInt(request.getParameter("plant_id"));
            dao.DbConnect db = new dao.DbConnect();
            db.deletePlant(plant_id);
            response.sendRedirect("allPlants.jsp");
        }catch(Exception e){
            
        }
        
    }else{
            request.getSession(false).setAttribute("msg", "Warning ! Plzz Login First .. ");
        response.sendRedirect("adminLogin.jsp");
        }
   
   }
}