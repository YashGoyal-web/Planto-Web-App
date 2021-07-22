<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(session.getAttribute("adminName")!=null){
       int plant_id = Integer.parseInt(request.getParameter("plant_id"));
       dao.DbConnect db = new dao.DbConnect();
       HashMap<String,Object> map = db.getPlantById(plant_id);
       if(map!=null){
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
        Welcome : <b><%= session.getAttribute("adminName")%></b> | <a href="Logout">Logout</a> | <a href="allPlants.jsp">View All Product</a>
        <hr/>
        <%
            if(session.getAttribute("msg") != null){
        %>
        <h3><%=session.getAttribute("msg")%></h3>
        <%
            session.setAttribute("msg",null);
            }
        %>
        
        <h1>Update Plant</h1>
        <form action="UpdatePlant" method="post" enctype="multipart/form-data" >
            <label>Plant Name: </label>
            <input type="hidden" value="<%=map.get("plant_id")%>" name="plant_id"/>
            <input type="text" name="name" value="<%= map.get("name") %>" placeholder="<%= map.get("name") %>" required /><br/><br/>
		<label>Plant Price: </label>
		<input type="number" name="price" value="<%= map.get("price") %>" placeholder="<%= map.get("price") %>"  required /><br/><br/>
		<label>Plant Description: </label>
		<textarea rows='3' name="description" placeholder="<%= map.get("description") %>" required ><%= map.get("description") %></textarea><br/><br/>
		<label>Plant Category: </label>
		<select name='category' >
			<option><%= map.get("category") %></option>
                        <option>Indoor</option>
			<option>Outdoor</option>
			<option>Indoor-Outdoor</option>
		</select><br/><br/>
		<label>Plant Height: </label>
		<input type="text" name="height" value="<%= map.get("height") %>" placeholder="<%= map.get("height")%>" required /><br/><br/>
		<label>Plant Quantity: </label>
		<input type="number" name="quantity" value="<%= map.get("quantity") %>" placeholder="<%= map.get("quantity")%>" required /><br/><br/>
		<label>Plant Photo: </label>
                <img src="GetPhoto?plant_id=<%=map.get("plant_id")%>&photo_no=1" height="200px" alt=""/>
		<input type="file" name="photo" /><br/><br/>
		<label>Plant Photo: </label>
                <img src="GetPhoto?plant_id=<%=map.get("plant_id")%>&photo_no=2" height="200px" alt=""/>
		<input type="file" name="photo1" /><br/><br/>
		<label>Plant Photo: </label>
                <img src="GetPhoto?plant_id=<%=map.get("plant_id")%>&photo_no=3" height="200px" alt=""/>
		<input type="file" name="photo2"/><br/><br/>
		<button type="submit">Update</button>
        </form>
                
                </section>
        <section class='container-fluid mt-5 bg-success p-5'>
          <div class="row container text-white">
            <div class="col-md-4 ">
              <h2>PlantO</h2>
              <p>
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
                Voluptatibus illo ad quo sunt maiores, sint nostrum omnis eaque cumque dolorum.
              </p>
            </div>
            <div class="col-md-4 ">
              <h2>PlantO</h2>
              <ul class="c-footerlink">
                <li>
                  <a href="index.jsp"><i class="fa fa-arrow-right"></i> HOME</a>
                </li>
                <li>
                  <a href="contact.jsp"><i class="fa fa-arrow-right"></i> CONTACT</a>
                </li>
              </ul>
            </div>
            <div class="col-md-4 ">
              <h2>Location</h2>
              <p>
                <i class="fa fa-map-marker"></i>
                <a class="c-map" href="https://goo.gl/maps/RDdSZswT4UvLwCjRA" target="_blank"> <b>Go To MAP</b> </a> 
                NSG Society, Greater Noida, Uttar Pradesh 201310
              </p>
            </div>
          </div>
          <footer>
            <p>PlantO &copy; 2021 , Design &amp; Develop by <a href="https://www.incapp.in" target="_blank">Yash Goyal</a> </p>
            <figure>
              <a href="https://www.facebook.com/incapp" target="_blank"><i class="fab fa-facebook-f"></i></a>
              <a href="https://www.instagram.com/incapp,in" target="_blank"><i class="fab fa-instagram"></a></i></a>
              <a href="https://www.twitter.com/incapp" target="_blank"><i class="fab fa-twitter"></i></a>
            </figure>
          </footer>
        </section>
        <a id="mytopbtn"><i class="fas fa-chevron-circle-up display-4 text-danger"></i></a>
                
    </body>
    
    
</html>
<%
    }
   }else{
        session.setAttribute("msg", "Warning ! Plzz Login First .. ");
        response.sendRedirect("adminLogin.jsp");
    }
%>