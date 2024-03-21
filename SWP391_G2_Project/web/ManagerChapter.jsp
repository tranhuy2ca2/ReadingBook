<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta charset="utf-8">
        <title>My List Comic</title>
        <link href="./assets/vendor/simple-datatables/style.css" rel="stylesheet">
        <link href="./assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="./assets/css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="css/ManagerProduct.css">
        <style>
            .table td {
                width: 20%; /* Đặt chiều rộng 20% cho mỗi cột */
            }
            .detail {
                /* Điều chỉnh kích cỡ nội dung trong cột Detail */
                font-size: 13px;
            }
        </style>
    </head>

    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <!-- ======= Sidebar ======= -->
            <aside style="margin-top: 46px" id="sidebar" class="sidebar">

                <ul class="sidebar-nav" id="sidebar-nav">

                    <li class="nav-item">
                        <i class="bi bi-grid"></i>
                        <span>Dashboard</span>
                    </li><!-- End Dashboard Nav -->

                    <li class="nav-item">
                        <a class="nav-link collapsed" href="profile">
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
                    <a class="nav-link " href="managerchapter?creator=${user.userID}">
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
        </aside>


        <main style="margin-top: 4px" id="main" class="main">

            <div class="pagetitle">
                <h1>Manager chapter</h1>
            </div><!-- End Page Title -->
            <section class="section">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">

                            <div class="card-body">

                                <table class="table datatable">
                                    <thead>
                                        <tr>
                                            <th>Tên Truyện</th>
                                            <th >Hình Ảnh</th>
                                            <th>Tên người dịch</th>
                                            <th data-type="date" data-format="YYYY/DD/MM">Publish Date</th>
                                        </tr>
                                    </thead>                                        
                                    <tbody>
                                        <c:forEach items="${book}" var="b">
                                            <tr>
                                                <td class="title">${b.title} <br> 
                                                    <a href="addchapter?bookID=${b.bookid}" class="btn btn-secondary btn-sm mb-1 mr-md-1">Thêm Chương</a>
                                                    <a href="listchapter?bookID=${b.bookid}"class="btn btn-secondary btn-sm mb-1 mr-md-1">Chương truyện</a>
                                                    <a href="book?bookID=${b.bookid}" class="btn btn-secondary btn-sm mb-1 mr-md-1">Trang truyện</a>
                                                </td>
                                                <td class="image"><img src="${b.img}" width="100px" ></td>
                                                <td class="creator">${user.userName}</td>
                                                <td class="publishDate">${b.publishDate}</td>     
                                            </tr>
                                        </c:forEach>
                                    </tbody>

                                </table>

                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </main>
        <footer id="footer" class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-md-5">
                        <strong>Suu Truyện</strong> - <a title="Đọc truyện online" class="text-dark text-decoration-none"
                                                         href="#">Đọc truyện</a> online một cách nhanh nhất. Hỗ trợ mọi thiết bị như
                        di
                        động và máy tính bảng.
                    </div>
                    <ul class="col-12 col-md-7 list-unstyled d-flex flex-wrap list-tag">
                        <li class="me-1">
                            <span class="badge text-bg-light"><a class="text-dark text-decoration-none"
                                                                 href="#" title="đam mỹ hài">đam mỹ
                                    hài</a></span>
                        </li>
                        <li>
                            <span class="badge text-bg-light"><a class="text-dark text-decoration-none"
                                                                 href="#" title="truyện xuyên nhanh">truyện
                                    xuyên
                                    nhanh</a></span>
                        </li>
                        <li class="me-1">
                            <span class="badge text-bg-light"><a class="text-dark text-decoration-none"
                                                                 href="#" title="đam mỹ hài">đam mỹ
                                    hài</a></span>
                        </li>
                        <li>
                            <span class="badge text-bg-light"><a class="text-dark text-decoration-none"
                                                                 href="#" title="truyện xuyên nhanh">truyện
                                    xuyên
                                    nhanh</a></span>
                        </li>
                        <li class="me-1">
                            <span class="badge text-bg-light"><a class="text-dark text-decoration-none"
                                                                 href="#" title="đam mỹ hài">đam mỹ
                                    hài</a></span>
                        </li>
                        <li>
                            <span class="badge text-bg-light"><a class="text-dark text-decoration-none"
                                                                 href="#" title="truyện xuyên nhanh">truyện
                                    xuyên
                                    nhanh</a></span>
                        </li>
                        <li class="me-1">
                            <span class="badge text-bg-light"><a class="text-dark text-decoration-none"
                                                                 href="#" title="đam mỹ hài">đam mỹ
                                    hài</a></span>
                        </li>
                        <li>
                            <span class="badge text-bg-light"><a class="text-dark text-decoration-none"
                                                                 href="#" title="truyện xuyên nhanh">truyện
                                    xuyên
                                    nhanh</a></span>
                        </li>
                        <li class="me-1">
                            <span class="badge text-bg-light"><a class="text-dark text-decoration-none"
                                                                 href="#" title="đam mỹ hài">đam mỹ
                                    hài</a></span>
                        </li>
                        <li>
                            <span class="badge text-bg-light"><a class="text-dark text-decoration-none"
                                                                 href="#" title="truyện xuyên nhanh">truyện
                                    xuyên
                                    nhanh</a></span>
                        </li>
                        <li class="me-1">
                            <span class="badge text-bg-light"><a class="text-dark text-decoration-none"
                                                                 href="#" title="đam mỹ hài">đam mỹ
                                    hài</a></span>
                        </li>
                        <li>
                            <span class="badge text-bg-light"><a class="text-dark text-decoration-none"
                                                                 href="#" title="truyện xuyên nhanh">truyện
                                    xuyên
                                    nhanh</a></span>
                        </li>
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
        </footer>
        <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
        <script src="assets/vendor/tinymce/tinymce.min.js"></script>
        <script src="assets/js/main.js"></script>
        <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/chart.js/chart.umd.js"></script>
        <script src="assets/vendor/echarts/echarts.min.js"></script>
        <script src="assets/vendor/quill/quill.min.js"></script>
        <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
        <script src="assets/vendor/tinymce/tinymce.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <script src="assets/js/main.js"></script>
    </body>

</html>