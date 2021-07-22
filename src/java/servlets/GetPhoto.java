/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetPhoto extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int plant_id = Integer.parseInt(request.getParameter("plant_id"));
        int photo_no = Integer.parseInt(request.getParameter("photo_no"));
        
        try{
        dao.DbConnect db = new dao.DbConnect();
        byte[] image = db.getPhoto(plant_id,photo_no);
        response.getOutputStream().write(image);
        }catch(Exception e){
        }
        
    }
  
}
