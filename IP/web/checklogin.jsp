<jsp:useBean id="staff" class="beans.signin" scope="session" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check login</title>
    </head>
    <body>

     <%
          if(!staff.isLoggedIn())
          {
           response.sendRedirect("index.html");  // Tell the browser to go to this page
           return; // do nothing more
          }
     %>

        <h3>Hello <%= staff.getUsername()+" "+staff.getPassword() %> </h3>
        
        <%@include file="footer.jsp" %>
    </body>
</html>