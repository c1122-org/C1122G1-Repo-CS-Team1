<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 3/16/2023
  Time: 10:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <title>Admin</title>
</head>
<style>
    * {
        margin: 0;
        padding: 0;
        border: none;
        font-family: 'Open Sans', sans-serif;
    }

    .form-login {
        width: 600px;
        border-radius: 5px;
        padding: 60px 68px 40px;
        box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
    }

    .form-login #login h1 {
        font-size: 32px;
        font-weight: 600;
        margin-bottom: 28px;
    }

    .form-login #login p {
        margin: 0;
        font-weight: 600;
    }

    #login .username,
    #login .password {
        outline: 0;
        border: 1px;
        background: #d9d9d9;
        border-radius: 4px;
        height: 50px;
        line-height: 50px;
        padding: 8px 20px;
        margin-bottom: 16px;
        line-height: 50px;
    }

    #login .submit-btn {
        background: #e50914;
        border-radius: 4px;
        font-size: 16px;
        color: #fff;
        font-weight: 500;
        margin: 24px 0 12px;
        height: 50px;
    }
</style>
</head>
<body>
<div class="header" style="position: fixed; top: 0; left: 0; right: 0">
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="home">Trang chủ</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="admin?path=movie">Movies</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin?path=user">User</a>
                    </li>
                </ul>
                <ul>
                    <div class="account-user">
                        <div class="dropdown">
                            <button class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"
                                    style="background: transparent; outline: 0; border: 0; color: #000000">
                                <i class="fa-solid fa-house-user"></i>
                            </button>
                            <ul class="dropdown-menu" style="left: auto !important; right: 0 !important;">
                                <c:if test="${(sessionScope.account.isAdmin() ? 1: 0) == 1}">
                                    <li><a class="dropdown-item" href="admin">Quản lí</a></li>
                                </c:if>
                                <li><a class="dropdown-item" href="logout">Đăng xuất</a></li>
                            </ul>
                        </div>
                    </div>
                </ul>
            </div>
        </div>
    </nav>
</div>
<div class="form-login" style="margin: 100px auto 100px;">
    <c:if test="${movie == null}">
        <form id="login" method="post">
            <h1>${message}</h1>
            <input
                    type="text"
                    name="title"
                    class="username w-100"
                    placeholder="Nhập tên phim"
            />
            <select name="type" style="background: #d9d9d9; margin-bottom: 16px" class="form-select"
                    aria-label="Default select example">
                <option selected>Chọn thể loại</option>
                <c:forEach items="${genreList}" var="genre">
                        <option value="${genre.getId()}">${genre.getName()}</option>
                </c:forEach>
            </select>
            <input
                    type="text"
                    name="rating"
                    class="username w-100"
                    placeholder="Nhập điểm bình chọn"
            />
            <input
                    type="text"
                    name="rank"
                    class="username w-100"
                    placeholder="Nhập vị trí xếp hạng"
            />
            <input
                    type="text"
                    name="yearPublic"
                    class="username w-100"
                    placeholder="Nhập năm sản xuất"
            />
            <input
                    type="text"
                    name="image"
                    class="username w-100"
                    placeholder="Nhập link ảnh"
            />
            <input
                    type="text"
                    name="description"
                    class="username w-100"
                    placeholder="Miêu tả về phim"
            />
            <input
                    type="text"
                    name="trailer"
                    class="username w-100"
                    placeholder="Link trailer"
            />
            <input
                    type="submit"
                    class="submit-btn w-100 fw-bold"
                    value="Thêm mới"
            />
        </form>
    </c:if>
    <c:if test="${movie != null}">
        <form id="login" method="post">
            <h1>${message}</h1>
            <p>Tên phim</p>
            <input
                    type="text"
                    name="title"
                    class="username w-100"
                    placeholder="Nhập tên phim"
                    value="${movie.getTitle()}"
            />
            <p>Thể loại</p>
            <select name="type" style="background: #d9d9d9; margin-bottom: 16px" class="form-select"
                    aria-label="Default select example">
                <c:forEach items="${genreList}" var="genre">
                    <c:if test="${movie.getGenre() == genre.getId()}">
                        <option value="${genre.getId()}" selected>${genre.getName()}</option>
                    </c:if>
                    <c:if test="${movie.getGenre() != genre.getId()}">
                        <option value="${genre.getId()}">${genre.getName()}</option>
                    </c:if>
                </c:forEach>
            </select>
            <p>Điểm số phim</p>
            <input
                    type="text"
                    name="rating"
                    class="username w-100"
                    placeholder="Nhập điểm bình chọn"
                    value="${movie.getRating()}"
            />
            <p>Xếp hạng phim</p>
            <input
                    type="text"
                    name="rank"
                    class="username w-100"
                    placeholder="Nhập vị trí xếp hạng"
                    value="${movie.getRank()}"
            />
            <p>Năm sản xuất</p>
            <input
                    type="text"
                    name="yearPublic"
                    class="username w-100"
                    placeholder="Nhập năm sản xuất"
                    value="${movie.getYearPublic()}"
            />
            <p>Link ảnh đại diện</p>
            <input
                    type="text"
                    name="image"
                    class="username w-100"
                    placeholder="Nhập link ảnh"
                    value="${movie.getImage()}"
            />
            <p>Miêu tả phim</p>
            <input
                    type="text"
                    name="description"
                    class="username w-100"
                    placeholder="Miêu tả về phim"
                    value="${movie.getDescription()}"
            />
            <p>Link trailer phim</p>
            <input
                    type="text"
                    name="trailer"
                    class="username w-100"
                    placeholder="Link trailer"
                    value="${movie.getTrailer()}"
            />
            <input
                    type="button"
                    id="update-submit-btn"
                    class="submit-btn w-100 fw-bold"
                    data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                    value="Chỉnh sửa"
            />
        </form>
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
             tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Xác nhận</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Xác nhận chỉnh sửa "${movie.getTitle()}" ?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button"
                                onclick="handleSubmitFromUpdate()"
                                class="btn btn-warning">Update
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
<script type="text/javascript">
    function handleSubmitFromUpdate() {
        let btn = document.getElementById("login").submit();
    }
</script>
</html>