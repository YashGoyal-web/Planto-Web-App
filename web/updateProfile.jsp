<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(session.getAttribute("name")!=null){
       dao.DbConnect db = new dao.DbConnect();
       String phone = db.getPhoneNum((String)session.getAttribute("email"));
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
    
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src='https://code.jquery.com/jquery-3.5.1.js'></script>
<script>
    $(document).ready(function(){
        $("#msg").text("");
        $("#confirmpassword").blur(function(){
            var p1=$("#newpassword").val();
            var p2=$("#confirmpassword").val();
            if(p1!=p2){
                $("#msg").text("password does not match");
                $("#msg").css("color","red");
            }else{
                $("#msg").text("password matched");
                $("#msg").css("color","green");
            }
        });
    });
</script>



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
        
        <h1>Update Plant</h1>
        <form action="UpdateProfile">
            <label>Your Name : </label>
            <input type="text" name='name' value="<%= session.getAttribute("name") %>" /><br>
            <label>Your Contact : </label>
            <input type="text" name='phone' value="<%= phone %>"/><br>
            <input type="hidden" name="email" value='<%= session.getAttribute("email") %>'/>
            <input type="submit" value="Update" />
        </form>
            <br><hr><br>
            <h1>Change Password</h1>
        <form action="ChangePassword">
            <label>Old Password</label>
            <input type="password" name='opass' id="oldpassword" required/><br>
            <label>New Password: </label>
            <input type="password" name='npass' id='newpassword' required/><br>
            <label>Confirm Password: </label>
            <input type="password" name='cpass' id='confirmpassword' required/><br>
            <input type="hidden" name="email"  value='<%= session.getAttribute("email") %>'/> <label id="msg"></label>
            <input type="submit" value="Update" />
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
   }else{
        session.setAttribute("msg", "Warning ! Plzz Login First .. ");
        response.sendRedirect("signIn.jsp");
    }
%>