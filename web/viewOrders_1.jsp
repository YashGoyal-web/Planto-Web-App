<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  dao.DbConnect db = new dao.DbConnect();
  String status = request.getParameter("status");  
  String pageName = request.getParameter("status");  
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
                    if(session.getAttribute("adminName")!=null){    
                %>
                Welcome : <b><%= session.getAttribute("adminName")%></b> | <a href="Logout">Logout</a> | <a href="allPlants.jsp">View All Product</a> | <a href="viewOrders.jsp?status=Pending">Pending Orders</a> | <a href="viewOrders.jsp?status=Shipped">Shipped Orders</a> | | <a href="viewOrders.jsp?status=Delivered">Delivered Orders</a> | | <a href="viewOrders.jsp?status=Canceled">Canceled Orders</a>
                <hr>
                <%
                    if(session.getAttribute("msg") != null){
                %>
                <h3><%=session.getAttribute("msg")%></h3> 
                <%
                    session.setAttribute("msg",null);
                    }
                    ArrayList<HashMap<String,Object>> allOrders = db.getAllOrdersByAdmin(status);
                    for(HashMap<String,Object> order : allOrders){
                %>
                <div style="border:1px solid gray;padding:20px;margin:10px;background:lightyellow" >
                    order_id : <b><%= order.get("order_id") %></b>
                    Email : <b><%= order.get("email") %></b>
                    Date : <b><%= order.get("order_datetime") %></b>
                    Status : <b><%= order.get("status") %></b>
                    <br>
                    <%
                        ArrayList<HashMap<String,Object>> allOrderedItem = db.getOrderItem((int)order.get("order_id"));
                        for(HashMap<String,Object> orderItem : allOrderedItem){
                    %>
                    <br>
                    <img src='GetOrderItemPhoto?order_id=<%=order.get("order_id")%>&name=<%=orderItem.get("name")%>' height="30px" />
                    Name : <b><%= (String)orderItem.get("name") %></b>
                    Price : <b><%= orderItem.get("price") %></b>
                    Quantity : <b><%= orderItem.get("quantity") %></b>
                    Category : <b><%= orderItem.get("category") %></b>
                    <%
                        }
                    %>
                    <br><br>
                    Price : <b><%= db.getOrderPrice((int)order.get("order_id")) %></b>
                    Address : <b><%= order.get("address") %></b>
                    <br><br>
                    <%
                        if(((String)order.get("status")).equalsIgnoreCase("pending") ){
                    %>
                    
                    <form style='float: left;margin-right: 10px' action="OrderStatusUpdate">
                        <input type="hidden" name="status" value='shipped' />
                        <input type="hidden" name="pageName" value="<%= pageName %>" />
                        <input type="hidden" name="order_id" value="<%=order.get("order_id")%>" />
                        <input type="submit" value="Ship Order" />
                    </form>
                    <form action="OrderStatusUpdate">
                        <input type="hidden" name="status" value='Canceled' />
                        <input type="hidden" name="pageName" value="<%= pageName %>" />
                        <input type="hidden" name="order_id" value="<%=order.get("order_id")%>" />
                        <input type="submit" value="Cancel Order" />
                    </form>
                    
                    <%
                        }else if(((String)order.get("status")).equalsIgnoreCase("shipped") ){
                    %>
                    <form action="OrderStatusUpdate">
                        <input type="hidden" name="status" value='Delivered' />
                        <input type="hidden" name="pageName" value="<%= pageName %>" />
                        <input type="hidden" name="order_id" value="<%=order.get("order_id")%>" />
                        <input type="submit" value="Deliver Order" />
                    </form>
                    <%
                        }
                    %>
                </div>
                <%
                    }
                    }else{
                        session.setAttribute("msg","Warning ! Plzz Login First .. ");
                        response.sendRedirect("adminLogin.jsp");
                    }
                %>
	<hr/>
        
    <body>
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
