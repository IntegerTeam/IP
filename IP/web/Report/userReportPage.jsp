<%-- 
    Document   : userReportPage
    Created on : Dec 18, 2017, 11:30:46 PM
    Author     : jhz
--%>

<%@page import="conn.MySQLQuery"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
            <!-- Bootstrap Core CSS -->
            <link href="bootstrap/min.css" rel="stylesheet" type="text/css"/>
            <link href="bootstrap/admin2.css" rel="stylesheet" type="text/css"/>
            <link href="bootstrap/awesome.css" rel="stylesheet" type="text/css"/>
            <link href="bootstrap/mentisMenu.css" rel="stylesheet" type="text/css"/>
            <link href="bootstrap/moris.css" rel="stylesheet" type="text/css"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
        <style>
            html,body{
                margin: 0;
            }
        </style>
    </head>
    <body>
        <div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-bell fa-fw"></i>Panel
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <div class="list-group">
                    <a href="#" class="list-group-item">
                        <span class="glyphicon glyphicon-user"></span> <%out.println(MySQLQuery.getQuerytResult(("Select COUNT(*) from customer;"),true));%> Active User 
                        <span class="pull-right text-muted small">
                        </span>
                    </a>
                    <a href="#" class="list-group-item">
                        <span class="glyphicon glyphicon-user"></span> <%out.println(MySQLQuery.getQuerytResult(("Select COUNT(*) from homestay;"),true));%> Homestay
                        <span class="pull-right text-muted small">
                        </span>
                    </a>
                    <a href="#" class="list-group-item">
                        <span class="glyphicon glyphicon-book"></span> <%out.println(MySQLQuery.getQuerytResult("Select COUNT(*) from booking;",true));%> Booking
                        <span class="pull-right text-muted small">
                        </span>
                    </a>

<!--                    <a href="#" class="list-group-item">
                        <i class="fa fa-upload fa-fw"></i> Server Rebooted
                        <span class="pull-right text-muted small"><em>11:32 AM</em>
                        </span>
                    </a>
                    <a href="#" class="list-group-item">
                        <i class="fa fa-bolt fa-fw"></i> Server Crashed!
                        <span class="pull-right text-muted small"><em>11:13 AM</em>
                        </span>
                    </a>
                    <a href="#" class="list-group-item">
                        <i class="fa fa-warning fa-fw"></i> Server Not Responding
                        <span class="pull-right text-muted small"><em>10:57 AM</em>
                        </span>
                    </a>
                    <a href="#" class="list-group-item">
                        <i class="fa fa-shopping-cart fa-fw"></i> New Order Placed
                        <span class="pull-right text-muted small"><em>9:49 AM</em>
                        </span>
                    </a>
                    <a href="#" class="list-group-item">
                        <i class="fa fa-money fa-fw"></i> Payment Received
                        <span class="pull-right text-muted small"><em>Yesterday</em>
                        </span>
                    </a>
                </div>
                 /.list-group 
                <a href="#" class="btn btn-default btn-block">View All Alerts</a>
            </div>
             /.panel-body -->
        </div>

    </body>
</html>
