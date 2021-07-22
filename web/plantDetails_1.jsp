<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("adminName")!=null){
        String admin_name = (String)session.getAttribute("adminName");
         response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);
%>
<!DOCTYPE html>
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
	Welcome: <b> <%=admin_name%> | </b> <a href='adminHome.jsp'>HOME</a> | <a href='Logout'>Logout</a> | <a href='allPlants.jsp'>View All Plants</a> | <a href="cart.jsp">View Cart</a>
        
	<hr/>
        <%
          int plant_id = Integer.parseInt(request.getParameter("plant_id"));
          dao.DbConnect db = new dao.DbConnect();
          HashMap<String,Object> map = db.getPlantById(plant_id);
          if(map!=null){
        %>
          <br>
          Name : <%= map.get("name") %><br>
          Id : <%= map.get("plant_id") %><br>
          Price : <%= map.get("price") %><br>
          Height : <%= map.get("height") %><br>
          Category : <%= map.get("category") %><br>
          Quantity : <%= map.get("quantity") %><br>
          Description : <%= map.get("description") %><br><br>
          
          <img src="GetPhoto?plant_id=<%=map.get("plant_id")%>&photo_no=1" height="200px" alt=""/>
          <img src="GetPhoto?plant_id=<%=map.get("plant_id")%>&photo_no=2" height="200px" alt=""/>
          <img src="GetPhoto?plant_id=<%=map.get("plant_id")%>&photo_no=3" height="200px" alt=""/>
          <br><br>
          <form action="DeletePlant">
              <input type="hidden" name="plant_id" value="<%=map.get("plant_id")%>" /> 
              <input type="submit" value="Delete Plant" /> 
          </form>
              <br>
          <form action="editPlantDetails.jsp">
              <input type="hidden" name="plant_id" value="<%=map.get("plant_id")%>" /> 
              <input type="submit" value="Update Plant" /> 
          </form>
        <%
            }
        %>
        
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
    }else{
        session.setAttribute("msg", "Warning ! Plzz Login First .. ");
        response.sendRedirect("adminLogin.jsp");
    }
%>