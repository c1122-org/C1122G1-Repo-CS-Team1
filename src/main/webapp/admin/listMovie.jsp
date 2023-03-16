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
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <title>Admin</title>
</head>
<body>
    <div class="list-movie">
        <div class="header">
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <div class="container-fluid">
                    <a class="navbar-brand fw-bold" href="#">Admin</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="/admin?path=movie">Movies</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/admin?path=user">User</a>
                            </li>
                        </ul>
                        <ul>
                            <div class="account-user">
                                <div class="dropdown">
                                    <button class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"
                                            style="background: transparent; outline: 0; border: 0; color: #000000">
                                        <i class="fa-solid fa-house-user"></i>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <c:if test="${(sessionScope.account.isAdmin() ? 1: 0) == 1}">
                                            <li><a class="dropdown-item" href="/admin">Quản lí</a></li>
                                        </c:if>
                                        <li><a class="dropdown-item" href="/logout">Đăng xuất</a></li>
                                    </ul>
                                </div>
                            </div>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
        <div class="header">
            <div class="left-header">
                <ul>
                    <li onClick="navigateNewPage('#')"><img src="../assets/images/logo.png" alt=""></li>
                    <li onClick="navigateNewPage('general')">Tổng hợp</li>
                    <li onclick="handleDropdown()" class="dropdown-toggle" id="dropdown-header" data-bs-toggle="dropdown">Thể
                        loại
                        <ul id="dropdown-menu-header" class="dropdown-menu"
                            style="display: none">
                            <c:forEach items="${genreList}" var="genre">
                                <li onclick="navigateNewPage('type&genre=${genre.getId()}')"><a
                                        class="dropdown-item">${genre.getName()}</a></li>
                            </c:forEach>
                        </ul>
                    </li>
                    <li onClick="navigateNewPage('hot-movie')">Phim hot</li>
                    <li>Khác</li>
                </ul>
            </div>
            <div class="right-header">
                <form class="form-search-header d-flex" action="/home?action=search" method="post">
                    <input type="text" class="input-search-header" name="search" placeholder="Search movie">
                    <button class="search-btn d-flex align-items-end" type="submit"><i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </form>
                <div class="account-user">
                    <div class="dropdown">
                        <button class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false"
                                style="background: transparent; outline: 0; border: 0; color: #d9d9d9">
                            <i class="fa-solid fa-house-user"></i>
                        </button>
                        <ul class="dropdown-menu">
                            <c:if test="${(sessionScope.account.isAdmin() ? 1: 0) == 1}">
                                <li><a class="dropdown-item" href="/admin">Quản lí</a></li>
                            </c:if>
                            <li><a class="dropdown-item" href="/logout">Đăng xuất</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>


        <div class="main" style="padding: 100px 0">
            <table id="example" class="table table-striped" style="width:100%">
                <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Title</th>
                    <th scope="col">Rating</th>
                    <th scope="col">Rank</th>
                    <th scope="col">Year public</th>
                    <th scope="col">Image</th>
                    <th scope="col">Description</th>
                    <th scope="col">Trailer</th>
                    <th scope="col"></th>
                    <th scope="col"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${movieList}" var="movie">
                    <tr>
                        <th scope="row">${movie.getId()}</th>
                        <td class="name-movie">${movie.getTitle()}</td>
                        <td>${movie.getRating()}</td>
                        <td>${movie.getRank()}</td>
                        <td style="width: 100px">${movie.getYearPublic()}</td>
                        <td><img width="150px" src="${movie.getImage()}" alt=""></td>
                        <td >${movie.getDescription()}</td>
                        <td><iframe src="${movie.getTrailer()}">
                        </iframe></td>
                        <td><button type="button" onclick="location.href='/admin?action=update&id=${movie.getId()}';" class="btn btn-warning">Update</button></td>
                        <td><button type="button" onclick="location.href='/admin?action=delete&id=${movie.getId()}';" class="btn btn-danger">Delete</button></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#example').DataTable();
    });
    let table = $('#example').DataTable();
</script>
</html>
