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
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="beans.*"%>
<%@page import="com.google.gson.Gson"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
    <head>
        <title> LIST OF HOMESTAYS </title>
        
        <script src='lib/jquery.min.js'></script>
        <script src='lib/moment.min.js'></script>
        <script src='lib/fullcalendar.min.js'></script>
        
    <script src="assets/js/jquery.scrollex.min.js"></script>
    <script src="assets/js/jquery.scrolly.min.js"></script>
    <script src="assets/js/skel.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="assets/css/main.css" />
        <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
        <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
        <link href='lib/fullcalendar.min.css' rel='stylesheet' />
        <link href='lib/fullcalendar.print.min.css' rel='stylesheet' media='print' />        
        
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
        
        
        <style>
            /* The Modal (background) */
            .modal2 {
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
            .modal-content2 {
                background-color: #fefefe;
                margin: auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
            }

            /* The Close Button */
            .close2 {
                color: #aaaaaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close2:hover,
            .close2:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }
        </style>

        <%

            String resultSet = null;
            Staff staff = (Staff) session.getAttribute("staff");

            List<Staff> worker = null;
            List<Homestay> homestay = null;
            List<Calender> sch = null;            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con;
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/integer2?useSSL=false", "root", "1234");

                String sql1 = "Select * from staff where level='worker'";
                Statement stmt = con.createStatement();

                ResultSet rs = stmt.executeQuery(sql1);

                worker = new ArrayList();

                while (rs.next()) {
                    Staff st = new Staff();
                    st.setUsername(rs.getString("username"));
                    st.setName(rs.getString("name"));
                    worker.add(st);
                }
                try {

                    String sql2 = "Select * from homestay join manager on homestay.houseID = manager.houseID where username ='" + staff.getUsername() + "'";

                    rs = stmt.executeQuery(sql2);
                    homestay = new ArrayList();

                    while (rs.next()) {
                        Homestay ht = new Homestay();
                        ht.setHouseID(rs.getString("houseID"));
                        ht.setHouseName(rs.getString("houseName"));
                        homestay.add(ht);
                    }
                } catch (Exception e) {
                    out.print("No login data");
                }

                String sql3 = "Select * from schedule join staff on schedule.username = staff.username join homestay on homestay.houseID = schedule.houseID";

                rs = stmt.executeQuery(sql3);
                sch = new ArrayList();

                while (rs.next()) {
                    Calender c = new Calender();
                    c.setTitle(rs.getString("name"));
                    c.setDescription(rs.getString("houseName"));
                    c.setStart(String.valueOf(rs.getDate("start")));
                    c.setEnd(String.valueOf(rs.getDate("end")));

                    if(staff != null){
                        if (staff.getUsername().equals(rs.getString("username"))) {
                        c.setColor("green");
                    } else {
                        c.setColor("grey");
                    }
                    }else {
                        c.setColor("grey");
                    }
                    
                    sch.add(c);
                }
                
                
                String sql4 = "Select * from booking join homestay on booking.houseID = homestay.houseID";
                
                rs = stmt.executeQuery(sql4);                
                
                while(rs.next()){
                    Calender d = new Calender();
                    d.setTitle(rs.getString("houseName"));
                    d.setStart(String.valueOf(rs.getDate("checkInDate")));
                    d.setEnd(String.valueOf(rs.getDate("checkOutDate")));
                    d.setColor("lightblue");
                    sch.add(d);
                }
                
                Gson gson = new Gson();
                resultSet = gson.toJson(sch);
                

            } catch (Exception e) {
                out.print("Unable to connect to database");
            }
        %>

        <script>
            var rs = JSON.stringify(<%=resultSet%>);
            
            $(document).ready(function () {
                $('#calendar').fullCalendar({
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,agendaWeek,agendaDay'
                    },
                    navLinks: true, // can click day/week names to navigate views
                    selectable: true,
                    selectHelper: true,
                    select: function (start, end) {
                        document.getElementById("myModal2").style.display = "unset";
                        start = moment(start).format('YYYY-MM-DD');
                        end = moment(end).format('YYYY-MM-DD');
                        document.getElementById("start").value = start;
                        document.getElementById("end").value = end;
                        if (title != null) {
                            window.location.href = "createSchedule?title=" + title + "&start=" + start + "&end=" + end;
                        }
                    },
                    eventClick: function (calEvent, jsEvent, view) {
                       if(calEvent.type == 'schedule'){
                            alert('Worker: ' + calEvent.title + "\n" +
                                'Homestay: ' + calEvent.description);
                        }
                    },
                    editable: true,
                    eventLimit: true, // allow "more" link when too many events
                    events: JSON.parse(rs)
                });

            });

        </script>
        <style>

            body {
                
                padding: 0;
                font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
                font-size: 14px;
            }            

            #calendar {
                max-width: 900px;
                margin: 0 auto;
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
        
        <div id="myModal2" class="modal2">

            <!-- Modal content -->
            <div class="modal-content2 main">
                <span class="close2">&times;</span>
                <div id="create">
                    <form action="createSchedule">
                        <input type="text" name="start" id="start">
                        <input type="text" name="end" id="end">
                        Homestay: <select name="homestay">
                            <%
                                if (homestay != null) {
                                    for (Homestay x : homestay) {
                                        out.print("<option value='" + x.getHouseID() + "'>" + x.getHouseName() + "</option>");
                                    }
                                }
                            %>
                        </select>
                        Worker: <select name="worker">
                            <%
                                if (worker != null) {
                                    for (Staff x : worker) {
                                        out.print("<option value='" + x.getUsername() + "'>" + x.getName() + "</option>");
                                    }
                                }
                            %>
                        </select>
                        <input type="submit" value="Create Task">
                    </form>
                </div>


            </div>

        </div>


        <div id="wrapper">

            <!-- Header -->
            <header id="header">
                <a href="managerPage.jsp" class="logo">Homestay</a>
            </header>

            <!-- Nav -->
            <nav id="nav">
                <ul class="links">
                    <li><a href="managerPage.jsp">Profile</a></li>
                    <li class="active"><a href="scheduleM.jsp">Schedule</a></li>
                    <li><a href="bookingLog.jsp">Booking Log</a></li>	
                </ul>
                <ul class="icons">							
                    <li>Currently log-in as: </li>
                    <li><a id="myBtn" >Manager</a></li>
                </ul>
            </nav>

            <!-- Main -->
            
            <div id="main">
                                     <div id='calendar'></div>

               

            </div>

            <!-- Copyright -->
            <div id="copyright">
                <ul><li>&copy; Integer</li><li>Design: <a href="https://html5up.net">HTML5 UP</a></li></ul>
            </div>

        </div>
    </body>

    
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





