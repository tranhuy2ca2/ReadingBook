<%-- 
    Document   : Profile
    Created on : Jan 19, 2024, 8:31:14 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <link href="./assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" >
        <link href="./assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="./assets/css/style.css" rel="stylesheet">
        <style>
            .profile .profile-card img {
                max-width: 300px;
            }
            .profile .profile-edit img {
                max-width: 300px;
            }
        </style>
        <link href="./assets/bootstrap.min.css" rel="stylesheet"/>
        <link href="./assets/jumbotron-narrow.css" rel="stylesheet">      
        <script src="./assets/jquery-1.11.3.min.js"></script>
    </head>

    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <!-- ======= Sidebar ======= -->
            <aside style="margin-top: 80px" id="sidebar" class="sidebar">

                <ul class="sidebar-nav" id="sidebar-nav">

                    <li class="nav-item">
                        <i class="bi bi-grid"></i>
                        <span>Dashboard</span>
                    </li><!-- End Dashboard Nav -->

                    <li class="nav-item">
                        <a class="nav-link " href="profile">
                            <i class="bi bi-person"></i>
                            <span>Profile</span>
                        </a>
                    </li><!-- End Profile Page Nav -->
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="postbook">
                            <i class="bi bi-envelope"></i>
                            <span>Ðăng truyện</span>
                        </a>
                    </li><!-- End Contact Page Nav -->
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="mylist?creator=${user.userID}">
                        <i class="bi bi-envelope"></i>
                        <span>Danh sách truyện</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="managerchapter?creator=${user.userID}">
                        <i class="bi bi-envelope"></i>
                        <span>Quản lý chapter</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link collapsed" href="transactionhistory?userID=${user.userID}">
                        <i class="bi bi-envelope"></i>
                        <span>Lịch Sử Giao Dịch</span>
                    </a>
                </li>
        </aside><!-- End Sidebar-->

        <main style="margin-top: 4px" id="main" class="main">

            <div class="pagetitle">
                <h1>Profile</h1>
            </div><!-- End Page Title -->

            <section class="section profile">
                <div class="row">
                    <div class="col-xl-4">

                        <div class="card">
                            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
                                <img src="${user.avatar==null?"./images/defaultavatar.png":user.avatar}" width="290px" height="200px" >
                                <h6 style="margin-top: 10px" class="f-w-600">${user.userName}</h6>
                                <p>${role}</p>
                            </div>
                        </div>

                    </div>

                    <div class="col-xl-8">

                        <div class="card">
                            <div class="card-body pt-3">
                                <!-- Bordered Tabs -->
                                <ul class="nav nav-tabs nav-tabs-bordered">

                                    <li class="nav-item">
                                        <button class="nav-link active" data-bs-toggle="tab"
                                                data-bs-target="#profile-overview">Profile Details</button>
                                    </li>

                                    <li class="nav-item">
                                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">Edit Profile</button>
                                    </li>

                                    <li class="nav-item">
                                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">Change
                                            Password</button>
                                    </li>
                                    <li class="nav-item">
                                        <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-rechargemoney">Nạp tiền</button>
                                    </li>

                                </ul>
                                <div class="tab-content pt-2">
                                    <div class="tab-pane fade show active profile-overview" id="profile-overview">
                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Email</div>
                                            <div class="col-lg-9 col-md-8">${user.email==null?"Chưa có email":user.email}</div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Address</div>
                                            <div class="col-lg-9 col-md-8">${user.address==null?"Chưa có địa chỉ":user.address}</div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Phone</div>
                                            <div class="col-lg-9 col-md-8">${user.phone==null?"Chưa có số điện thoại":user.phone}</div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-3 col-md-4 label">Số Dư Trong Tài Khoản</div>
                                            <!--                                            <div class="col-lg-9 col-md-8">
                                            ${user.transaction == null ? "Chưa có" : user.transaction}
                                        </div>-->
                                            <div class="col-lg-9 col-md-8">
                                                <c:choose>
                                                    <c:when test="${empty user.transaction}">
                                                        Chưa có
                                                    </c:when>
                                                    <c:otherwise>
                                                        <fmt:formatNumber value="${user.transaction}" pattern="#,##0"/> đ
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                        <form action="withdraw" id="frmCreateOrder" method="post" onsubmit="return validateWithdraw()">  
                                            <div class="row mb-3" style="display:none">
                                                <label for="Email" class="col-md-4 col-lg-3 col-form-label">UserID</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="userID" type="text" class="form-control" id="Email" value="${user.userID==null?"Chưa có email":user.userID}" readonly="">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="amount">Nhập số tiền muốn rút</label>
                                                <input class="form-control" data-val="true" data-val-number="The field Amount must be a number." 
                                                       data-val-required="The Amount field is required." 
                                                       id="amount" max="10000000" min="10000" name="amount" type="number" value="10000" required=""/>
                                            </div>
                                            <button style="margin-top:10px" type="submit" class="btn btn-primary">Rút tiền</button>
                                        </form>
                                    </div>
                                    <script>
                                        function validateWithdraw() {
                                            var amountInput = document.getElementById("amount");
                                            var amount = parseInt(amountInput.value);
                                            var balance = ${user.transaction}; // Số dư trong tài khoản

                                            if (amount > balance) {
                                                alert("Số dư trong tài khoản không đủ!");
                                                return false; // Ngăn form được gửi đi
                                            }
                                            // Nếu số dư đủ, cho phép gửi form
                                            return true;
                                        }
                                    </script>
                                    <div class="tab-pane fade profile-edit pt-3" id="profile-edit">
                                        <!-- Profile Edit Form -->
                                        <form action="updateprofile" method="post" enctype="multipart/form-data">
                                            <!-- Avatar -->
                                            <div class="row mb-3">
                                                <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">Profile Image</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <img src="${user.avatar==null?"./images/defaultavatar.png":user.avatar}" alt="Profile" width="300px" height="200px"><br>
                                                    <input style="margin-top: 10px; margin-bottom: 10px" name="file" type="file" class="form-control" id="Email" value="${user.avatar==null?"":user.avatar}">
                                                </div>
                                            </div>

                                            <div class="row mb-3" style="display: none">
                                                <label for="Email" class="col-md-4 col-lg-3 col-form-label">UserID</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="userID" type="text" class="form-control" id="Email" value="${user.userID==null?"Chưa có email":user.userID}" readonly="">
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <label for="Email" class="col-md-4 col-lg-3 col-form-label">Email</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="email" type="email" class="form-control" id="Email" value="${user.email==null?"Chưa có email":user.email}">
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <label for="Email" class="col-md-4 col-lg-3 col-form-label">Address</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="address" type="text" class="form-control" id="Email" value="${user.address==null?"Chưa có email":user.address}">
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <label for="phone" class="col-md-4 col-lg-3 col-form-label">Phone</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input name="phone" type="text" class="form-control" id="phone" value="${user.phone == null ? 'Chưa có điện thoại' : user.phone}" pattern="[0-9]{9,11}" title="Vui lòng nhập số điện thoại hợp lệ (từ 9 đến 11 số)" minlength="9" maxlength="11" required>
                                                </div>
                                            </div>



                                            <div class="text-center">
                                                <button type="submit" class="btn btn-primary">Save Changes</button>
                                            </div>
                                        </form><!-- End Profile Edit Form -->
                                    </div>

                                    <div class="tab-pane fade pt-3" id="profile-settings">
                                    </div>

                                    <div class="tab-pane fade pt-3" id="profile-change-password">
                                        <!-- Change Password Form -->
                                        <form id="changePasswordForm" action="changepass" method="post" onsubmit="return validateForm()">
                                            <div style="display:none">
                                                <label for="currentPassword">Old Password:</label>
                                                <div class="password-container">
                                                    <input type="text" name="oldpassword" value="${user.password}" readonly="">
                                                </div>
                                            </div>
                                            <div style="display:none">
                                                <label for="currentPassword">ID User:</label>
                                                <div class="password-container">
                                                    <input type="text" name="uID" value="${user.userID}" readonly>
                                                </div>
                                            </div>
                                            <div class="row mb-3">
                                                <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Current Password</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input class="form-control" type="password" id="currentPassword" name="oldpass" required>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">New Password</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input class="form-control" type="password" id="newPassword" name="newpass" minlength="6" required>
                                                </div>
                                            </div>

                                            <div class="row mb-3">
                                                <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Re-enter New Password</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <input class="form-control" type="password" id="confirmPassword" name="confirm" minlength="6" required>
                                                </div>
                                            </div>

                                            <div class="text-center">
                                                <button type="submit" class="btn btn-primary">Change Password</button>
                                            </div>
                                        </form>
                                        <script>
                                            function validateForm() {
                                                var newPassword = document.getElementById("newPassword").value.trim();

                                                if (newPassword === "") {
                                                    alert("Do not enter spaces.");
                                                    return false;
                                                }

                                                return true;
                                            }
                                        </script><!-- End Change Password Form -->                                        
                                    </div>
                                    <div class="tab-pane fade pt-3" id="profile-rechargemoney">
                                        <!-- Rechagre Money Form -->
                                        <h3>Nạp tiền vào tài khoản</h3>                                       
                                        <div class="table-responsive">
                                            <form action="rechargemoney" id="frmCreateOrder1" method="post">  
                                                <div class="row mb-3" style="display:none">
                                                    <label for="Email" class="col-md-4 col-lg-3 col-form-label">UserID</label>
                                                    <div class="col-md-8 col-lg-9">
                                                        <input name="userID" type="text" class="form-control" id="Email" value="${user.userID==null?"Chưa có email":user.userID}" readonly="">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="amount">Số tiền nạp</label>
                                                    <input class="form-control" data-val="true" data-val-number="The field Amount must be a number." 
                                                           data-val-required="The Amount field is required." 
                                                           id="amount" max="10000000" min="10000" name="amount" type="number" value="10000" required=""/>
                                                </div>
                                                <button style="margin-top:30px" type="submit" class="btn btn-primary">Thanh toán</button>
                                            </form>
                                        </div>
                                        <p>
                                            &nbsp;
                                        </p>
                                        <footer class="footer">
                                            <p>&copy; VNPAY 2020</p>
                                        </footer>
                                    </div>

                                </div><!-- End Bordered Tabs -->
                                <%
                                String mess = (String) request.getAttribute("mess");
                                if (mess != null && !mess.isEmpty()) {
                                %>
                                <div class="alert alert-danger" role="alert">
                                    <%= mess %>
                                </div>
                                <%
                                }
                                %>      
                            </div>
                        </div>

                    </div>
                </div>
            </section>

        </main><!-- End #main -->
        <div id="footer" class="footer border-top pt-2">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-md-5">
                        <strong>Suu Truyện</strong> - <a title="Đọc truyện online" class="text-dark text-decoration-none"
                                                         href="#">Đọc truyện</a> online một cách nhanh nhất. Hỗ trợ mọi thiết bị như
                        di
                        động và máy tính bảng.
                    </div>
                    <ul class="col-12 col-md-7 list-unstyled d-flex flex-wrap list-tag">
                        <c:forEach items="${category}" var="ca">
                            <li class="me-1">
                                <span class="badge text-bg-light"><a class="text-dark text-decoration-none"
                                                                     href="category?cid=${ca.cateid}">${ca.catename}</a></span>
                            </li>
                        </c:forEach>
                    </ul>

                    <div class="col-12"> <a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img
                                alt="Creative Commons License" style="border-width:0;margin-bottom: 10px"
                                src="./assets/images/88x31.png"></a><br>
                        <p>Website hoạt động dưới Giấy phép truy cập mở <a rel="license"
                                                                           class="text-decoration-none text-dark hover-title"
                                                                           href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0
                                International License</a></p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Vendor JS Files -->
        <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <link href="https://pay.vnpay.vn/lib/vnpay/vnpay.css" rel="stylesheet" />
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script type="text/javascript">
                                            $("#frmCreateOrder").submit(function () {
                                                var postData = $("#frmCreateOrder").serialize();
                                                var submitUrl = $("#frmCreateOrder").attr("action");
                                                $.ajax({
                                                    type: "POST",
                                                    url: submitUrl,
                                                    data: postData,
                                                    dataType: 'JSON',
                                                    success: function (x) {
                                                        if (x.code === '00') {
                                                            if (window.vnpay) {
                                                                vnpay.open({width: 768, height: 600, url: x.data});
                                                            } else {
                                                                location.href = x.data;
                                                            }
                                                            return false;
                                                        } else {
                                                            alert(x.Message);
                                                        }
                                                    }
                                                });
                                                return false;
                                            });
                                            $("#frmCreateOrder1").submit(function () {
                                                var postData = $("#frmCreateOrder1").serialize();
                                                var submitUrl = $("#frmCreateOrder1").attr("action");
                                                $.ajax({
                                                    type: "POST",
                                                    url: submitUrl,
                                                    data: postData,
                                                    dataType: 'JSON',
                                                    success: function (x) {
                                                        if (x.code === '00') {
                                                            if (window.vnpay) {
                                                                vnpay.open({width: 768, height: 600, url: x.data});
                                                            } else {
                                                                location.href = x.data;
                                                            }
                                                            return false;
                                                        } else {
                                                            alert(x.Message);
                                                        }
                                                    }
                                                });
                                                return false;
                                            });
        </script>

    </body>
</html>
