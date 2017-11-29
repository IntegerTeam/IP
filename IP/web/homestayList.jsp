<%-- 
    Document   : contoh2
    Created on : Nov 23, 2017, 11:23:10 AM
    Author     : User
--%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
    <head>
        <title> LIST OF HOMESTAYS </title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="assets/css/main.css" />
        <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
    <body>
        <%
            ResultSet rset = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = null;
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/integer2?useSSL=false", "root", "1234");
                //          if(!connection.isClosed())
                //               out.println("Successfully connected to " + "MySQL server using TCP/IP...");
                //          connection.close();
                String sql = "Select houseID, houseName, address, accomodation, rate from homestay";
                Statement stmnt = null;
                stmnt = conn.createStatement();
                rset = stmnt.executeQuery(sql);

            } catch (Exception ex) {
                out.println("Unable to connect to database.");
            }
        %>
        

        <div id="main">
            <div class="inner">

                <section> 
                    <header class="major">
                        <h2> List of Homestays </h2>
                    </header>
                    
                
                    <div class="posts">
                        <% while (rset.next()) {
                            %>
                        <article>
                            
                            
                            <%
                                out.print("<img src=\"image/"+rset.getString("houseID")+".jpg\" alt=\"\" />");
                            %>
                            <h3> <%= rset.getString("houseName")%> </h3>
                            <p> <%= rset.getString("address")%> </p> 
                            <p> <%= rset.getString("accomodation")%> </p> 
                            <p> <%= rset.getString("rate")%> </p> 
                            <ul class="actions">
                                <li><a href="#" class="button">BOOK</a></li>
                            </ul>
                            
                        </article>
                           <% } %>
                        
                    </div> 
                </section>
            </div>
        </div>
    </body>
</head>
</html>





