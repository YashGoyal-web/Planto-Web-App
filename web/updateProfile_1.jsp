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
        <h1 style="color:green"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PLANTO - MAKE YOUR HOME NURSERY</b></h1>
        <hr/>
        Welcome : <b><%= session.getAttribute("name")%></b> | <a href="Logout">Logout</a> | <a href="allPlants.jsp">View All Product</a>
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