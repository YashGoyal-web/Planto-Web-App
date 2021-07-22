package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetOrderItemPhoto")
public class GetOrderItemPhoto extends HttpServlet {

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int order_id=Integer.parseInt(request.getParameter("order_id"));
		String name=request.getParameter("name");
                
                System.out.println(order_id);
                System.out.println(name);
                
		try {
			dao.DbConnect db=new dao.DbConnect();
			byte[] photo=db.getOrderItemPhoto(name, order_id);
			response.getOutputStream().write(photo);
		} catch (Exception e) {
			e.printStackTrace();
		}   
    }
}
