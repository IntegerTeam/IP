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
        <link rel="stylesheet" href="assets/css/main.css" />
        <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
        <%
            String housename = request.getParameter("housename");
            int rate = Integer.valueOf(request.getParameter("rate"));
        %>


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
                    <li><a href="" >Guest</a></li>
                </ul>
            </nav>

            <!-- Main -->
            <div id="main">

                <!-- Post -->

                <section class="post">
                    <form method="post" action="approveBooking" class="alt">
                        <div class="row uniform">
                            <div class="6u 12u$(xsmall)">
                                <label for="choeckout">Check-in Date</label>
                                <input type="date" name="checkin" id="start"  value=""  onmouseout="calcPay()"/>
                            </div>
                            <div class="6u$ 12u$(xsmall)">
                                <label for="choeckout">Check-out Date</label>
                                <input type="date" name="checkout" id="end" value="" onmouseout="calcPay()"/>
                            </div>
                            <div class="6u 12u$(xsmall)">
                                <label for="homestay">Homestay</label>
                                <input type="text" name="houseName" value="<%=housename%>" placeholder="Homestay" disabled/>
                            </div>
                            <div class="6u$ 12u$(xsmall)">
                                <label for="homestay">Email</label>
                                <input type="text" name="email"  value="" placeholder="Email" />
                            </div>

                            <div class="6u 12u$(xsmall)">
                                <label for="homestay">Total Payment (RM)</label>
                                <input type="text" name="totalPay"  id="pay" value="" placeholder="TotalPayment" disabled/>
                            </div>
                            <div class="6u$ 12u$(xsmall)">
                                <label for="homestay">Phone number</label>
                                <input type="text" name="phoneNo"  value="" placeholder="Phone Number" />
                            </div>

                            <div class="12u$" >
                                <input type="submit" value="Submit Booking"/>
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

        <script>
            function calcPay() {
                var start = Date.parse(document.getElementById("start").value);
                var end = Date.parse(document.getElementById("end").value);
                var rate = document.getElementById("rate").value;
                var pay = document.getElementById("pay");
                var diffDays = Math.round(Math.abs((end - start) / (1000 * 60 * 60 * 24)));
                
                if(String(start) === "NaN" || String(end) === "Nan"){
                    return;
                }else{
                    pay.value = diffDays*rate;
                }


            }
        </script>
        <!-- Scripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/jquery.scrollex.min.js"></script>
        <script src="assets/js/jquery.scrolly.min.js"></script>
        <script src="assets/js/skel.min.js"></script>
        <script src="assets/js/util.js"></script>
        <script src="assets/js/main.js"></script>

    </body>
</html>