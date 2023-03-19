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
    <link rel="icon" href="${pageContext.request.contextPath}/assets/images/logo-title.png">
    <title>${movie.getTitle()}</title>
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/movies/detail.css"/>
    <style>


        @media only screen and (max-width: 845px){
            .movie-content {
                margin: 7em 8em 4em;
                flex-direction: column;
            }
            .movie-content__poster {
                margin: 1em 6em 3em;
            }
            .img-width{
                width: 23rem;
            }
            .fw-bold {
                font-weight: 600 !important;
            }
            .movie-content__info {
                line-height: 2.2;
            }
            .movie-content__info .title {
                font-size: 4rem;
                line-height: 1;
                margin-bottom: 1.5rem;
            }
            .more-info {
                margin-bottom: 2rem;
            }
            .more-info span {
                padding: 1rem 2rem;
                border: 2px solid #fff;
                border-radius: 31px;
                font-size: 0.8rem;
                font-weight: 600;
                background-color: #0f0f0f;
            }
            .overview {
                font-weight: 600;
                letter-spacing: 1px;
            }
            .cast {
                margin-bottom: 2rem;
            }
            .cast .section-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .fw-bold {
                font-weight: 700 !important;
            }
            .cast .casts {
                display: flex;
                align-items: center;
            }
            .casts .casts-item {
                width: 13rem;
                height: 16rem;
                margin-right: 1em;
                text-align: center;
            }
            .size{
                font-size: 18px;
            }
            .trailer-movie {
                margin: 0 3em 5rem;
                font-size: 1.5em;
            }
            .trailer-movie iframe {
                width: 100%;
                height: 75%;
            }
            iframe {
                border: 0;
            }
            .img{
                background-repeat: no-repeat;
                background-size: 100%;
                background-position-x: center;
            }
        }

        @media only screen and (min-width: 845px ){
            .movie-content {
                margin: 7em 2em 5em;
            }
            .movie-content__poster {
                margin: 1em 1em;
            }
            .img-width{
                width: 16rem;
            }
            .fw-bold {
                font-weight: 600 !important;
            }
            .movie-content__info {
                line-height: 1.2;
            }
            .movie-content__info .title {
                font-size: 3rem;
                line-height: 1;
                margin-bottom: 1rem;
            }
            .more-info {
                margin-bottom: 1rem;
            }
            .more-info span {
                padding: 0.5rem 1.5rem;
                border: 2px solid #fff;
                border-radius: 30px;
                font-size: .8rem;
                font-weight: 600;
                background-color: #0f0f0f;
            }
            .overview {
                font-weight: 400;
                letter-spacing: 0.4px;
            }
            .cast {
                margin-bottom: 2rem;
            }
            .cast .section-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .fw-bold {
                font-weight: 700 !important;
            }
            .cast .casts {
                display: flex;
                align-items: center;
            }
            .casts .casts-item {
                width: 10rem;
                height: 13rem;
                margin-right: 1em;
                text-align: center;
            }
            .trailer-movie {
                margin: 0 3em 5rem;
                font-size: 1.5em;
            }
            .trailer-movie iframe {
                width: 100%;
                height: 100%;
            }
            iframe {
                border: 0;
            }
            .img{
                background-repeat: no-repeat;
                background-size: 100%;
                background-position-x: center;
            }
        }

        @media only screen and (min-width: 996px ){
            .movie-content {
                margin: 8em 6em 7em;
            }
            .movie-content__poster {
                margin: 1em 2em;
            }
            .movie-content__info {
                line-height: 1.2;
            }
            .fw-bold {
                font-weight: 500!important;
            }
            .img-width{
                width: 19em;
            }
            .movie-content__info .title {
                font-size: 4rem;
                line-height: 1;
                margin-bottom: 1rem;
            }
            .more-info {
                margin-bottom: 2rem;
            }
            .more-info span {
                padding: 0.5rem 1.5rem;
                border: 2px solid #fff;
                border-radius: 30px;
                font-size: .8rem;
                font-weight: 600;
                background-color: #0f0f0f;
            }
            .trailer-movie {
                margin: 0 6em 4rem;
                font-size: 1.5em;
            }
            .overview {
                font-weight: 400;
                letter-spacing: 0.7px;
            }
            .trailer-movie iframe {
                width: 100%;
                height: 100%;
            }
            iframe {
                border: 0;
            }
            .img{
                background-repeat: no-repeat;
                background-size: 100%;
                background-position-x: center;
            }

        }

        @media only screen and (min-width: 1170px){
            .movie-content {
                margin: 10em 10em;
            }
            .movie-content__poster {
                margin-right: 4em;
            }
            .img-width{
                width: auto;
            }
            .movie-content__info {
                line-height: 1.6;
            }
            .movie-content__info .title {
                font-size: 4rem;
                line-height: 1;
                margin-bottom: 2rem;
            }
            .more-info {
                margin-bottom: 2rem;
            }
            .more-info span {
                padding: 0.5rem 1.5rem;
                border: 2px solid #fff;
                border-radius: 30px;
                font-size: .8rem;
                font-weight: 600;
                background-color: #0f0f0f;
            }
            .overview {
                font-weight: 400;
                letter-spacing: 0.8px;
            }
            p {
                margin-top: 0rem;
                margin-bottom: 1rem;
            }
            .cast {
                margin-bottom: 2rem;
            }
            .cast .section-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .fw-bold {
                font-weight: 700 !important;
            }
            .cast .casts {
                display: flex;
                align-items: center;
            }
            .casts .casts-item {
                width: 10rem;
                height: 14rem;
                margin-right: 1.5em;
                text-align: center;
            }
            .trailer-movie {
                margin: 0 6em 7rem;
                font-size: 1.5em;
            }
            .trailer-movie iframe {
                width: 100%;
                height: 100%;
            }
            iframe {
                border: 0;
            }
            .img{
                background-repeat: no-repeat;
                background-size: 100%;
                background-position-x: center;
            }
        }

    </style>
</head>
<body class="img" style="background-image: linear-gradient(rgba(0, 0, 0, 0.8), #000000),url(${movie.getImage()}); background-repeat: no-repeat; background-size: cover">
<jsp:include page="../common/header.jsp"></jsp:include>
<div class="content">
    <div class="movie-content d-flex">
        <div class="movie-content__poster row1">
            <img src="${movie.getImage()}" style="image-rendering: smooth;" alt="" class="img-width">
        </div>
        <div class="movie-content__info row2">
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
                            <p class="casts-item-name p-2 fw-semibold size" style="font-size: 14px">${director.getName()}</p>
                        </div>
                    </c:forEach>
                    <c:forEach items="${writerList}" var="writer">
                        <div class="casts-item">
                            <img src="${writer.getImage()}" alt="">
                            <p class="casts-item-name p-2 fw-semibold size" style="font-size: 14px">${writer.getName()}</p>
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
    <jsp:include page="../common/footer.jsp"></jsp:include>
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

    function navigateNewPage(navigation) {
        if (navigation == "#") {
            location.href = "home";
        } else {
            location.href = "navigation?path=" + navigation;
        }
    }
    function handleDropdown() {
        let statusShowDropdownHeader = document.getElementsByClassName("show")[0];
        console.log(statusShowDropdownHeader);
        if (statusShowDropdownHeader == undefined) {
            let dropdownMenuHeader = document.getElementById("dropdown-menu-header");
            dropdownMenuHeader.style.display = "none";
        }
        else {
            let dropdownMenuHeader = document.getElementById("dropdown-menu-header");
            dropdownMenuHeader.style.display = "block";
        }
    }
</script>
</html>
