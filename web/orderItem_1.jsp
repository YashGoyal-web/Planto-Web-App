<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    if(session.getAttribute("name")!=null){
      
        String email = String.valueOf(session.getAttribute("email"));
        int order_id = Integer.parseInt(request.getParameter("order_id"));
            dao.DbConnect db = new dao.DbConnect();
            ArrayList<HashMap<String,Object>> allOrderItems = db.getOrderItem(order_id);
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
        Welcome : <b><%= session.getAttribute("name")%></b> | <a href="Logout">Logout</a> | cart : <%= db.getCartCount(email) %> | <a href="index.jsp">HOME</a> | <a href="orders.jsp">My Orders</a><br><br>

        <hr/>
        <h2 style="background-color:background;color: white" align="center" >Order Details</h2>
        <hr/>
        
        <%
            if(session.getAttribute("msg")!=null){
                
        %>
        <h3 style="background-color:greenyellow" align="center" ><%= session.getAttribute("msg") %></h3>
        <hr/>
        <%
            session.setAttribute("msg",null);
            }
        
            if(allOrderItems.isEmpty()){
        %>
        <h3 style="color:red">No Order Detail Present !!</h3>
        <%
            }

            for(HashMap<String,Object> order : allOrderItems){
        %>
          
            <div style="border:1px solid gray;padding:20px;margin:10px;background:lightyellow">	
                <img src='GetOrderItemPhoto?order_id=<%=order.get("order_id")%>&name=<%=order.get("name")%>' height="100px" />
                <br>Order Id : <b><%= order.get("order_id") %></b><br>
                Plant Name : <b><%= order.get("name") %></b><br>
                Price : <b><%= order.get("price") %></b><br>
                Quantity : <b><%= order.get("quantity") %></b><br>
                Category : <b><%= order.get("category") %></b><br>
            </div>
            <hr>
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
        response.sendRedirect("signIn.jsp");
    }
%>