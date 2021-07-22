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
        <h1 style="color:green" align="center"><b>SIGN IN</b></h1>
        <hr/>
        <a href='index.jsp'>Home</a>
        <br>
        <hr>
        <%
            if(session.getAttribute("msg")!=null){
        %>
        <h3 style="color:red"><%=session.getAttribute("msg")%></h3>
        <%
            session.setAttribute("msg",null);
            }
        %>
        <br>
        <form action="ForgetPassword" method="post">
            <label>Enter Registered Email : </label>
            <input type="email" name="email" required/><br/><br/>
            <button>Submit</button>
        </form>
        <br>
        <form action="signIn.jsp">
            <button>SIGN IN</button>
        </form>
        <br>
        <form action="signUp.jsp">
            <button>SIGN UP</button>
        </form>
    </body>
</html>
<%
    }else{
      response.sendRedirect("index.jsp");
    }
%>