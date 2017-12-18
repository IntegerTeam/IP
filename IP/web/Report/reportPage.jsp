<%-- 
    Document   : graph
    Created on : Dec 16, 2017, 4:14:52 PM
    Author     : jhz
--%>

<%@page import="conn.MySQLQuery"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		<meta name="description" content="Everest Admin Panel" />
		<meta name="keywords" content="Admin, Dashboard, Bootstrap3, Sass, transform, CSS3, HTML5, Web design, UI Design, Responsive Dashboard, Responsive Admin, Admin Theme, Best Admin UI, Bootstrap Theme, Wrapbootstrap, Bootstrap" />
		<meta name="author" content="Bootstrap Gallery" />
		<link rel="shortcut icon" href="img/favicon.ico">
		<title>Homestay</title>
		
		<!-- Bootstrap CSS -->
		<link href="css/bootstrap.css" rel="stylesheet" media="screen">

		<!-- Animate CSS -->
		<link href="css/animate.css" rel="stylesheet" media="screen">

		<!-- Alertify CSS -->
		<link href="css/alertify/alertify.core.css" rel="stylesheet">
		<link href="css/alertify/alertify.default.css" rel="stylesheet">

		<!-- Main CSS -->
		<link href="css/main.css" rel="stylesheet" media="screen">

		<!-- Font Awesome -->
		<link href="fonts/font-awesome.min.css" rel="stylesheet">

		<!-- HTML5 shiv and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
			<script src="js/html5shiv.js"></script>
			<script src="js/respond.min.js"></script>
		<![endif]-->

	</head>  

	<body>

		<!-- Header Start -->
		<header>

			<!-- Main Container Start -->
			<div class="main-container">

				<!-- Container fluid starts -->
				<div class="container-fluid">

					<!-- Spacer Starts -->
					<div class="spacer">


						<!-- Row Starts -->
						<div class="row">
							<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
								<div class="blog">
									<div class="blog-header">
										<h5 class="panel-title">Annual report</h5>
									</div>
									<div class="blog-body">
										<div id="combineChart" class="chart-height"></div>
									</div>
								</div>
							</div>
						</div>
						<!-- Row Ends -->

					</div>
					<!-- Spacer Ends -->

				</div>
				<!-- Container fluid ends -->

			</div>
			<!-- Main Container Start -->


			</div>
			<!-- Right sidebar ends -->

			<!-- Footer Start -->
			<footer>
				Copyright Everest Admin Panel 2014.
			</footer>
			<!-- Footer ends -->
			<!-- Footer end -->

		</div>	
		<!-- Dashboard Wrapper End -->

		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="js/jquery.js"></script>

		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="js/bootstrap.min.js"></script>

		<!-- Sparkline graphs -->
		<script src="js/sparkline.js"></script>

		<!-- jquery ScrollUp JS -->
		<script src="js/scrollup//jquery.scrollUp.js"></script>

		<!-- Notifications JS -->
		<script src="js/alertify/alertify.js"></script>
		<script src="js/alertify/alertify-custom.js"></script>

		<!-- Flot Charts -->
    <script src="js/flot/jquery.flot.js"></script>
    <script src="js/flot/jquery.flot.orderBar.min.js"></script>
    <script src="js/flot/jquery.flot.pie.min.js"></script>
    <script src="js/flot/jquery.flot.stack.min.js"></script>
    <script src="js/flot/jquery.flot.tooltip.min.js"></script>
    <script src="js/flot/jquery.flot.resize.min.js"></script>

    <!-- Custom JS -->
    <script>
        var $border_color = "#eee";
        var $grid_color = "#eee";
        var $default_black = "#666";

        var $info = "#5B90BF";
        var $danger = "#D66061";
        var $warning = "#ffaa3a";
        var $success = "#76BBAD";
        var $yellow = "#ffee00";
        var $facebook = "#4c66a4";
        var $twitter = "#00acee";
        var $linkedin = "#1a85bd";
        var $gplus = "#dc4937";
        var $brown = "#ab7967";

        $(function () { 
            <% 
                String query = "select sum(totalPayment) from booking where year(checkOutDate) = 2017 AND month(checkOutDate) = ";
                float jan = MySQLQuery.getQueryPaymentResult(query + "1;");
                float feb = MySQLQuery.getQueryPaymentResult(query + "2;"); 
                float mar = MySQLQuery.getQueryPaymentResult(query + "3;");
                float apr = MySQLQuery.getQueryPaymentResult(query + "4;");
                float may = MySQLQuery.getQueryPaymentResult(query + "5;"); 
                float jun = MySQLQuery.getQueryPaymentResult(query + "6;");
                float jul = MySQLQuery.getQueryPaymentResult(query + "7;"); 
                float aug = MySQLQuery.getQueryPaymentResult(query + "8;");
                float sep = MySQLQuery.getQueryPaymentResult(query + "9;");
                float obt = MySQLQuery.getQueryPaymentResult(query + "10;");
                 float nov = MySQLQuery.getQueryPaymentResult(query + "11;");
                float dec = MySQLQuery.getQueryPaymentResult(query + "12;");


            %>
//                        var data1 = [
//                                [1561939200000,0], [1554163200000, 0], [1562112000000, 1],
//                                [1559606400000, 80], [1562284800000, 0], [1559779200000, 780],
//                                [1562457600000, 920], [1562544000000, 0], [1560038400000, 1223],
//                                [1562716800000, 1298], [1560211200000, 1485], [1562889600000, 1664]
//                        ];

                        var data2 = [
                            [1485820800000, <%= jan %>], [1488240000000, <%= feb %>], [1490918400000, <%= mar %>],
                            [1493510400000, <%= apr %>], [1496188800000, <%= may %>], [1498780800000, <%= jun %>],
                            [1501459200000, <%= jul %>], [1504137600000, <%= aug %>], [1506729600000, <%= sep %>],
                            [1509408000000, <%= obt %>], [1512000000000, <%= nov %>], [1514678400000, <%= dec %>]
//                                [1354586000000, 93], [1364587000000, 85], [1374588000000, 158],
//                                [1384589000000, 0], [1394590000000, 0], [1404591000000, 0],
//                                [1414592000000, 480], [1424593000000, 374], [1434594000000, 2],
//                                [1444595000000, 1019], [1454596000000, 1138], [1464597000000, 1490]
                        ];

                        var data = [{
//                                label: "Sales",
//                                data: data1,
//                                bars: {
//                                        show: true,
//                                        lineWidth: 1,
//                                        barWidth: 30 * 60 * 60 * 1000 * 80,
//                                        fillColor: { colors: [ { opacity: 0.8 }, { opacity: 0.6 } ] }
//                                }
//                        },{
                                label: "Total Payment",
                                data: data2,
                                lines: {
                                        show: true,
                                        lineWidth: 1.5,
                                        fillColor: { colors: [ { opacity: 0.8 }, { opacity: 0.6 } ] }
                                },
                                points:{
                                        show:true,
                                        radius: 4,
                                        fill: true,
                                        fillColor: "#ffffff",
                                        lineWidth: 1.5
                                }
                        }];

                        var options = {
                                series: {
                                shadowSize: 0,
                                bars: {
                                        lineWidth: 1,
                                        fillColor: { colors: [ { opacity: 0.8 }, { opacity: 0.6 } ] }
                                }
                        },
                        grid: {
                                hoverable: true,
                                clickable: false,
                                borderWidth: 1,
                                tickColor: $border_color,
                                borderColor: $grid_color,
                        },
                        legend:{   
                                show: true,
                                position: 'nw',
                                noColumns: 0,
                        },
                        tooltip: true,
                        tooltipOpts: {
                                content: '%x: %y'
                        },

                        xaxis: {mode: "time", ticks:6, tickDecimals: 0},
                        yaxis: {ticks:6, tickDecimals: 0},

                        colors: [$success, $info, $danger],
                };

                var plot = $.plot($("#combineChart"), data, options);  
        });
    </script>

		<!-- Custom JS -->
		
	</body>
        
</html>