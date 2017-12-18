<%-- 
    Document   : contoh2
    Created on : Nov 23, 2017, 11:23:10 AM
    Author     : User
--%>
<%@page import="conn.MySQL"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="beans.*"%>

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
        <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>

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
        <%
            ResultSet rset = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = null;
                conn = MySQL.getMySQLConnection();
                //          if(!connection.isClosed())
                //               out.println("Successfully connected to " + "MySQL server using TCP/IP...");
                //          connection.close();
                String sql = "Select * from booking where month(checkOutDate)=12";
                Statement stmnt = null;
                stmnt = conn.createStatement();
                rset = stmnt.executeQuery(sql);

            } catch (Exception ex) {
                out.println("Unable to connect to database.");
            }
        %>
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
                <a href="#" class="logo">Homestay</a>
            </header>

            <!-- Nav -->
            <nav id="nav">
                <%  Staff staff = (Staff) session.getAttribute("staff");
                    if (staff.getLevel().equals("owner")) {
                        out.print("<ul class='links'>");
                        out.print("<li> <a href='ownerPage.jsp'>Profile</a></li>");
                        out.print("<li><a href='homestayList.jsp'>Homestay List</a></li>");
                        out.print("<li class='active'><a href='bookingLog.jsp'>Booking Log</a></li></ul>");
                        out.print("<ul class='icons'>");
                        out.print("Currently logged in as:<li><a id='myBtn'>" + staff.getName() + "</a></li></ul>");
                    } else {
                        out.print("<ul class='links'>");
                        out.print("<li> <a href='managerPage.jsp'>Profile</a></li>");
                        out.print("<li><a href='scheduleM.jsp'>Schedule</a></li>");
                        out.print("<li class='active'><a href='bookingLog.jsp'>Booking Log</a></li></ul>");
                        out.print("<ul class='icons'>");
                        out.print("Currently logged in as:<li><a id='myBtn'>" + staff.getName() + "</a></li></ul>");
                    }
                %>
            </nav>

            <!-- Main -->
            <div id="main">
                
                <div class="12u">
                    <div class="select-wrapper">
			<select name="demo-category" id="demo-category">
                            <option value="">- Search by Month -</option>
                            <option value="1">January</option>
                            <option value="1">February</option>
                            <option value="1">March</option>
                            <option value="1">April</option>
                            <option value="1">May</option>
                            <option value="1">June</option>
                            <option value="1">July</option>
                            <option value="1">August</option>
                            <option value="1">September</option>
                            <option value="1">October</option>
                            <option value="1">November</option>
                            <option value="1">December</option>
                        </select>
                    </div>
                </div>
                
                <table class="alt">
                    <thead>
			<tr>
				<th>Booking ID</th>
				<th>Customer Email</th>
                                <th>Check-In Date</th>
                                <th>Check-Out Date</th>
                                <th>Total Payment</th>
			</tr>
                    </thead>
                    <tbody>
                        <% int count = 1;
                            while (rset.next()) {
                        %>
			<tr>
                            <td><%= rset.getString("bookingId")%></td>
                            <td><%= rset.getString("houseID")%></td>
                            <td> <%= rset.getString("custEmail")%> </td> 
                            <td> <%= rset.getString("checkInDate")%> </td> 
                            <td> <%= rset.getString("checkOutDate")%> </td> 
                            <td> <%= rset.getString("totalPayment")%> </td> 
                        </div>
                        <% count++;
                            }%>
                    </tbody>
                    <!--<tfoot>
			<tr>
                            <td colspan="5"></td>
                            <td>100.00</td>
			</tr>
                    </tfoot>-->
                </table>                   
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
    <script>
// Get the modal
        var modal = document.getElementById("myModal");
        var regis = document.getElementById("register");
        var login = document.getElementById("login");
// Get the button that opens the modal
        var btn = document.getElementById("myBtn");
        var btnRegis = document.getElementById("regisButton");
        var btnLogin = document.getElementById("loginButton");

// Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
        btn.onclick = function () {
            modal.style.display = "unset";
        }

// When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        }

// When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }  
    </script>
</html>





