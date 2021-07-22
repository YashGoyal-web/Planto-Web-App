<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  int plant_id = Integer.parseInt(request.getParameter("plant_id"));
  dao.DbConnect db = new dao.DbConnect();
  HashMap<String,Object> plant = db.getPlantById(plant_id);
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <h1>Planto App</h1>
	<hr/>
	<form action="plantSearch.jsp" method="post">
		<label>Search Plant: </label>
		<input type="search" name="name" required />
		<button type="submit">Search</button>
	</form>
            <%
                    if(session.getAttribute("name")!=null){    
                        String username = (String)session.getAttribute("name");
                        String email = (String)session.getAttribute("email");
                %>
                Welcome <b><%= username %></b> | <a href="Logout">LOGOUT</a>  | <a href="index.jsp">HOME</a> &nbsp;&nbsp;  Cart:<%= db.getCartCount(email) %> | <a href="cart.jsp">View Cart</a> | <a href="orders.jsp">My Orders</a>  <br/>    
                <%
                    }else{
                %>
                <a href="signIn.jsp">SIGN IN</a> | <a href="signUp.jsp">SIGN UP</a> | <a href="index.jsp">HOME</a> &nbsp;&nbsp;<br/>
                <%
                    }    
                %>
	<hr/>
        
    <body>
        Name : <%= plant.get("name") %><br>
        Price : <%= plant.get("price") %><br>
        Category : <%= plant.get("category") %><br>
        Height : <%= plant.get("height") %><br>
        Description : <%= plant.get("description") %><br><br>
        <img src='GetPhoto?plant_id=<%=plant.get("plant_id")%>&photo_no=1' height="130px" /><br>
        <img src='GetPhoto?plant_id=<%=plant.get("plant_id")%>&photo_no=2' height="130px" /><br>
        <img src='GetPhoto?plant_id=<%=plant.get("plant_id")%>&photo_no=3' height="130px" /><br>
        
        <div style="float:left; margin-right:7px " >
                                    <form action="AddToCart" method="post" >
					<input type="hidden" name="plant_id" value="<%=plant.get("plant_id")%>" />
                                        <input type="hidden" name="name" value="<%=session.getAttribute("searchName")%>" />
					<button type="submit" >Add To Cart</button>
                                    </form></div>
        
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
