<%@page import="beans.Staff"%>
<%@page import="conn.dbConnection"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Homestay</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <link rel="stylesheet" href="assets/css/main.css" />
        <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>



    </head>
    <body class="is-loading">

        <!-- Wrapper -->
        <div id="wrapper">

            <!-- Header -->
            <header id="header">
                <a href="index.html" class="logo">Homestay</a>
            </header>

            <!-- Nav -->
            <nav id="nav">
                <%Staff staff = (Staff) session.getAttribute("staff"); %>
                <ul class="links">							
                    <li><a href='ownerPage.jsp'>Profile</a></li>
                    <li class="active"><a href="homestayList.jsp">Homestay List</a></li>
                    <li> <a href="bookingLog.jsp">Booking Log</a></li>
                    <li><a href="Report/report.jsp">Report</a></li>
                </ul>
                <ul class="icons">	
                    Currently log in as: <li><a><%=staff.getName()%></a></li>
                </ul>
            </nav>

            <!-- Main -->
            <div id="main">
                <!-- Post -->
                <section class="post">
                    <form method="post" action="updateHomestay" class="alt">
                        
                        <div class="row uniform">
                            <%
                                String houseid = request.getParameter("houseid");
                                //int id = Integer.parseInt(houseid);
                                out.print("<input type=\"hidden\" name=\"houseid\" value=\"" + houseid + "\">");

                                Connection conn = null;
                                try {
                                    conn = dbConnection.getConnection();

                                    String sql = "select * from homestay where houseid='"+houseid+"'";
                                    Statement stmt = conn.createStatement();
                                    ResultSet rset = stmt.executeQuery(sql);
                                    while (rset.next()) {
                            %>


                            <div class="6u 12u(xsmall)">
                                <label for="homestay">House Name</label>
                                <input type="text" name="housename"  value="<%=rset.getString("housename")%>">
                            </div>
                            <div class="6u 12u(xsmall)">
                                <label for="homestay">Address</label>
                                <input type="text" name="address"  id="address" value="<%=rset.getString("address")%>">
                            </div>
                            <div class="6u 12u(xsmall)">
                                <label for="homestay">Accomodation</label>
                                <input type="text" name="accomodation"  value="<%=rset.getString("accomodation")%>">
                            </div>
                            <div class="6u 12u(xsmall)">
                                <label for="homestay">Rate</label>
                                <input type="text" name="rate" value="<%=rset.getInt("rate")%>">
                            </div>
                            <%
                                    }
                                } catch (Exception e) {
                                }
                            %> 

                            <div class="12u" >
                                <input type="submit" value="Update"/>
                            </div>
                        </div>
                    </form>
                </section>
            </div>


            <!-- Copyright -->
            <div id="copyright">
                <ul><li>&copy; Integer</li><li>Design: <a href="https://html5up.net">HTML5 UP</a></li></ul>
            </div>

        </div>


        <!-- Scripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/jquery.scrollex.min.js"></script>
        <script src="assets/js/jquery.scrolly.min.js"></script>
        <script src="assets/js/skel.min.js"></script>
        <script src="assets/js/util.js"></script>
        <script src="assets/js/main.js"></script>

    </body>
</html>