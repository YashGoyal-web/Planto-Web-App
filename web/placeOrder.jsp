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
        <title>PlantO</title>
        <link rel="icon" href="images/planto-icon.ico"/>

        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
        
        <!-- fontawesome -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" >
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <!-- fontawesome END -->

        <!-- Lightbox CSS & Script -->
        <script src="lightbox/ekko-lightbox.js"></script>
        <link rel="stylesheet" href="lightbox/ekko-lightbox.css"/>


        <!-- custom css-->
        <link rel="stylesheet" href="custom/custom.css"/>
        <!-- custom css END-->

        <meta name="author" content="Rahul Chauhan"/>
        <meta name="description" content="This is a plant selling website"/>
        <meta name="keywords" content="best plant in noida,best nursery center in noida"/>
    </head>
    <body>
        
        <nav class="navbar navbar-expand-sm sticky-top bg-light">
            <a class="navbar-brand" href="index.jsp"><img src='images/planto-logo.png' width="25px"/><span class="c-logo">PlantO</span></a>
            <button class="navbar-toggler bg-success" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon "><i class="fas fa-sort-down text-white"></i></span>
            </button>
            <div class="navbar-collapse" id="collapsibleNavbar">
                <form action="plantSearch.jsp" method="post" class="form-inline mx-3">
                    <div class="form-group">
                        <input type="text" name="pname" class="form-control" placeholder="search plant" required>
                        <button type="submit" class="form-control btn btn-primary"><i class="fas fa-search"></i></button>
                    </div>
                </form>
                <ul class="navbar-nav mx-auto">
                  <li class="nav-item">
                    <a class="nav-link" href="index.jsp">HOME</a>
                  </li>
    <%
		String name=(String)session.getAttribute("name");
		if(name==null){
	%>
                  <li class="nav-item">
                    <a class="nav-link" data-toggle="modal" data-target="#myModal1" href="">SignIn</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" data-toggle="modal" data-target="#myModal2" href="">SignUp</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" data-toggle="modal" data-target="#myModal3" href="">Admin</a>
                  </li>
    <%		
		}else{
			int count=db.getCartCount(email);
	%>            
				  <li class="nav-item">
                    <label class="nav-link">Welcome: <b><%=name %></b> | <big> Cart: <b> <%=count %> </b> </big> </label>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="Logout">Logout</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="cart.jsp">Cart</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="updateProfile.jsp">Profile</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="orders.jsp">Orders</a>
                  </li>
    <%		
		}
	%>             
                  <li class="nav-item">
                    <a class="nav-link" href="contact.jsp">CONTACT</a>
                  </li>    
                </ul>
                
<!--                 <div> -->
<!--                     <a class="text-success" href="tel:+23-345-67890"> -->
<!--                         <h3><i class="fas fa-mobile-alt"></i> +23-563-5688</h3> -->
<!--                     </a> -->
<!--                 </div> -->
              </div>
        </nav>
    <%
		String msg=(String)session.getAttribute("msg");
		if(msg!=null){
	%>
			<p class="text-danger text-center"> <%=msg %> </p>
	<%		
			session.setAttribute("msg",null);
		}
	%>
        
        
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