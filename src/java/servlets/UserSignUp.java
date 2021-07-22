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

/**
 *
 * @author test
 */
public class UserSignUp extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        
        String name = (String) request.getParameter("name");
        String phone = (String) request.getParameter("phone");
        String email = (String) request.getParameter("email");
        String password = (String) request.getParameter("password");
        HashMap<String,String> user = new HashMap<String,String>();
        user.put("name", name);
        user.put("phone", phone);
        user.put("email", email);
        user.put("password", password);
        try{
            dao.DbConnect db = new dao.DbConnect();
            boolean result = db.createAccount(user);
            if(result){
                HttpSession session  = request.getSession();
                session.setAttribute("email",email);
                session.setAttribute("name",name);
                response.sendRedirect("index.jsp");
            }else{
                HttpSession session = request.getSession();
                session.setAttribute("msg", "User email Already Exist!");
                response.sendRedirect("index.jsp");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }

}
