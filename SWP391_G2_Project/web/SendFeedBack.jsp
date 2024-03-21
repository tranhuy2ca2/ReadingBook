<%-- 
    Document   : Edit
    Created on : Oct 21, 2023, 8:56:02 PM
    Author     : TTT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Colorlib Templates">
        <meta name="author" content="Colorlib">
        <meta name="keywords" content="Colorlib Templates">

        <!-- Title Page-->
        <title>Au Register Forms by Colorlib</title>

        <!-- Icons font CSS-->
        <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
        <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
        <!-- Font special for pages-->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

        <!-- Vendor CSS-->
        <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
        <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

        <!-- Main CSS-->
        <link href="css/main.css" rel="stylesheet" media="all">
    </head>

    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
                <div class="wrapper wrapper--w790">
                    <div class="card card-5">
                        <div class="card-heading">
                            <h2 class="title">Send FeedBack</h2>
                        </div>
                        <div class="card-body">
                            <form action="sendfeedback" method="post" onsubmit="return validateForm()">
                                <div class="form-row">
                                    <div class="name">Name</div>
                                    <div class="value">
                                        <div class="input-group">
                                            <input value="${user.userName}" class="input--style-5"  type="text" name="name" readonly="">
                                        <input style="display: none" value="${user.userID}" class="input--style-5"  type="text" name="userID" readonly="">
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="name">Report Type</div>
                                <div class="value">
                                    <div class="input-group">
                                        <div class="rs-select2 js-select-simple select--no-search">
                                            <select name="report" required="">
                                                <c:forEach items="${listC}" var="o">
                                                    <option value="${o.reportID}">${o.reportType}</option>
                                                </c:forEach>
                                            </select>
                                            <div class="select-dropdown"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="name">Description</div>
                                <div class="value">
                                    <div class="input-group">
                                        <textarea style="background-color: #e5e5e5" id="description" name="description" rows="5" cols="10" minlength="10" 
                                                  maxlength="100" required></textarea>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <button style="background-color: red; color: white" class="btn btn--radius-2 btn--red" type="submit">Send</button>
                                <button style="background-color: red; color: white" class="btn btn--radius-2 btn--red" type="reset">Cancel</button>
                            </div>
                        </form>
                        <script>
                            function validateForm() {
                                var detail = document.getElementById("description").value.trim();

                                if (detail === "") {
                                    alert("Please fill out all required fields.");
                                    return false;
                                }else{
                                    alert("Send FeedBack Successfull !!.");
                                    return true;
                                }                                
                            }
                        </script>
                    </div>
                </div>
            </div>
        </div>

        <!-- Jquery JS-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <!-- Vendor JS-->
        <script src="vendor/select2/select2.min.js"></script>
        <script src="vendor/datepicker/moment.min.js"></script>
        <script src="vendor/datepicker/daterangepicker.js"></script>

        <!-- Main JS-->
        <script src="js/global.js"></script>
    </body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->