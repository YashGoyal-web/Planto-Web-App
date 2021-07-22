<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(session.getAttribute("name")!=null){
        String email = (String)session.getAttribute("email");
            dao.DbConnect db = new dao.DbConnect();
            ArrayList<HashMap<String,Object>> plants = db.getCartByEmail(email);
            if(plants.isEmpty()){
                session.setAttribute("msg", "Cart is Empty.So can't place Order");
                response.sendRedirect("cart.jsp");
            }
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
        Welcome : <b><%= session.getAttribute("name")%></b> | <a href="Logout">Logout</a> | cart : <%= db.getCartCount(email) %> | <a href="index.jsp">HOME</a> | <a href="cart.jsp">View Cart</a><br><br>
        <hr/>
        <h2 style="background-color:black;color: white" align="center" >Confirm Order</h2>
        <hr/>
        
        <%
            int totalPrice=0;
            if(session.getAttribute("msg")!=null){
        %>
        <h3 style="background-color:greenyellow" align="center" ><%= session.getAttribute("msg") %></h3>
        <hr/>
        <%
            session.setAttribute("msg",null);
            }
            for(HashMap<String,Object> map : plants){
            HashMap<String,Object> plant = db.getPlantById((Integer)map.get("plant_id"));
            int quantity = db.getQuantityOfPlantInCart((Integer)plant.get("plant_id"), email);
            totalPrice += quantity*(Integer)plant.get("price");
        %>
            <div style="border:1px solid gray;padding:20px;margin:10px;">
		<a href='viewPlants.jsp?plant_id=<%=plant.get("plant_id")%>' style="color:black; text-decoration:none;">
                         
			<img src='GetPhoto?plant_id=<%=plant.get("plant_id")%>&photo_no=1' height="130px" />
			<h3><b><%=plant.get("name")%></b></h3>
			<p>Category : <b><%=plant.get("category")%></b></p>
			<p>Price : <b><%=plant.get("price")%>/-</b></p>
                        <p>Quantity : <b><%= quantity %></b></p>
                        </a>
            </div>
        <%
            }
        %>
        <br/><br/>
        
        <div>
            <hr>
            <h3><b>Total Price : <%= totalPrice %></b></h3>
            <hr>
            <br>
            <form action="ConfirmOrder">
            <%
                ArrayList<String> addresses = db.getAdress(email);
                if(!addresses.isEmpty()){
            %>
            Select Your Previous Adress : <br>
            <%
                }
                for(String address : addresses){
            %>
            
                <input type="radio" name="address" value="<%=address %>" required/>
                <%=address%>
            
            <%
                }
            %>
            <br>
            <input type="radio" name="address" value="new" required/>
            <textarea rows="3" name="new_address" placeholder="Enter New Address"></textarea>
            <br><br>
                <input type="submit" value="Confirm Order" />
            </form>
        </div>
            
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
        response.sendRedirect("signIn.jsp");
    }
%>