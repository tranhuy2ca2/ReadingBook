<%-- 
    Document   : ThreadDetail
    Created on : Mar 13, 2024, 3:29:43 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            * {
                box-sizing: border-box;
            }

            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                margin: 0;
                padding: 0;
            }

            .post-form-container {
                width: 100%;
                max-width: 600px;
                margin: 50px auto;
                background-color: #fff;
                border-radius: 5px;
                padding: 30px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            .post-form-title {
                text-align: center;
                font-size: 24px;
                font-weight: bold;
                color: #333;
                margin-bottom: 30px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-label {
                display: block;
                font-size: 14px;
                font-weight: bold;
                color: #333;
                margin-bottom: 5px;
            }

            .form-input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 14px;
                line-height: 1.5;
                color: #333;
            }

            .form-input:focus {
                outline: none;
                box-shadow: 0 0 2px 1px rgba(0, 123, 255, 0.2);
            }

            .form-textarea {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 12px;
                line-height: 1.5;
                color: #333;
                resize: vertical;
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


            <div class="post-form-container">
                <h1 class="post-form-title">POST</h1>
            <c:if test="${update==null}">
                <form class="post-form" method="post" action="createthread">
                    <input type="hidden" name="userID" value="${user.userID}">
                    <div class="form-group">
                        <label for="name" class="form-label">Tiêu đề</label>
                        <input type="text" id="name" class="form-input" name="title" required>
                    </div>
                    <div class="form-group">
                        <label for="comment" class="form-label">Nội dung</label>
                        <textarea id="comment" class="form-textarea" name="detail" required></textarea>
                    </div>
                    <button type="submit" class="post-form-button">Đăng bài</button>
                </form>
            </c:if>
            <c:if test="${update!=null}">
                <form class="post-form" method="post" action="updatethread">
                    <input type="hidden" name="threadId" value="${thread.threadID}">
                    <div class="form-group">
                        <label for="name" class="form-label">Tiêu đề</label>
                        <input type="text" id="name" class="form-input" name="title" value="${thread.title}" required>
                    </div>
                    <div class="form-group">
                        <label for="comment" class="form-label">Nội dung</label>
                        <textarea id="comment" class="form-textarea" name="detail" required>${thread.detail}</textarea>

                    </div>
                    <button type="submit" class="post-form-button">Cập nhật</button>
                </form>
            </c:if>
        </div>
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
