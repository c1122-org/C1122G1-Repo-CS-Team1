<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/12/2023
  Time: 7:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" href="../assets/images/logo-title.png">
    <title>Netflix home</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
            crossorigin="anonymous"
    />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
          integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="../home/home.css"/>
</head>
<body>
<div class="header">
    <div class="left-header">
        <ul>
            <li><img src="../assets/images/logo.png" alt=""></li>
            <li>Trang chủ</li>
            <li>Thể loại</li>
            <li>Phim hot</li>
            <li>Khác</li>
        </ul>
    </div>
    <div class="right-header">
        <form class="form-search-header d-flex" method="get">
            <input type="text" class="input-search-header" name="search" placeholder="Search movie">
            <button class="search-btn d-flex align-items-end" type="submit"><i class="fa-solid fa-magnifying-glass"></i>
            </button>
        </form>
        <div class="account-user">
            <i class="fa-solid fa-user"></i>
        </div>
    </div>
</div>
<div class="content">
    <div class="movies">
        <div class="new-movie d-flex flex-column justify-content-start align-items-center">
            <div class="title-new-movie w-100 pb-3">
                <h2 class="fs-24">Phim mới</h2>
            </div>
            <swiper-container class="mySwiper w-100" space-between="30"
                              slides-per-view="5">
                <c:forEach items="${newMovieList}" var="newMovie">
                    <swiper-slide onclick="showDetailMovie(${newMovie.getId()})"><img src="${newMovie.getImage()}" alt="">
                        <div class="detail-movie">
                            <p class="fw-bolder">${newMovie.getTitle()}</p>
                            <div class="d-flex" style="font-size: 16px">
                                <p class="fw-bold">Rating: &nbsp;</p>
                                <p>${newMovie.getRating()}</p>
                            </div>
                            <div class="d-flex" style="font-size: 16px">
                                <p class="fw-bold">Rank: &nbsp;</p>
                                <p>${newMovie.getRank()}</p>
                            </div>
                            <div class="d-flex" style="font-size: 16px">
                                <p class="fw-bold">Year public: &nbsp;</p>
                                <p>${newMovie.getYearPublic()}</p>
                            </div>
                        </div>
                    </swiper-slide>
                </c:forEach>
            </swiper-container>
        </div>
        <div class="action-movie d-flex flex-column justify-content-start align-items-center">
            <div class="title-action-movie w-100 pb-3">
                <h2 class="fs-24">Hành động</h2>
            </div>
            <swiper-container class="mySwiper w-100" space-between="30"
                              slides-per-view="5">
                <c:forEach items="${actionMovieList}" var="actionMovie">
                    <swiper-slide onclick="showDetailMovie(${actionMovie.getId()})"><img src="${actionMovie.getImage()}" alt="">
                        <div class="detail-movie">
                            <p class="fw-bolder">${actionMovie.getTitle()}</p>
                            <div class="d-flex" style="font-size: 16px">
                                <p class="fw-bold">Rating: &nbsp;</p>
                                <p>${actionMovie.getRating()}</p>
                            </div>
                            <div class="d-flex" style="font-size: 16px">
                                <p class="fw-bold">Rank: &nbsp;</p>
                                <p>${actionMovie.getRank()}</p>
                            </div>
                            <div class="d-flex" style="font-size: 16px">
                                <p class="fw-bold">Year public: &nbsp;</p>
                                <p>${actionMovie.getYearPublic()}</p>
                            </div>
                        </div>
                    </swiper-slide>
                </c:forEach>
            </swiper-container>
        </div>
        <div class="popular-movie d-flex flex-column justify-content-start align-items-center">
            <div class="title-popular-movie w-100 pb-3">
                <h2 class="fs-24">Phổ biến</h2>
            </div>
            <swiper-container class="mySwiper w-100" space-between="30"
                              slides-per-view="5">
                <c:forEach items="${popularMovieList}" var="popularMovie">
                    <swiper-slide onclick="showDetailMovie(${popularMovie.getId()})"><img src="${popularMovie.getImage()}" alt="">
                        <div class="detail-movie">
                            <p class="fw-bolder">${popularMovie.getTitle()}</p>
                            <div class="d-flex" style="font-size: 16px">
                                <p class="fw-bold">Rating: &nbsp;</p>
                                <p>${popularMovie.getRating()}</p>
                            </div>
                            <div class="d-flex" style="font-size: 16px">
                                <p class="fw-bold">Rank: &nbsp;</p>
                                <p>${popularMovie.getRank()}</p>
                            </div>
                            <div class="d-flex" style="font-size: 16px">
                                <p class="fw-bold">Year public: &nbsp;</p>
                                <p>${popularMovie.getYearPublic()}</p>
                            </div>
                        </div>
                    </swiper-slide>
                </c:forEach>
            </swiper-container>
        </div>
        <div class="animation-movie d-flex flex-column justify-content-start align-items-center">
            <div class="title-animation-movie w-100 pb-3">
                <h2 class="fs-24">Hoạt hình</h2>
            </div>
            <swiper-container class="mySwiper w-100" space-between="30"
                              slides-per-view="5">
                <c:forEach items="${animationMovieList}" var="animationMovie">
                    <swiper-slide onclick="showDetailMovie(${animationMovie.getId()})"><img src="${animationMovie.getImage()}" alt="">
                        <div class="detail-movie">
                            <p class="fw-bolder">${animationMovie.getTitle()}</p>
                            <div class="d-flex">
                                <p class="fw-bold">Rating: &nbsp;</p>
                                <p>${animationMovie.getRating()}</p>
                            </div>
                            <div class="d-flex">
                                <p class="fw-bold">Rank: &nbsp;</p>
                                <p>${animationMovie.getRank()}</p>
                            </div>
                            <div class="d-flex">
                                <p class="fw-bold">Year public: &nbsp;</p>
                                <p>${animationMovie.getYearPublic()}</p>
                            </div>
                        </div>
                    </swiper-slide>
                </c:forEach>
            </swiper-container>
        </div>
    </div>
    <div class="footer mt-5">
        <section class="link">
            <div class="logos">
                <a href="#"><i class="fab fa-facebook-square fa-2x logo"></i></a>
                <a href="#"><i class="fab fa-instagram fa-2x logo"></i></a>
                <a href="#"><i class="fab fa-twitter fa-2x logo"></i></a>
                <a href="#"><i class="fab fa-youtube fa-2x logo"></i></a>
            </div>
            <div class="sub-links">
                <ul>
                    <li><a href="#">Audio and Subtitles</a></li>
                    <li><a href="#">Audio Description</a></li>
                    <li><a href="#">Help Center</a></li>
                    <li><a href="#">Gift Cards</a></li>
                    <li><a href="#">Media Center</a></li>
                    <li><a href="#">Investor Relations</a></li>
                    <li><a href="#">Jobs</a></li>
                    <li><a href="#">Terms of Use</a></li>
                    <li><a href="#">Privacy</a></li>
                    <li><a href="#">Legal Notices</a></li>
                    <li><a href="#">Corporate Information</a></li>
                    <li><a href="#">Contact Us</a></li>
                </ul>
            </div>
        </section>
        <!-- END OF LINKS -->

        <!-- FOOTER -->
        <footer>
            <p>&copy 1997-2018 Netflix, Inc.</p>
            <p>Carlos Avila &copy 2018</p>
        </footer>
    </div>
</div>
</div>
</body>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"
></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
<script type="text/javascript">
    function showDetailMovie(id) {
        console.log(id);
        location.href = "home?action=detail&id=" + id;
    }
</script>
</html>
