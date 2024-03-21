<%-- 
    Document   : Book
    Created on : Jan 15, 2024, 9:32:27 PM
    Author     : ADMIN
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

                <input type="hidden" id="story_slug" value="nang-khong-muon-lam-hoang-hau">
                <div class="container">
                    <div class="row align-items-start">
                        <div class="col-12 col-md-7 col-lg-8">
                            <div class="head-title-global d-flex justify-content-between mb-4">
                                <div class="col-12 col-md-12 col-lg-4 head-title-global__left d-flex">
                                    <h2 class="me-2 mb-0 border-bottom border-secondary pb-1">
                                        <span class="d-block text-decoration-none text-dark fs-4 title-head-name"
                                              title="Thông tin truyện">Thông
                                            tin truyện</span>
                                    </h2>
                                </div>
                            </div>

                            <div class="story-detail">
                                <div class="story-detail__top d-flex align-items-start">
                                    <div class="row align-items-start">
                                        <div class="col-12 col-md-12 col-lg-3 story-detail__top--image">
                                            <div class="book-3d">
                                                <img src="${book.img}"
                                                 alt="Nàng Không Muốn Làm Hoàng Hậu" class="img-fluid w-100" width="200px" height="300px" loading="lazy">
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-12 col-lg-9">
                                        <h3 class="text-center story-name">${book.title}</h3>
                                        <div class="rate-story mb-2">
                                            <div class="rate-story__holder" data-score="7.0">
                                                <img alt="1" src="./assets/images/star-on.png">
                                                <img alt="2" src="./assets/images/star-on.png">
                                                <img alt="3" src="./assets/images/star-on.png">
                                                <img alt="4" src="./assets/images/star-on.png">
                                                <img alt="5" src="./assets/images/star-on.png">
                                                <img alt="6" src="./assets/images/star-on.png">
                                                <img alt="7" src="./assets/images/star-half.png">
                                                <img alt="8" src="./assets/images/star-off.png">
                                                <img alt="9" src="./assets/images/star-off.png">
                                                <img alt="10" src="./assets/images/star-off.png">
                                            </div>
                                            <em class="rate-story__text"></em>
                                            <div class="rate-story__value" itemprop="aggregateRating" itemscope=""
                                                 itemtype="https://schema.org/AggregateRating">
                                                <em>Đánh giá:
                                                    <strong>
                                                        <span itemprop="ratingValue">7.0</span>
                                                    </strong>
                                                    <span class="" itemprop="bestRating">10</span>
                                                    từ
                                                    <strong>
                                                        <span itemprop="ratingCount">415</span>
                                                        lượt
                                                    </strong>
                                                </em>
                                            </div>
                                        </div>

                                        <div class="story-detail__top--desc px-3" style="max-height: 285px;">
                                            ${book.detail}
                                        </div>

                                        <div class="info-more">
                                            <div class="info-more--more active" id="info_more">
                                                <span class="me-1 text-dark">Xem thêm</span>
                                                <svg width="14" height="8" viewBox="0 0 14 8" fill="none"
                                                     xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M7.70749 7.70718L13.7059 1.71002C14.336 1.08008 13.8899 0.00283241 12.9989 0.00283241L1.002 0.00283241C0.111048 0.00283241 -0.335095 1.08008 0.294974 1.71002L6.29343 7.70718C6.68394 8.09761 7.31699 8.09761 7.70749 7.70718Z"
                                                    fill="#2C2C37"></path>
                                                </svg>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="story-detail__bottom mb-3">
                                <div class="row">
                                    <div class="col-12 col-md-12 col-lg-3 story-detail__bottom--info">
                                        <p class="mb-1">
                                            <strong>Tác giả:</strong>
                                            <a href="listbookauthor?author=${book.author}"
                                               class="text-decoration-none text-dark hover-title">${book.author}</a>
                                        </p>
                                        <div class="d-flex align-items-center mb-1 flex-wrap">
                                            <strong class="me-1">Thể loại:</strong>
                                            <div class="d-flex align-items-center flex-warp">
                                                <c:forEach items="${bookcate}" var="bk">
                                                    <a href="category?cid=${bk.cateid}"
                                                       class="text-decoration-none text-dark hover-title  me-1 "
                                                       style="width: max-content;">${bk.catename} ,
                                                    </a>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-center mb-1 flex-wrap">
                                            <strong class="me-1">Tags:</strong>
                                            <div class="d-flex align-items-center flex-warp">
                                                <c:forEach items="${booktag}" var="bk">
                                                    <a href="tag?tid=${bk.tagid}"
                                                       class="text-decoration-none text-dark hover-title  me-1 "
                                                       style="width: max-content;">${bk.tagname} ,
                                                    </a>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <p class="mb-1">
                                            <strong>Trạng thái:</strong>
                                            <span class="text-info">${book.status}</span>
                                        </p>
                                        <p class="mb-1">
                                            <strong>Views:</strong>
                                            <span class="text-info">${book.views}</span>
                                        </p>
                                    </div>

                                </div>
                            </div>

                            <div class="story-detail__list-chapter">
                                <div class="head-title-global d-flex justify-content-between mb-4">
                                    <div class="col-6 col-md-12 col-lg-4 head-title-global__left d-flex">
                                        <h2 class="me-2 mb-0 border-bottom border-secondary pb-1">
                                            <span href="#"
                                                  class="d-block text-decoration-none text-dark fs-4 title-head-name"
                                                  title="Truyện hot">Danh sách chương</span>
                                        </h2>
                                    </div>
                                </div>

                                <div class="story-detail__list-chapter--list">
                                    <div class="row">
                                        <div class="col-12 col-sm-6 col-lg-6 story-detail__list-chapter--list__item">
                                            <ul>
                                                <c:forEach items="${chapter}" var="chap">
                                                    <li>
                                                        <a href="chapter?bookID=${book.bookid}&chapterID=${chap.chapterid}"
                                                           class="text-decoration-none text-dark hover-title">Chương ${chap.numberchapter}: ${chap.chaptername}</a>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="pagination" style="justify-content: center;">
                                <ul>
                                    <li class="pagination__item  page-current">
                                        <a class="page-link story-ajax-paginate"
                                           data-url="https://suustore.com/truyen/nang-khong-muon-lam-hoang-hau?page=1"
                                           style="cursor: pointer;">1</a>
                                    </li>
                                    <li class="pagination__item ">
                                        <a class="page-link story-ajax-paginate"
                                           data-url="https://suustore.com/truyen/nang-khong-muon-lam-hoang-hau?page=2"
                                           style="cursor: pointer;">2</a>
                                    </li>

                                    <div class="dropup-center dropup choose-paginate me-1">
                                        <button class="btn btn-success dropdown-toggle" type="button"
                                                data-bs-toggle="dropdown" aria-expanded="false">
                                            Chọn trang
                                        </button>
                                        <div class="dropdown-menu">
                                            <input type="number" class="form-control input-paginate me-1" value="">
                                            <button class="btn btn-success btn-go-paginate">
                                                Đi
                                            </button>
                                        </div>
                                    </div>

                                    <li class="pagination__arrow pagination__item">
                                        <a data-url="https://suustore.com/truyen/nang-khong-muon-lam-hoang-hau?page=2"
                                           style="cursor: pointer;"
                                           class="text-decoration-none w-100 h-100 d-flex justify-content-center align-items-center story-ajax-paginate">
                                            &gt;&gt;
                                        </a>
                                    </li>
                                </ul>

                            </div>
                        </div>
                    </div>

                    <div class="col-12 col-md-5 col-lg-4 sticky-md-top">
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
                                        <li><a class="dropdown-item" href="category?cid=${ca.cateid}">${ca.catename}</a>
                                        </li>
                                    </c:forEach>
                                                                                              
                                            </ul>
                                        </div>
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
        <script src="./assets/story.js"></script>



        <div id="loadingPage" class="loading-full">
            <div class="loading-full_icon">
                <div class="spinner-grow"><span class="visually-hidden">Loading...</span></div>
            </div>
        </div>



    </body>

</html>
