<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  if(session.getAttribute("adminName")==null){
      response.setHeader("Pragma","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Expires","0");
response.setDateHeader("Expires",-1);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
    </head>
      <%
        if(session.getAttribute("msg")!=null){
      %>
      <h3 style="color:red"><%=session.getAttribute("msg")%></h3>
      <%
            session.setAttribute("msg",null);
        }
      %>
    <body>
        <h1 style="color:green"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PLANTO - MAKE YOUR HOME NURSERY</b></h1>
        <hr/>
        <h1 style="color:green">ADMIN LOGIN</h1>
        <hr/><br/>
        <form action="AdminLogin" method="post">
            <label>Admin Id : </label>
            <input type="text" name="id" required/><br/><br/>
            <label>Admin Password : </label>
            <input type="password" name="pass" required/><br/><br/>
            <button>login</button>
        </form>
    </body>
</html>
<%
}else{
  response.sendRedirect("adminHome.jsp");
}
%>