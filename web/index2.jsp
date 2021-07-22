<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <h1 style="color:green"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PLANTO - MAKE YOUR HOME NURSERY</b></h1><hr>
                <br>
        <form action="plantSearch.jsp">
            <label>Search Plant : &nbsp;</label>
            <input type="search" name="name"/>&nbsp;&nbsp;&nbsp;
            <button type="submit">Search</button>
        </form>
                <br>
                <%
                    if(session.getAttribute("name")!=null){    
                        String name = (String)session.getAttribute("name");
                        String email = (String)session.getAttribute("email");
                        dao.DbConnect db = new dao.DbConnect();
                %>
                Welcome <b><%= name %></b> | <a href="Logout">LOGOUT</a> &nbsp;&nbsp;  Cart:<%= db.getCartCount(email) %> | <a href="cart.jsp">View Cart</a> | <a href="index.jsp">HOME</a> | <a href="orders.jsp">My Orders</a> | <a href="updateProfile.jsp">Profile</a>   <br/>
                <%
                    }else{
                %>
                <a href="signIn.jsp">SIGN IN</a> | <a href="signUp.jsp">SIGN UP</a> | <a href="adminLogin.jsp">admin login</a> &nbsp;&nbsp;<br/>
                <%
                    }    
                %>
                <br>
                <hr>
                <br/>
                
        <div>
		<img src="images/banner.jpg" width="1580px" height="300px">
		
	</div>
                
                
                
    </body>
</html>
