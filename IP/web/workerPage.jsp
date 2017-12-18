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
            Staff staff = (Staff) session.getAttribute("staff");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con;
                con = MySQL.getMySQLConnection();

                PreparedStatement pst = con.prepareStatement("Select * from staff where username=?");
                pst.setString(1, staff.getUsername());

                ResultSet rs = pst.executeQuery();

                if (rs.next()) {                    
                    if (session != null) {
                        session.invalidate();
                        session = request.getSession();
                    }
                    staff.setUsername(rs.getString("username"));
                    staff.setName(rs.getString("name"));
                    staff.setIcNo(rs.getString("icNo"));
                    staff.setAddress(rs.getString("address"));
                    staff.setTelNo(rs.getString("telNo"));
                    staff.setEmail(rs.getString("email"));
                    staff.setLevel(rs.getString("level"));
                    session.setAttribute("staff", staff);
                }
            }
            catch(Exception e){
                e.printStackTrace();
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
                <a href="staffPage.jsp" class="logo">Homestay</a>
            </header>

            <!-- Nav -->
            <nav id="nav">
                <ul class="links">
                    <li class="active"><a href="staffPage.jsp">Profile</a></li>
                    <li><a href="scheduleW.jsp">Schedule</a></li>
                    <li><a href="reportDamage.jsp">Report Damage</a></li>
                </ul>
                <ul class="icons">							
                    <li>Currently log-in as: </li>
                    <li><a id="myBtn" >Staff</a></li>
                </ul>
            </nav>

            <!-- Main -->
            <div id="main">                                     

                <h2>My Profile</h2>

                <section class="alt">
                    <form action="updateStaff">
                        <input type="hidden" name="username" value="<%= staff.getUsername() %>" />
                        <h3>Name</h3>
                        <input type="text" name="name" value="<%= staff.getName()%>" readonly/><br>

                        <h3>IC No</h3>
                        <input type="text" name="icNo" value="<%= staff.getIcNo()%>" readonly/><br>

                        <h3>Address</h3>
                        <input type="text" name="address" id="input3" value="<%= staff.getAddress()%>" readonly/><br>

                        <h3>Telephone Number</h3>
                        <input type="text" name="telNo" id="input4" value="<%= staff.getTelNo()%>" readonly/><br>

                        <h3>Email</h3>
                        <input type="text" name="email" id="input5" value="<%= staff.getEmail()%>" readonly/><br><br>
                        <input type="button" id="edit" value="Edit">
                        <input type="button" id="cancel" style="display:none" value="Cancel">
                        <input type="submit">
                    </form>                            
                </section>

            </div>

            <!-- Copyright -->
            <div id="copyright">
                <ul><li>&copy; Integer</li><li>Design: <a href="https://html5up.net">HTML5 UP</a></li></ul>
            </div>

        </div>
    </body>

    <script>
        var btnEdit = document.getElementById("edit");
        var btnCancel = document.getElementById("cancel");
        var input3 = document.getElementById("input3");
        var input4 = document.getElementById("input4");
        var input5 = document.getElementById("input5");

        btnEdit.onclick = function() {
            btnEdit.style.display = "none";
            btnCancel.style.display = "unset";
            input3.removeAttribute("readonly");
            input4.removeAttribute("readonly");
            input5.removeAttribute("readonly");
        }
        
        btnCancel.onclick = function() {
            btnEdit.style.display = "unset";
            btnCancel.style.display = "none";
            input3.setAttribute("readonly", true);
            input3.setAttribute("readonly", true);
            input3.setAttribute("readonly", true);
        }

    </script>
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

        btnRegis.onclick = function () {
            btnRegis.disabled = true;
            regis.style.display = "unset";
            btnLogin.disabled = false;
            login.style.display = "none";
        }

        btnLogin.onclick = function () {
            btnRegis.disabled = false;
            regis.style.display = "none";
            btnLogin.disabled = true;
            login.style.display = "unset";
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
    <script>
        document.getElementsByClassName("close2")[0].onclick = function () {
            document.getElementById("myModal2").style.display = "none";
        }

        window.onclick = function (event) {
            if (event.target == document.getElementById("myModal2")) {
                document.getElementById("myModal2").style.display = "none";
            }
        }
    </script>
</html>




