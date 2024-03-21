<%-- 
    Document   : ThreadDetail
    Created on : Mar 13, 2024, 3:29:43 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta charset="utf-8">
        <title>Report</title>
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
            .comment-thread {
                width: 100%;
                max-width: 600px;
                margin: 0 auto;
                font-family: Arial, sans-serif;
            }

            .comment {
                margin-bottom: 15px;
                padding: 10px;
                background-color: #f2f2f2;
                border-radius: 5px;
            }

            .username {
                display: block;
                font-size: 14px;
                font-weight: bold;
                color: #333;
                margin-bottom: 5px;
            }

            .comment-text {
                font-size: 14px;
                line-height: 1.5;
                color: #333;
            }
            .avatar {
                width: 40px;
                height: 40px;
                object-fit: cover;
                border-radius: 50%;
                margin-right: 10px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <aside style="margin-top: 46px" id="sidebar" class="sidebar">

                <ul class="sidebar-nav" id="sidebar-nav">

                    <li class="nav-item">
                        <i class="bi bi-grid"></i>
                        <span>Dashboard</span>
                    </li><!-- End Dashboard Nav -->

                    <li class="nav-item">
                        <a class="nav-link collapsed" href="viewallforum">
                            <i class="bi bi-envelope"></i>
                            <span>Bài mới nhất</span>
                        </a>
                    </li><!-- End Contact Page Nav -->
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="savedforum">
                            <i class="bi bi-envelope"></i>
                            <span>Bài đã lưu</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link collapsed" href="myforum">
                            <i class="bi bi-envelope"></i>
                            <span>Bài của tôi</span>
                        </a>
                    </li>

            </aside><!-- End Sidebar-->


            <main style="margin-top: 4px" id="main" class="main">
                <div class="comment-thread">
                    <div class="comment">
                        <img src="${threadDetail.avatar==null?"./images/defaultavatar.png":user.avatar}" alt="alt" class="avatar"/>
                    <div></div>
                    <div class="comment-content">
                        <span class="username">${threadDetail.title} - đăng vào lúc ${threadDetail.publishDate}</span>
                        <p class="comment-text">
                            ${threadDetail.detail}
                        </p>
                    </div>
                </div>
            </div>


        </main>
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

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>
    </body>
</html>
