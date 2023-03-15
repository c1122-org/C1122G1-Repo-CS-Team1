<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<div class="movies">
  <div class="new-movie d-flex flex-column justify-content-start align-items-center">
    <div class="title-new-movie w-100 pb-3">
      <h2 class="fs-24">Phim mới</h2>
    </div>
    <swiper-container class="mySwiper w-100" space-between="30"
                      slides-per-view="5">
      <c:forEach items="${newMovieList}" var="newMovie">
        <swiper-slide onclick="showDetailMovie(${newMovie.getId()})"><img src="${newMovie.getImage()}"
                                                                          alt="">
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
        <swiper-slide onclick="showDetailMovie(${actionMovie.getId()})"><img src="${actionMovie.getImage()}"
                                                                             alt="">
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
        <swiper-slide onclick="showDetailMovie(${popularMovie.getId()})"><img
                src="${popularMovie.getImage()}" alt="">
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
        <swiper-slide onclick="showDetailMovie(${animationMovie.getId()})"><img
                src="${animationMovie.getImage()}" alt="">
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