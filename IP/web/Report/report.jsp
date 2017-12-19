<%-- 
    Document   : report
    Created on : Dec 17, 2017, 9:31:00 PM
    Author     : jhz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="conn.MySQL"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="beans.*"%>


<!DOCTYPE html>
<html> 
    <head>
        <title> Homestay </title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        
        <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
        <link href="../assets/css/main.css" rel="stylesheet" type="text/css"/>
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
        <noscript><link rel="stylesheet" href="../assets/css/noscript.css" /></noscript>

        <style>
            /* The Modal (background) */
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 2; /* Sit on top */
                padding-top: 100px; /* Location of the box */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.6); /* Black w/ opacity */
            }

            /* Modal Content */
            .modal-content {
                background-color: #fefefe;
                margin: auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
            }

            /* The Close Button */
            .close {
                color: #aaaaaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }
            
        </style>
    </head>
    <body>
        <div id="myModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content main">
                <span class="close">&times;</span>

                <div class="wrapper">                       
                    <a href="SignOutServlet" class="button">Log-Out</a>                   
                </div>
            </div>

        </div>                 
        <div id="wrapper">

            <!-- Header -->
            <header id="header">
                <a href="../index.html" class="logo">Homestay</a>
            </header>

            <!-- Nav -->
            <nav id="nav">
              <%  Staff staff = (Staff) session.getAttribute("staff"); %>
                <ul class="links">							
                    <li><a href="../ownerPage.jsp">Profile</a></li>
                    <li><a href="../homestayList.jsp">Homestay List</a></li>
                    <li><a href="../bookingLog.jsp">Booking Log</a></li>
                    <li class="active"><a href="Report/report.jsp">Report</a></li>	
                </ul>
                <ul class="icons">
                    <li>Currently log in as: <a id="myBtn" ><%=staff.getName()%></a></li>
                </ul>
            </nav>

            <!-- Main -->
            <div id="main">
                <iframe  src="reportPage.jsp" name="targetframe" allowTransparency="true" scrolling="no" frameborder="0" width="70%" marginwidth ="0" style="height:30em"></iframe>
                <iframe  src="totalReportList.jsp" name="targetframe" allowTransparency="true" scrolling="no" frameborder="0" width="20%" marginwidth ="0" style="height:30em"></iframe>
                <iframe  src="userReportPage.jsp" name="targetframe" allowTransparency="true" scrolling="auto" frameborder="0" width="100%" marginwidth ="0" style="height:30em"></iframe>
            </div>

            <!-- Copyright -->
            <div id="copyright">
                <ul><li>&copy; Integer</li><li>Design: <a href="https://html5up.net">HTML5 UP</a></li></ul>
            </div>

        </div>
    </body>

    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery.scrollex.min.js"></script>
    <script src="assets/js/jquery.scrolly.min.js"></script>
    <script src="assets/js/skel.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>
</html>
