<%-- 
    Document   : contoh2
    Created on : Nov 23, 2017, 11:23:10 AM
    Author     : User
--%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>List Of Homestays</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}</style>
    <body class="w3-light-grey w3-content" style="max-width:1600px">

        <%
            ResultSet rset = null;
       
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = null;
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/integer2?useSSL=false", "root", "1234");
                //          if(!connection.isClosed())
                //               out.println("Successfully connected to " + "MySQL server using TCP/IP...");
                //          connection.close();
                String sql = "Select houseName, address, accomodation, rate from homestay";
                Statement stmnt = null;
                stmnt = conn.createStatement();
                rset = stmnt.executeQuery(sql);

        

            } catch (Exception ex) {
                out.println("Unable to connect to database.");
            }
        %>
        
        <div class="jumbotron">
            <h2>LIST OF HOMESTAYS</h2>  
        </div>

        <div class="w3-main" style="margin-center:300px">
            <div class="w3-row-padding">
                <div class="w3-third w3-container w3-margin-bottom">
     <!--               <img src="./image/homestay1.jpg" alt="Norway" style="width:100%" class="w3-hover-opacity"> -->
                    <div class="w3-container w3-white">
                      <%
                          while(rset.next()){
                              String hname = rset.getString("houseName");
                              String add = rset.getString("address");
                              String acc = rset.getString("accomodation");
                              float rate = rset.getFloat("rate");
                              %>
                             
                              <%
                              
                          }
                      
                      %>  
                            
                      
        
                        <%
                         //   if (session.getAttribute("usertype").equals("owner")) {
                        %>
                        <div class="btn-group">                
                            <a href="edit">  <button type="button" class="btn btn-primary btn-md">EDIT</button> </a> 
                            <a href="delete"> <button type="button" class="btn btn-primary btn-md">DELETE </button> </a> <br><br>            
                        </div>
                        <%
                       //     }
                        %>
                    </div>
                </div>

                <div class="w3-third w3-container w3-margin-bottom">
                    <img src="./image/homestay2.jpg"  style="width:100%" class="w3-hover-opacity">
                    <div class="w3-container w3-white">
                        <p><b>Aurora Homestay</b></p>
                        <p>10, Jalan Aman Larkin 5 Taman Aman Larkin, 80350 Johor Bahru, Johor</p>
                        <p>3 bedrooms, 2 bathrooms</p>
                        <p>RM200/night</p>
                        <div class="btn-group">
                            <a href="edit">  <button type="button" class="btn btn-primary btn-md">EDIT</button> </a> 
                            <a href="delete"> <button type="button" class="btn btn-primary btn-md">DELETE </button> </a> <br><br>
                        </div>
                    </div>
                </div>

                <div class="w3-third w3-container">
                    <img src="./image/homestay3.jpg"  style="width:100%" class="w3-hover-opacity">
                    <div class="w3-container w3-white">
                        <p><b>Eco B & B</b></p>
                        <p>Jalan Setia Tropika 9, Setia Tropika, 81200 Johor Bahru, Johor</p>
                        <p>3 bedrooms, 2 bathrooms</p>
                        <p>RM150/night</p>
                        <div class="btn-group">
                            <a href="edit">  <button type="button" class="btn btn-primary btn-md">EDIT</button> </a> 
                            <a href="delete"> <button type="button" class="btn btn-primary btn-md">DELETE </button> </a> <br><br>
                        </div>
                    </div>
                </div>
                <br><br>
                <div class="w3-main" style="margin-center:300px">
                    <div class="w3-row-padding">
                        <div class="w3-third w3-container w3-margin-bottom">
                            <img src="./image/homestay4.jpg"  style="width:100%" class="w3-hover-opacity">
                            <div class="w3-container w3-white">
                                <p><b>JB Lovely Homestay</b></p>
                                <p>No, 44, Jalan Bukit Kempas 2, Taman Bukit Kempas, 81200 Johor Bahru, Johor</p>
                                <p>4 bedrooms, 3 bathrooms</p>
                                <p>RM350/night</p>
                                <div class="btn-group">
                                    <a href="edit">  <button type="button" class="btn btn-primary btn-md">EDIT</button> </a> 
                                    <a href="delete"> <button type="button" class="btn btn-primary btn-md">DELETE </button> </a> <br><br>
                                </div>
                            </div>
                        </div>

                        <div class="w3-third w3-container w3-margin-bottom">
                            <img src="./image/homestay5.jpg"  style="width:100%" class="w3-hover-opacity">
                            <div class="w3-container w3-white">
                                <p><b>Citi Homestay</b></p>
                                <p> Zennith Suite, Jalan Kebun Teh 2, Pusat Perdagangan Kebun Teh, 80250 Johor Bahru</p>
                                <p>3 bedrooms, 2 bathrooms</p>
                                <p>RM250/night</p>
                                <div class="btn-group">
                                    <a href="edit">  <button type="button" class="btn btn-primary btn-md">EDIT</button> </a> 
                                    <a href="delete"> <button type="button" class="btn btn-primary btn-md">DELETE </button> </a> <br><br>
                                </div>
                            </div>
                        </div>

                        <div class="w3-third w3-container">
                            <img src="./image/homestay6.jpg"  style="width:100%" class="w3-hover-opacity">
                            <div class="w3-container w3-white">
                                <p><b>JR Homestay</b></p>
                                <p>Jln Setia 10/8, Taman Setia Indah, 81100 Johor Bahru, Johor</p>
                                <p>3 bedrooms, 2 bathrooms</p>
                                <p>RM180/night</p>
                                <div class="btn-group">
                                    <a href="edit">  <button type="button" class="btn btn-primary btn-md">EDIT</button> </a> 
                                    <a href="delete"> <button type="button" class="btn btn-primary btn-md">DELETE </button> </a> <br><br>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                </body>