<%@page import="java.util.*"%>
<!DOCTYPE html>
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
			String email=(String)session.getAttribute("email");
			dao.DbConnect db=new dao.DbConnect();
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
                    <a class="nav-link" href="profile.jsp">Profile</a>
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
	
<%
	String pname=request.getParameter("pname");
	if(pname==null){
		pname=(String)session.getAttribute("pname");
	}
	dao.DbConnect db=new dao.DbConnect();
        ArrayList<HashMap<String,Object>> allPlants=db.getPlantsLikeName(pname);
%>

<%
	if(allPlants.isEmpty()){
%>
		<p> No plant found! </p>
<%	
	}
	for(HashMap plant : allPlants){
%>
	<div style="width:max-content;border:1px solid gray;padding:20px; margin:10px;">
		<a href='viewPlant.jsp?plant_id=<%=plant.get("plant_id")%>' style="color:black; text-decoration:none;">
			<img src='GetPhoto?plant_id=<%=plant.get("plant_id")%>&photo_no=1' height="130px" />
			<h3><b><%=plant.get("name")%></b></h3>
			<p><b><%=plant.get("category")%></b></p>
		</a>
<%
			int quantity=(Integer)plant.get("quantity");
			if(quantity>0){
				session.setAttribute("pname", pname);
%>
				<p style="color:blue;"><b>&#x20B9; <%=plant.get("price")%>/-</b></p>
				<form action="AddToCart" method="post">
					<input type="hidden" name="plant_id" value="<%=plant.get("plant_id")%>" />
					<button type="submit">Add To Cart</button>
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
                  <a href="index.html"><i class="fa fa-arrow-right"></i> HOME</a>
                </li>
                <li>
                  <a href="contact.html"><i class="fa fa-arrow-right"></i> CONTACT</a>
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
            <p>PlantO &copy; 2021 , Design &amp; Develop by <a href="https://www.incapp.in" target="_blank">Incapp</a> </p>
            <figure>
              <a href="https://www.facebook.com/incapp" target="_blank"><i class="fab fa-facebook-f"></i></a>
              <a href="https://www.instagram.com/incapp,in" target="_blank"><i class="fab fa-instagram"></a></i></a>
              <a href="https://www.twitter.com/incapp" target="_blank"><i class="fab fa-twitter"></i></a>
            </figure>
          </footer>
        </section>
        <a id="mytopbtn"><i class="fas fa-chevron-circle-up display-4 text-danger"></i></a>
    	<!-- The Modal1 -->
        <div class="modal fade" id="myModal1">
          <div class="modal-dialog">
            <div class="modal-content">
            
              <!-- Modal Header -->
              <div class="modal-header">
                <h4 class="modal-title">Sign In</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
              </div>
              
              <!-- Modal body -->
              <div class="modal-body">
                <form action="UserSignIn" method="post">
                  <div class="form-group">
                    <label for="email">Email address:</label>
                    <input type="email" class="form-control" placeholder="Enter email" id="email" name="email" required>
                  </div>
                  <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" class="form-control" placeholder="Enter password" id="pwd" name="password" required>
                  </div>
                  <button type="submit" class="btn btn-primary">Login</button>
                </form>
                <a href='forgetPassword.jsp'>Forget Password</a>
              </div>
              
              <!-- Modal footer -->
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
              </div>
              
            </div>
          </div>
        </div>

        <!-- The Modal2 -->
        <div class="modal fade" id="myModal2">
          <div class="modal-dialog">
            <div class="modal-content">
            
              <!-- Modal Header -->
              <div class="modal-header">
                <h4 class="modal-title">Sign Up</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
              </div>
              
              <!-- Modal body -->
              <div class="modal-body">
                <form action="UserSignUp" method="post">
                  <div class="form-group">
                    <label for="email">Enter Name:</label>
                    <input type="text" class="form-control" placeholder="Enter Name" id="name" name="name" required>
                  </div>
                  <div class="form-group">
                    <label for="email">Email address:</label>
                    <input type="email" class="form-control" placeholder="Enter email" id="email" name="email" required>
                  </div>
                  <div class="form-group">
                    <label for="email">Email Phone:</label>
                    <input type="tel" maxlength="10" class="form-control" placeholder="Enter phone" id="phone" name="phone" required>
                  </div>
                  <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" class="form-control" placeholder="Enter password" id="pwd" name="password" required>
                  </div>
                  <button type="submit" class="btn btn-primary">Sign Up</button>
                </form>
              </div>
              
              <!-- Modal footer -->
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
              </div>
              
            </div>
          </div>
        </div>
        
        <!-- The Modal3 -->
        <div class="modal fade" id="myModal3">
          <div class="modal-dialog">
            <div class="modal-content">
            
              <!-- Modal Header -->
              <div class="modal-header">
                <h4 class="modal-title">Admin Login</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
              </div>
              
              <!-- Modal body -->
              <div class="modal-body">
                <form action="AdminLogin" method="post">
                  <div class="form-group">
                    <label for="email">Admin ID:</label>
                    <input type="text" class="form-control" placeholder="Enter email" id="email" name="aid" required>
                  </div>
                  <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" class="form-control" placeholder="Enter password" id="pwd" name="password" required>
                  </div>
                  <button type="submit" class="btn btn-primary">Login</button>
                </form>
              </div>
              
              <!-- Modal footer -->
              <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
              </div>
              
            </div>
          </div>
        </div>
    </body>
    <script>
      $(window).scroll(function() {
          if ($(this).scrollTop()) {
              $('#mytopbtn').fadeIn();
          } else {
              $('#mytopbtn').fadeOut();
          }
      });
      //script for scroll to top
      $("#mytopbtn").click(function () {
        $("html, body").animate({scrollTop: 0}, 1000);
      });
    </script>
</html>