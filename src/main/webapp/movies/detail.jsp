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
    <title>Detail movie</title>
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
    <link rel="stylesheet" href="../movies/detail.css"/>
</head>
<body style="background-image: linear-gradient(rgba(0, 0, 0, 0.8), #000000),url(${movie.getImage()}); background-repeat: no-repeat; background-size: cover">
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
    <div class="movie-content d-flex">
        <div class="movie-content__poster">
            <img src="${movie.getImage()}" style="image-rendering: smooth;" alt="">
        </div>
        <div class="movie-content__info">
            <h1 class="title fw-bold">${movie.getTitle()}</h1>
            <div class="more-info">
                <span>Rating: ${movie.getRating()}</span>
                <span>Rank: ${movie.getRank()}</span>
                <span>Year: ${movie.getYearPublic()}</span>
            </div>
            <p class="overview">${movie.getDescription()}</p>
            <div class="cast">
                <div class="section-header">
                    <h2 class="fw-bold">Casts</h2>
                </div>
                <div class="casts">
                    <c:forEach items="${directorList}" var="director">
                        <div class="casts-item">
                            <img src="${director.getImage()}" alt="">
                            <p class="casts-item-name p-2 fw-semibold" style="font-size: 14px">${director.getName()}</p>
                        </div>
                    </c:forEach>
                    <c:forEach items="${writerList}" var="writer">
                        <div class="casts-item">
                            <img src="${writer.getImage()}" alt="">
                            <p class="casts-item-name p-2 fw-semibold" style="font-size: 14px">${writer.getName()}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <div class="trailer-movie">
        <p class="fw-bold">${movie.getTitle()} | Official Trailer | Prime Video ZA</p>
        <iframe class="embed-responsive-item" src="${movie.getTrailer()}" allowfullscreen></iframe>
    </div>
    <div class="footer mt-5">
        <div>
            <section class="link">
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

        </div>    <!-- END OF LINKS -->

        <!-- FOOTER -->
        <footer>
            <p>&copy 1997-2018 Netflix, Inc.</p>
            <p>Carlos Avila &copy 2018</p>
        </footer>
    </div>
</div>
</body>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"
></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-element-bundle.min.js"></script>
</html>
