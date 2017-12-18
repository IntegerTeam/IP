<%-- 
    Document   : receiptPage
    Created on : Dec 8, 2017, 2:20:44 PM
    Author     : jhz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    
    <head>
        <meta charset="utf-8">
        <meta name="robots" content="noindex, nofollow">

        <title>Receipt</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <style type="text/css">
            body {
                margin-top: 20px;
            }
        </style>
        <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            window.alert = function () {};
            var defaultCSS = document.getElementById('bootstrap-css');
            function changeCSS(css) {
                if (css)
                    $('head > link').filter(':first').replaceWith('<link rel="stylesheet" href="' + css + '" type="text/css" />');
                else
                    $('head > link').filter(':first').replaceWith(defaultCSS);
            }
            $(document).ready(function () {
                var iframe_height = parseInt($('html').height());
                window.parent.postMessage(iframe_height, 'https://bootsnipp.com');
            });
        </script>
    </head>
    <body style="">
        <div class="container">
            <div class="row">
                <div class="well col-xs-10 col-sm-10 col-md-10 col-xs-offset-1 col-sm-offset-1 col-md-offset-1">
                    <div class="row">
                        <div class="col-xs-6 col-sm-10 col-md-6">
                            <address>
                                <strong>Ordered by:</strong>
                                <br>
                                <% out.println(session.getAttribute("custEmail")); %>
                                <br>
                                <abbr title="Phone">P:</abbr> <% out.println(session.getAttribute("phone")); %>
                            </address>
                        </div>
                        <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                            <p>
                                <em>Receipt #: 34522677W</em>
                            </p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="text-center">
                            <h1>Receipt</h1>
                        </div>

                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Homestay</th>
                                    <th>Check In</th>
                                    <th class="text-center">Check Out</th>
                                    <th class="text-center">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="col-md-7"><em><% out.println(session.getAttribute("homestay")); %></em></td>
                                    <td class="col-md-2" style="text-align: center"><% out.println(session.getAttribute("sqlStartDate")); %></td>
                                    <td class="col-md-2 text-center"><% out.println(session.getAttribute("sqlEndDate"));%></td>
                                    <td class="col-md-1 text-center"><% out.println(session.getAttribute("totalPay")); %></td>
                                </tr>
                                <tr>
                                    <td> &nbsp; </td>
                                    <td> &nbsp; </td>
                                    <td class="text-right">
                                        <p>
                                            <strong>Subtotal:&nbsp;</strong>
                                        </p>
                                        <p>
                                            <strong>Tax:&nbsp;</strong>
                                        </p></td>
                                    <td class="text-center">
                                        <p>
                                            <strong>$<% out.println(session.getAttribute("totalPay")); %></strong>
                                        </p>
                                        <p>
                                            <strong>$0</strong>
                                        </p></td>
                                </tr>
                                <tr>
                                    <td> &nbsp; </td>
                                    <td> &nbsp; </td>
                                    <td class="text-right"><h4><strong>Total:&nbsp;</strong></h4></td>
                                    <td class="text-center text-danger"><h4><strong>$<% out.println(session.getAttribute("totalPay")); %></strong></h4></td>
                                </tr>
                            </tbody>
                        </table>
<!--                        <button type="button" class="btn btn-success btn-lg btn-block">
                            Pay Now&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-chevron-right"></span>
                        </button>-->
                    </div>
                </div>
            </div>
            <script type="text/javascript">

            </script>


        </div>
    </body>
</html>
