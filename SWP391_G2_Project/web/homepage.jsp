<%-- 
    Document   : homepage
    Created on : Jan 11, 2024, 9:07:37 AM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- saved from url=(0021)https://suustore.com/ -->
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <link rel="preconnect" href="https://fonts.googleapis.com/">
        <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin="">


        <!-- Bootstrap CSS v5.2.1 -->

        <link href="./assets/bootstrap.min.css" rel="stylesheet">

        <link rel="shortcut icon" href="https://suustore.com/assets/frontend/images/favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="./assets/app.css">



        <script>
            window.SuuTruyen = {
                baseUrl: 'https://suustore.com',
                urlCurrent: 'https://suustore.com',
                csrfToken: '4EebYu2rWivdRk1ET12dyuY0CJjpRERhJynPtvUy'
            }
        </script>

        <title>Demo Truyện</title>
        <meta name="description"
              content="Đọc truyện online, truyện hay. Demo Truyện luôn tổng hợp và cập nhật các chương truyện một cách nhanh nhất.">
    </head>

    <body>
        <jsp:include page="Menu.jsp"></jsp:include>


            <main>
                <div class="section-stories-hot mb-3">
                    <div class="container">
                        <div class="row">
                            <div class="head-title-global d-flex justify-content-between mb-2">
                                <div class="col-6 col-md-4 col-lg-4 head-title-global__left d-flex align-items-center">
                                    <h2 class="me-2 mb-0 border-bottom border-secondary pb-1">
                                        <a href="#" class="d-block text-decoration-none text-dark fs-4 story-name"
                                           title="Truyện Hot">Truyện Hot</a>
                                    </h2>
                                    <i class="fa-solid fa-fire-flame-curved"></i>
                                </div>


                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <div class="section-stories-hot__list">
                                <c:forEach items="${book}" var="b">
                                    <div class="story-item">
                                        <a href="book?bookID=${b.bookid}&userID=${user.userID}" class="d-block text-decoration-none">
                                            <div class="story-item__image">
                                                <img src="${b.img}" alt="Tự Cẩm" class="img-fluid" width="150"
                                                     height="230" loading="lazy">
                                            </div>
                                            <h3 class="story-item__name text-one-row story-name">${b.title}</h3>

                                            <div class="list-badge">
                                                <span class="story-item__badge badge text-bg-success">Full</span>

                                                <span
                                                    class="story-item__badge story-item__badge-hot badge text-bg-danger">Hot</span>

                                                <span
                                                    class="story-item__badge story-item__badge-new badge text-bg-info text-light">New</span>

                                            </div>
                                        </a>
                                    </div>
                                </c:forEach>
                                <div class="section-stories-hot__list wrapper-skeleton d-none">
                                    <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                    <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                    <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                    <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                    <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                    <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                    <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                    <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                    <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                    <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                    <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                    <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                    <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                    <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                    <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                    <div class="skeleton" style="max-width: 150px; width: 100%; height: 230px;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row align-items-start">
                        <div class="col-12 col-md-8 col-lg-9">
                            <div class="section-stories-new mb-3">
                                <div class="row">
                                    <div class="head-title-global d-flex justify-content-between mb-2">
                                        <div class="col-6 col-md-4 col-lg-4 head-title-global__left d-flex align-items-center">
                                            <h2 class="me-2 mb-0 border-bottom border-secondary pb-1">
                                                <a href="#"
                                                   class="d-block text-decoration-none text-dark fs-4 story-name"
                                                   title="Truyện Mới">Truyện Mới</a>
                                            </h2>
                                        </div>

                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-12">
                                        <div class="section-stories-new__list">
                                            <c:forEach items="${bookdate}" var="bd">
                                                <div class="story-item-no-image">
                                                    <div class="story-item-no-image__name d-flex align-items-center">
                                                        <h3 class="me-1 mb-0 d-flex align-items-center">

                                                            <svg style="width: 10px; margin-right: 5px;"
                                                                 xmlns="http://www.w3.org/2000/svg" height="1em"
                                                                 viewBox="0 0 320 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. -->
                                                            <path
                                                                d="M278.6 233.4c12.5 12.5 12.5 32.8 0 45.3l-160 160c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3L210.7 256 73.4 118.6c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0l160 160z">
                                                            </path>
                                                            </svg>
                                                            <a href="book?bookID=${bd.bookid}&userID=${user.userID}"
                                                               class="text-decoration-none text-dark fs-6 hover-title text-one-row story-name">${bd.title}</a>
                                                        </h3>
                                                        <span class="badge text-bg-info text-light me-1">New</span>

                                                        <span class="badge text-bg-success text-light me-1">Full</span>

                                                        <span class="badge text-bg-danger text-light">Hot</span>
                                                    </div>

                                                    <div class="story-item-no-image__categories ms-2 d-none d-lg-block">
                                                        <p class="mb-0">
                                                        </p>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 col-md-4 col-lg-3 sticky-md-top">
                            <div class="row">

                                <div class="col-12">
                                    <div class="section-list-category bg-light p-2 rounded card-custom">
                                        <div class="head-title-global mb-2">
                                            <div class="col-12 col-md-12 head-title-global__left">
                                                <h2 class="mb-0 border-bottom border-secondary pb-1">
                                                    <span href="#" class="d-block text-decoration-none text-dark fs-4"
                                                          title="Truyện đang đọc">Thể loại truyện</span>
                                                </h2>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <!-- Horizontal under breakpoint -->
                                            <ul class="list-category">
                                                <c:forEach items="${category}" var="ca">
                                                    <li class="">
                                                        <a href="category?cid=${ca.cateid}" class="text-decoration-none text-dark hover-title">${ca.catename}</a>
                                                    </li>
                                                </c:forEach>

                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="section-stories-full mb-3 mt-3">
                    <div class="container">
                        <div class="row">
                            <div class="head-title-global d-flex justify-content-between mb-2">
                                <div class="col-12 col-md-4 head-title-global__left d-flex">
                                    <h2 class="me-2 mb-0 border-bottom border-secondary pb-1">
                                        <span class="d-block text-decoration-none text-dark fs-4 title-head-name"
                                              title="Truyện đã hoàn thành">Truyện đã hoàn thành</span>
                                    </h2>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <div class="section-stories-full__list">
                                    <c:forEach items="${bookstatus}" var="bs" >
                                        <div class="story-item-full text-center">
                                            <a href="book?bookID=${bs.bookid}&userID=${user.userID}" class="d-block story-item-full__image">
                                                <img src="${bs.img}" alt="Tự Cẩm" class="img-fluid w-100"
                                                     width="150" height="230" loading="lazy">
                                            </a>
                                            <h3 class="fs-6 story-item-full__name fw-bold text-center mb-0">
                                                <a href="#"
                                                   class="text-decoration-none text-one-row story-name">
                                                    ${bs.title}
                                                </a>
                                            </h3>
                                            <span class="story-item-full__badge badge text-bg-success">${bs.status}</span>
                                        </div>  
                                    </c:forEach>    
                                </div>
                            </div>
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

        <script src="./assets/jquery.min.js">
        </script>

        <script src="./assets/popper.min.js">
        </script>

        <script src="./assets/bootstrap.min.js">
        </script>



        <script src="./assets/app.js">
        </script>
        <script src="./assets/common.js"></script>



        <div id="loadingPage" class="loading-full">
            <div class="loading-full_icon">
                <div class="spinner-grow"><span class="visually-hidden">Loading...</span></div>
            </div>
        </div>



    </body>

</html>
