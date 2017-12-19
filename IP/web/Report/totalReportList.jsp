<%-- 
    Document   : totalReportList
    Created on : Dec 19, 2017, 12:12:24 AM
    Author     : jhz
--%>

<%@page import="conn.MySQLQuery"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
                    <h4>Total Payment in year(RM)</h4><br>
                    <p><%out.println(MySQLQuery.getQuerytResult("Select sum(totalPayment) from booking;",false));%></p><br>
                    
        
    </body>
</html>
