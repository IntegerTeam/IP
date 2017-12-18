<%@page import="beans.Customer"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="beans.*"%>
<%@page import="conn.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="com.google.gson.Gson"%>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Generic Page - Massively by HTML5 UP</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <script src='lib/jquery.min.js'></script>
        <script src='lib/moment.min.js'></script>
        <script src='lib/fullcalendar.min.js'></script>
        <script src="assets/js/jquery.scrollex.min.js"></script>
        <script src="assets/js/jquery.scrolly.min.js"></script>
        <script src="assets/js/skel.min.js"></script>
        <script src="assets/js/util.js"></script>
        <script src="assets/js/main.js"></script>
        <link rel="stylesheet" href="assets/css/main.css" /> 
        <link href='lib/fullcalendar.min.css' rel='stylesheet' />
        <link href='lib/fullcalendar.print.min.css' rel='stylesheet' media='print' />        
        <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>


        <%
            String housename = request.getParameter("housename");
            int rate = Integer.valueOf(request.getParameter("rate"));

            String resultSet = null;
            List<Homestay> homestay = null;
            List<Calender> sch = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con;
                con = MySQL.getMySQLConnection();

                String sql = "Select * from booking join homestay on booking.houseID = homestay.houseID where housename = '"+housename+"'";
                Statement stmt = con.createStatement();
                ResultSet rs = null;
                rs = stmt.executeQuery(sql);
                sch = new ArrayList();

                while (rs.next()) {

                    Calender d = new Calender();
                    d.setTitle(rs.getString("houseName"));
                    d.setStart(String.valueOf(rs.getDate("checkInDate")));
                    d.setEnd(String.valueOf(rs.getDate("checkOutDate")));
                    d.setColor("blue");
                    d.setType("booking");

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
                    select: function (start, end, calEvent) {
                        var e = [];
                        e = $('#calendar').fullCalendar('clientEvents');
                        var curDate = moment().format('YYYY-MM-DD');
                        start = moment(start).format('YYYY-MM-DD');
                        end = moment(end).format('YYYY-MM-DD');
                        var book = false;
                        if (start <=curDate || end <=curDate){
                            alert("Cannot book at that day!");
                        }
                        for (var i = 0; i < e.length; i++) {                            
                            if (moment(e[i].start).format('YYYY-MM-DD') <= start && start < moment(e[i].end).format('YYYY-MM-DD') ||
                                moment(e[i].start).format('YYYY-MM-DD') <= end && end < moment(e[i].end).format('YYYY-MM-DD') ||
                                start <= moment(e[i].start).format('YYYY-MM-DD') && moment(e[i].start).format('YYYY-MM-DD') < end ||
                                start <= moment(e[i].end).format('YYYY-MM-DD') && moment(e[i].end).format('YYYY-MM-DD') < end){
                                    alert("Date is invalid or already contain booking");
                                    book = true;
                                    break
                            } 
                        } 
                        if(book == false){
                            document.getElementById("start").value = start;
                            document.getElementById("end").value = end;
                            calcPay();
                        }
                    },
                    eventClick: function (calEvent, jsEvent, view) {
                        if (calEvent.type == 'schedule') {
                            alert('Worker: ' + calEvent.title + "\n" +
                                    'Homestay: ' + calEvent.description);
                        }
                    },
                    eventStartEditable: false,
                    editable: true,
                    eventLimit: true, // allow "more" link when too many events
                    events: JSON.parse(rs)
                });
            });
        </script>

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

            /* CSS for Credit Card Payment form */
            .credit-card-box .panel-title {
                display: inline;
                font-weight: bold;
            }
            .credit-card-box .form-control.error {
                border-color: red;
                outline: 0;
                box-shadow: inset 0 1px 1px rgba(0,0,0,0.075),0 0 8px rgba(255,0,0,0.6);
            }
            .credit-card-box label.error {
                font-weight: bold;
                color: red;
                padding: 2px 8px;
                margin-top: 2px;
            }
            .credit-card-box .payment-errors {
                font-weight: bold;
                color: red;
                padding: 2px 8px;
                margin-top: 2px;
            }
            .credit-card-box label {
                display: block;
            }
            /* The old "center div vertically" hack */
            .credit-card-box .display-table {
                display: table;
            }
            .credit-card-box .display-tr {
                display: table-row;
            }
            .credit-card-box .display-td {
                display: table-cell;
                vertical-align: middle;
                width: 50%;
            }
            /* Just looks nicer */
            .credit-card-box .panel-heading img {
                min-width: 180px;
            }            

            #calendar {
                max-width: 900px;
                margin: 0 auto;
            }
        </style>


    </head>
    <body class="is-loading">
        <%
            out.print("<input type=\"hidden\" id=\"rate\" value='" + rate + "'>");
        %>

        <!-- Wrapper -->
        <div id="wrapper">

            <!-- Header -->
            <header id="header">
                <a href="index.html" class="logo">Homestay</a>
            </header>

            <!-- Nav -->
            <nav id="nav">
                <ul class="links">							
                    <li class="active"><a href="houseList.html">Homestay</a></li>	
                </ul>
                <ul class="icons">	
                    <li>Currently booking as: </li>
                        <% Customer customer = (Customer) session.getAttribute("customer");
                            if (customer != null) {
                                out.print("<li><a>" + customer.getName() + "</a></li>");
                            } else {
                                out.print("<li><a >Guest</a></li>");
                            }
                        %>                    
                </ul>
            </nav>

            <!-- Main -->
            <div id="main">
                <div id='calendar'></div>
                <!-- Post -->

                <section class="post">
                    <form method="post" action="approveBooking" class="alt">
                        <div class="row uniform">
                            <div class="6u 12u(xsmall)">
                                <label for="choeckout">Check-in Date</label>
                                <input type="text" name="checkin" id="start"  value=""  onmouseout="calcPay()"/>
                            </div>
                            <div class="6u 12u(xsmall)">
                                <label for="choeckout">Check-out Date</label>
                                <input type="text" name="checkout" id="end" value="" onmouseout="calcPay()"/>
                            </div>
                            <div class="6u 12u(xsmall)">
                                <label for="homestay">Homestay</label>
                                <input type="text" name="houseName" id="houseName" value="<%=housename%>" placeholder="Homestay" readonly/>
                            </div>
                            <div class="6u 12u(xsmall)">
                                <label for="homestay">Email</label>
                                <input type="text" name="email" id="email" placeholder="Email" />
                            </div>

                            <div class="6u 12u(xsmall)">
                                <label for="homestay">Total Payment (RM)</label>
                                <input type="text" name="totalPay"  id="pay" value="" placeholder="TotalPayment" readonly/>
                            </div>
                            <div class="6u 12u(xsmall)">
                                <label for="homestay">Phone number</label>
                                <input type="text" name="phoneNo"  id="phone" value="" placeholder="Phone Number" />
                            </div>

                            <div class="12u" >
                                <input id="myBtn" class="logo" type="button" value="Submit Booking"/>
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

        <!-- Payment -->
        <div id="myModal" class="modal">

            <!-- Modal content -->
            <div class="modal-content main">
                <span class="close">&times;</span>
                <div class="wrapper">
                    <div class="modal-body">
                        <div class="popup">
                            <iframe id ="frameid" src="BookingModule/Payment/paymentPage.jsp" name="targetframe" allowTransparency="true" scrolling="yes" frameborder="0" width="100%" style="height:50em">
                            </iframe>  
                        </div>
                    </div>
                    <!--                    <form method="post" action="paymentServlet" class="alt">
                                            <div class="row uniform">
                                                <div class="12u" style="text-align: center">
                                                    <label for="username">Payment Detail</label>
                                                </div>
                                                <div class="12u">
                                                    <label for="email">Email</label>
                                                    <input type="text" name="email"/>
                                                </div>
                                                <div class="12u">
                                                    <label for="phone">Phone Number</label>
                                                    <input type="text" name="phone"/>
                                                </div>
                                                <div class="4u 12u(xsmall)">
                                                    <label for="card">Card Number</label>
                                                    <input type="tel" class="form-control" name="cardNumber" placeholder="Valid Card Number" autocomplete="cc-number" required="" autofocus="">
                                                </div>
                                                <div class="4u 12u(xsmall)">
                                                    <label for="expired">Expired Date</label>
                                                    <input type="tel" class="form-control" name="expired" placeholder="MM / YY" autocomplete="cc-exp" required="">
                                                </div>
                                                <div class="4u 12u(xsmall)">
                                                    <label for="cardCVC">Expired Date</label>
                                                    <input type="tel" class="form-control" name="cardCVC" placeholder="CVC" autocomplete="cc-csc" required="">
                                                </div>
                                                <div class="12u" style="text-align:center">
                                                    <input type="submit" value="Login"/>
                                                    <input type="hidden" value="Cancel"/>
                                                    <input type="button" value="Cancel"/>
                                                </div>
                                            </div>
                                        </form>-->
                </div>

            </div>

        </div>

        <!-- end of Payment -->

        <script>
            function calcPay() {
                var start = Date.parse(document.getElementById("start").value);
                var end = Date.parse(document.getElementById("end").value);
                var rate = document.getElementById("rate").value;
                var pay = document.getElementById("pay");
                var diffDays = Math.round(Math.abs((end - start) / (1000 * 60 * 60 * 24)));
                if (String(start) === "NaN" || String(end) === "Nan") {
                    return;
                } else {
                    pay.value = diffDays * rate;
                }


            }
            var modal = document.getElementById("myModal");
            var span = document.getElementsByClassName("close")[0];
            var btn = document.getElementById("myBtn");
            btn.onclick = function () {
                var start = Date.parse(document.getElementById("start").value);
                var end = Date.parse(document.getElementById("end").value);
                var email = document.getElementById("email").value;
                var pay = document.getElementById("pay").value;
                var homestay = "<%=housename%>";
                var contact = document.getElementById("phone").value;
                document.getElementById("frameid").contentWindow.setupValue(start, end, homestay, email, pay, contact);
            <%
//                    Payment payment = new Payment();
//                    SimpleDateFormat sdf1 = new SimpleDateFormat("MM-dd-yyyy");
//                    java.util.Date date = sdf1.parse("<script>document.writeln(start)</script>");
//                    java.sql.Date startDate = new Date(date.getTime());
//                    date = sdf1.parse("<script>document.writeln(end)</script>");
//                    java.sql.Date endDate = new Date(date.getTime());

////                    payment bean
//                    payment.setStartDate(startDate);
//                    payment.setEndDate(endDate);
//                    payment.setHomestay(housename);
//                    payment.setEmail("<script>document.writeln(end)</script>");
//                    payment.setTotalPay(Float.parseFloat("<script>document.writeln(pay)</script>"));
//                    
//                    session.setAttribute("paymentSession", payment);

            %>
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
        <script>

            function closeIFrame() {
                $('#frameid').remove();
                var start = (document.getElementById("start").value);
                var end = (document.getElementById("end").value);
                var email = document.getElementById("email").value;
                var pay = document.getElementById("pay").value;
                var homestay = "<%=housename%>";
                var contact = document.getElementById("phone").value;
                var request = 'houseName='+homestay+'&checkin='+start+'&checkout='+end+'&email='+email+'&totalPay='+pay+'&phone='+contact;
                document.location.href = '${pageContext.request.contextPath}/approveBooking?'+request;
            }

        </script>

    </body>
</html>
