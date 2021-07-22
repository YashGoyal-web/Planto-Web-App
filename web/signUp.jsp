<%
    if(session.getAttribute("name")==null ){
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <h1 style="color:green"><b>SIGN UP</b></h1>
        <hr/>
        <a href='index.jsp'>Home</a>
        <br>
        <hr>
        <%
            if(session.getAttribute("msg")!=null){
        %>
        <h3 style="color:red">Email id already Exist!!</h3>
        <%
            session.setAttribute("msg",null);
            }
        %>
        <form action="UserSignUp" method="post">
            <label>Name : </label>
            <input type="text" name="name" required/><br/><br/>
            <label>Email : </label>
            <input type="email" name="email" required/><br/><br/>
            <label>Password : </label>
            <input type="password" name="password" required/><br/><br/>
            <label>phone : </label>
            <input type="text" name="phone" required/><br/><br/>
            <button>Create Account</button>
        </form>
    </body>
</html>
<%
    }else{
      response.sendRedirect("index.jsp");
    }
%>