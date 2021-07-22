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
                
                 <div> 
                     <a class="text-success" href="tel:+23-345-67890"> 
                         <h3><i class="fas fa-mobile-alt"></i> +23-563-5688</h3> 
                     </a> 
                 </div> 
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
        <section>
            <div id="demo" class="carousel slide" data-ride="carousel">
                <ul class="carousel-indicators">
                  <li data-target="#demo" data-slide-to="0" class="active"></li>
                  <li data-target="#demo" data-slide-to="1" ></li>
                  <li data-target="#demo" data-slide-to="2"></li>
                </ul>
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img src="images/banner1.jpg" class="img-fluid"  height="300px" >
                    <div class="carousel-caption">
                      <h3>Image 1</h3>
                    </div>   
                  </div>
                  <div class="carousel-item">
                    <img src="images/banner2.jpg" class="img-fluid" height="300px">
                    <div class="carousel-caption">
                      <h3>Image 2</h3>
                    </div>   
                  </div>
                  <div class="carousel-item">
                    <img src="images/banner3.jpg" class="img-fluid" height="300px">
                    <div class="carousel-caption">
                      <h3>Image 3</h3>
                    </div>   
                  </div>
                </div>
                <a class="carousel-control-prev" href="#demo" data-slide="prev">
                  <span class="carousel-control-prev-icon"></span>
                </a>
                <a class="carousel-control-next" href="#demo" data-slide="next">
                  <span class="carousel-control-next-icon"></span>
                </a>
              </div>
        </section>
        <section class='mt-5'>
          <div class="container">
            <div class="row align-items-center">
              <div class="col-md-6">
                <img class="img-fluid c-garden" src="images/garden.jpg" alt="" >
              </div>
              <div class="col-md-6">
                  <h2 class="text-uppercase mb-4">Turn your terrace into a green paradise</h2>
                  <p>-Want an instagrammable terrace garden? </p>
                  <p> -Can?t decide what to grow on your terrace? </p>
                  <p class="text-danger h2"><strike> &#8377; 199 </strike> <br/> FREE*</p> 
                  <p>25 mins of consultation, Ask in English or Hindi.</p>
                  <a href="tel:+9898989898" class="btn btn-success mt-4 c-button">Call NOW <i class="fas fa-arrow-alt-circle-right"></i></a>
              </div>
            </div>
          </div>
        </section>
        <section class='mt-5'>
          <div class="container text-center">
            <h3>Trending Plants</h3>
            <hr/>
            <div class="row mt-4">
              <img class='col-md-3 img-fluid' src='images/trending-plant1.png' alt=""/>
              <img class='col-md-3 img-fluid' src='images/trending-plant2.png' alt=""/>
              <img class='col-md-3 img-fluid' src='images/trending-plant3.png' alt=""/>
              <img class='col-md-3 img-fluid' src='images/trending-plant4.png' alt=""/>
            </div>
          </div>
        </section>
        <section class='mt-5'>
          <div class="container text-center">
            <h3>That's How We Helped... </h3>
            <hr/>
            <div class="row mt-4">
              <div class="col-md-6 text-white p-5 text-center c-border">
                <h4>Gautam Basu, World Health Organization</h4>
                <p class='text-warning'> 
                  <i class="fas fa-star"></i> 
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                </p>
                <p>My expert was extremely knowledgeable, she was very sure of facts, had wide understanding of plants, was an excellent communicator with very clear diction. She was very pleasant charming, indeed very erudite about plants, and gave me very useful tips. I wish the session was longer. I wish to thank her profusely.</p>
              </div>
              <div class="col-md-6 text-white p-5 text-center c-border">
                <h4>Giridaran</h4>
                <p class='text-warning'> 
                  <i class="fas fa-star"></i> 
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                </p>
                <p>All my doubts and queries about Terrace Vegetables gardening was instantly and quite convincingly and most impressively explained and clarified plus my elevation gardening also well explained. Very satisfactory.</p>
              </div>
            </div>
            <div class="row mt-2">
              <div class="col-md-6 text-white p-5 text-center c-border">
                <h4>Nihal Singh</h4>
                <p class='text-warning'> 
                  <i class="fas fa-star"></i> 
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                </p>
                <p>You guys are working great & many thanks to nurserylive for the Consultation Call, it is so helpful & motivate me to keep on gardening.</p>
              </div>
              <div class="col-md-6 text-white p-5 text-center c-border">
                <h4>Sheetal Banatwalla</h4>
                <p class='text-warning'> 
                  <i class="fas fa-star"></i> 
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                  <i class="fas fa-star"></i>
                </p>
                <p>I am very happy with the service. No complaints at all. Very insightful, and the expert was very knowledgeable.</p>
              </div>
            </div>
          </div>
        </section>
        <section class='mt-5'>
          <div class="container text-center">
            <h3>Our Gallery</h3>
            <div class="row mt-4">
              <hr/>
              <a href="images/gallery-1.jpg" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-4">
                <img  src="images/gallery-1.jpg" alt="" class="img-fluid">
              </a>
              <a href="images/gallery-2.jpg" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-4">
                <img src="images/gallery-2.jpg" alt="" class="img-fluid">
              </a>
              <a href="images/gallery-3.jpg" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-4">
                <img src="images/gallery-3.jpg" alt="" class="img-fluid">
              </a>
            </div>
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
                    <input type="text" class="form-control" placeholder="Enter email" id="email" name="id" required>
                  </div>
                  <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" class="form-control" placeholder="Enter password" id="pwd" name="pass" required>
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
      //script for light box
      $(document).on('click', '[data-toggle="lightbox"]', function(event) {
          event.preventDefault();
          $(this).ekkoLightbox();
      });
    </script>

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