<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    dao.DbConnect db = new dao.DbConnect();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Plant</title>
    </head>
    <body>
        <h1>Planto App</h1>
	<hr/>
	<form action="plantSearch.jsp" method="post">
		<label>Search Plant: </label>
		<input type="search" name="name" required />
		<button type="submit">Search</button>
	</form>
	<%
            String name = request.getParameter("name");
            if(name==null){
                name = (String)session.getAttribute("searchName");
            }
                    if(session.getAttribute("name")!=null){
                        String username = (String)session.getAttribute("name");
                        String email = (String)session.getAttribute("email");
                %>
                Welcome <b><%= username %></b> | <a href="Logout">LOGOUT</a> &nbsp;&nbsp;  Cart:<%= db.getCartCount(email) %> | <a href="cart.jsp">View Cart</a> | <a href="index.jsp">HOME</a> | <a href="orders.jsp">My Orders</a> <br/>    
                <%
                    }else{
                %>
                <a href="signIn.jsp">SIGN IN</a> | <a href="signUp.jsp">SIGN UP</a> | <a href="adminLogin.jsp">admin login</a> &nbsp;&nbsp;<br/>
                <%
                    }
                %>
	<hr/>
	
        <%
            if(session.getAttribute("msg")!=null){
        %>
        <h3 style="background-color: greenyellow; width: max-content"><%= session.getAttribute("msg") %></h3>
        <%
            session.setAttribute("msg", null);
            }
        %>
        <%
            ArrayList<HashMap<String,Object>> plants = db.getPlantsLikeName(name);
            if(plants.isEmpty()){
        %>
        <h3 style="color:red">No Product Found !</h3>
        <%        
            }
            for(HashMap<String,Object> plant : plants){
        %>
        <div style="width:max-content;border:1px solid gray;padding:20px; float:left;margin:10px;">
		<a href='viewPlants.jsp?plant_id=<%=plant.get("plant_id")%>' style="color:black; text-decoration:none;">
			<img src='GetPhoto?plant_id=<%=plant.get("plant_id")%>&photo_no=1' height="130px" />
			<h3><b><%=plant.get("name")%></b></h3>
			<p><b><%=plant.get("category")%></b></p>
		</a>
		<%
			int quantity=Integer.parseInt(String.valueOf(plant.get("quantity")));
			if(quantity>0){
		%>
				<p style="color:blue;"><b>&#x20B9; <%=plant.get("price")%>/-</b></p>
                                <div style="float:left; margin-right:7px " >
                <%
                    session.setAttribute("searchName",name);
                %>
                                    <form action="AddToCart" method="post" >
					<input type="hidden" name="plant_id" value="<%=plant.get("plant_id")%>" />
					<input type="hidden" name="name" value="<%=session.getAttribute("searchName")%>" />
					<button type="submit" >Add To Cart</button>
                                    </form></div>
                                <form action="viewPlants.jsp" method="post">
					<input type="hidden" name="plant_id" value="<%=plant.get("plant_id")%>" />
					<button type="submit">View</button>
				</form>        
		<%		
			}else{
				%>
				<p style="color:red;"><b>OUT OF STOCK!</b></p>
		<%
			}
		%>
	</div>
        <%
            }
        %>
    </body>
</html>
