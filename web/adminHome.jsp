<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(session.getAttribute("adminName")!=null){
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
                
                <ul class="navbar-nav mx-auto">
                  <li class="nav-item">
                    <a class="nav-link" href="adminHome.jsp">HOME</a>
                  </li>
    
				  <li class="nav-item">
                                      <label class="nav-link">Welcome: <b><%=session.getAttribute("adminName") %></b> </label>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="Logout">Logout</a>
                  </li>
                  
                  <li class="nav-item">
                    <a class="nav-link" href="allPlants.jsp">All Product</a>
                  </li>
                  
                  <li class="nav-item">
                    <a class="nav-link" href="viewOrders.jsp?status=Pending">Pending Orders</a>
                  </li>
                  
                  <li class="nav-item">
                    <a class="nav-link" href="viewOrders.jsp?status=Shipped">Shipped Orders</a>
                  </li>
                  
                  <li class="nav-item">
                    <a class="nav-link" href="viewOrders.jsp?status=Delivered">Delivered Orders</a>
                  </li>
                  
                  <li class="nav-item">
                    <a class="nav-link" href="viewOrders.jsp?status=Canceled">Canceled Orders</a>
                  </li>
               </ul>
                 
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
        <br>
        
        <b><h1>Add Product</h1></b>
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