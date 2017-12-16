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
<%@page import="beans.Customer"%>


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
                String sql = "Select houseID, houseName, address, accomodation, rate from homestay";
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
                    <button id="regisButton" disabled>Registration</button>
                    <button id="loginButton">Login</button>

                    <div id="register">
                        <hr>
                        <h2>Customer registration</h2>
                        <section class="post">
                            <form method="post" action="SignUpServlet" class="alt">
                                <div class="row uniform">                                        
                                    <div class="6u 12u(xsmall)">
                                        <label for="name">Name</label>
                                        <input type="text" name="custName"/>
                                    </div>
                                    <div class="6u 12u(xsmall)">
                                        <label for="telNo">Telephone Number</label>
                                        <input type="text" name="custTel"/>
                                    </div>
                                    <div class="6u 12u(xsmall)">
                                        <label for="email">Email</label>
                                        <input type="text" name="custEmail"/>
                                    </div>
                                    <div class="6u 12u(xsmall)">
                                        <label for="password">Password</label>
                                        <input type="text" name="custPassword"/>
                                    </div>
                                    <div class="12u" >
                                        <input type="submit" value="Register"/>
                                    </div>
                                </div>
                            </form>


                        </section>
                    </div>

                    <div id="login" style="display:none">
                        <hr>
                        <h2>Customer Login</h2>
                        <section class="post">
                            <form method="post" action="SignInCustomer" class="alt">
                                <div class="row uniform">                                        
                                    <div class="6u 12u(xsmall)">
                                        <label for="username">Email</label>
                                        <input type="text" name="custEmail"/>
                                    </div>
                                    <div class="6u 12u(xsmall)">
                                        <label for="password">Password</label>
                                        <input type="password" name="custPassword"/>
                                    </div>
                                    <div class="12u" >
                                        <input type="submit" value="Login"/>
                                    </div>
                                </div>
                            </form>
                    </div>
                </div>

            </div>

        </div>                


        <div id="wrapper">

            <!-- Header -->
            <header id="header">
                <a href="customerPage.jsp" class="logo">Homestay</a>
            </header>

            <!-- Nav -->
            <nav id="nav">
                <ul class="links">							
                    <li class="active"><a href="homestayList.jsp">Homestay</a></li>
                </ul>
                <ul class="icons">							
                    <div>
                        <li>Currently booking as:<a id="myBtn">
                            <%  Customer customer = (Customer) session.getAttribute("customer");
                                if (customer == null) {
                                    out.print("<li><a id=\"myBtn\" >Guest</a></li>");
                                } else {
                                    out.print("<li><a >" + customer.getName() + "</a></li>");
                                }
                                %></a>
                        </li>                        
                    </div>
                </ul>
            </nav>

            <!-- Main -->
            <div id="main">

                <!-- Post -->
                <section class="post">
                    <div class="row">
                        <% int count = 1;
                            while (rset.next()) {

                        %>

                        <div class="6u 12u(small)">

                            <a class="image fit" >
                                <%                                    //out.print("<img src=\"image/" + rset.getString("houseID") + ".jpg\" alt=\"\" />");
                                    out.print("<img src=\"image/" + rset.getString("houseID") + ".jpg\" alt=\"\" style=\"max-width:100%;max-height:230px;\" />");
                                %>
                            </a>
                            <h3> <%= rset.getString("houseName")%> </h3>
                            <p> <%= rset.getString("address")%> </p> 
                            <p> <%= rset.getString("accomodation")%> </p> 
                            <p> <%= rset.getString("rate")%> </p> 
                            <div class="6u 12u(small)">
                                <ul class="actions">
                                    <% out.print("<li><a href='booking.jsp?housename=" + rset.getString("houseName") + "&rate=" + rset.getString("rate") + "' class=\"button\">BOOK</a></li>"); %>
                                </ul>
                            </div>
                        </div>
                        <% count++;
                                }%>
                    </div> 
                </section>

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
        };

        btnRegis.onclick = function () {
            btnRegis.disabled = true;
            regis.style.display = "unset";
            btnLogin.disabled = false;
            login.style.display = "none";
        };

        btnLogin.onclick = function () {
            btnRegis.disabled = false;
            regis.style.display = "none";
            btnLogin.disabled = true;
            login.style.display = "unset";
        };

// When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        };

// When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        };
    </script>
</html>




