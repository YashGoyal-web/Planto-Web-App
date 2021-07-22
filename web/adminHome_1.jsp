<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(session.getAttribute("adminName")!=null){
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
        Welcome : <b><%= session.getAttribute("adminName")%></b> | <a href="Logout">Logout</a> | <a href="allPlants.jsp">View All Product</a> | <a href="viewOrders.jsp?status=Pending">Pending Orders</a> | <a href="viewOrders.jsp?status=Shipped">Shipped Orders</a> | | <a href="viewOrders.jsp?status=Delivered">Delivered Orders</a> | | <a href="viewOrders.jsp?status=Canceled">Canceled Orders</a>
        <hr/>
        <%
            if(session.getAttribute("msg") != null){
        %>
        <h3><%=session.getAttribute("msg")%></h3> 
        <%
            session.setAttribute("msg",null);
            }
        %>
        
        <h1>Add Product</h1>
        <form action="AddPlant" method="post" enctype="multipart/form-data" >
            <label>Plant Name: </label>
		<input type="text" name="name" required /><br/><br/>
		<label>Plant Price: </label>
		<input type="number" name="price" required /><br/><br/>
		<label>Plant Description: </label>
		<textarea rows='3' name="description" required ></textarea><br/><br/>
		<label>Plant Category: </label>
		<select name='category'>
			<option>Indoor</option>
			<option>Outdoor</option>
			<option>Indoor-Outdoor</option>
		</select><br/><br/>
		<label>Plant Height: </label>
		<input type="text" name="height" required /><br/><br/>
		<label>Plant Quantity: </label>
		<input type="number" name="quantity" required /><br/><br/>
		<label>Plant Photo: </label>
		<input type="file" name="photo" required /><br/><br/>
		<label>Plant Photo: </label>
		<input type="file" name="photo1" required /><br/><br/>
		<label>Plant Photo: </label>
		<input type="file" name="photo2" required /><br/><br/>
		<button type="submit">Add</button>
        </form>        
    </body>
</html>
<%
    }else{
        session.setAttribute("msg", "Warning ! Plzz Login First .. ");
        response.sendRedirect("adminLogin.jsp");
    }
%
>