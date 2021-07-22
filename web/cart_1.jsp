<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(session.getAttribute("name")!=null){
        
        String email = (String)session.getAttribute("email");
            dao.DbConnect db = new dao.DbConnect();
            ArrayList<HashMap<String,Object>> plants = db.getCartByEmail(email);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 style="color:green"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PLANTO - MAKE YOUR HOME NURSERY</b></h1>
        <hr/>
        <form action="plantSearch.jsp">
            <label>Search Plant : &nbsp;</label>
            <input type="search" name="name"/>&nbsp;&nbsp;&nbsp;
            <button type="submit">Search</button>
        </form>
        <br>
        Welcome : <b><%= session.getAttribute("name")%></b> | <a href="Logout">Logout</a> | cart : <%= db.getCartCount(email) %> | <a href="index.jsp">HOME</a> | <a href="orders.jsp">My Orders</a>  <br><br>

        <form action="placeOrder.jsp">
            <input type="submit" value="Place Order"/>
        </form>
        <hr/>
        <h2 style="background-color:background;color: white" align="center" >Cart</h2>
        <hr/>
        
        <%
            if(session.getAttribute("msg")!=null){
                
        %>
        <h3 style="background-color:greenyellow" align="center" ><%= session.getAttribute("msg") %></h3>
        <hr/>
        <%
            session.setAttribute("msg",null);
            }
        
            if(plants.isEmpty()){
        %>  
        <h3 style="color:red">No Plants In Cart !!</h3>
        <%
            }

            for(HashMap<String,Object> map : plants){
            HashMap<String,Object> plant = db.getPlantById((Integer)map.get("plant_id"));
            int quantity = db.getQuantityOfPlantInCart((Integer)plant.get("plant_id"), email);
        %>
            <div style="border:1px solid gray;padding:20px;margin:10px;background: lightcyan">
		<a href='viewPlants.jsp?plant_id=<%=plant.get("plant_id")%>' style="color:black; text-decoration:none;">
                         
			<img src='GetPhoto?plant_id=<%=plant.get("plant_id")%>&photo_no=1' height="130px" />
			<h3><b><%=plant.get("name")%></b></h3>
			<p>Category : <b><%=plant.get("category")%></b></p>
			<p>Price : <b><%=plant.get("price")%>/-</b></p>
                        </a>
                        <form action="Updatecart">
                            <label>Quantity : </label>
                            <input type="number" max="10" min="1" name="quantity" value="<%=quantity%>" required/>
                            <input type="hidden" name="plant_id" value="<%=plant.get("plant_id")%>"/>
                            <input type="hidden" name="email" value="<%=email%>"/>
                            <input type="submit" value="update"/><br><br>
                        
                            </form>
                               <form action="DeleteCart" >
                                <input type="hidden" name="plant_id" value="<%= plant.get("plant_id") %>"/>
                                <input type="hidden" name="email" value="<%= email %>"/>
                                <input type="submit" value="Remove From Cart"/>
                                </form>
            </div>
        <%
            }
        %>
    </body>
</html>
<%
    }else{
        session.setAttribute("msg", "Warning ! Plzz Login First .. ");
        response.sendRedirect("signIn.jsp");
    }
%>