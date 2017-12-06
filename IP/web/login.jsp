<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage = "errorPage.jsp" %>
<jsp:useBean id="staff" class="beans.signin" scope="session" />
 <jsp:setProperty name="staff" property="*" />  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%
          session.setMaxInactiveInterval(1800);  // 30 minute time out 
          staff.login("jdbc:sqlserver://localhost:3306;databaseName=integer2;user=root;password=1234;");
          if(staff.isLoggedIn())
            response.sendRedirect("homestayList.jsp");
          else
            response.sendRedirect("index.html");
        %>

    </body>
</html>