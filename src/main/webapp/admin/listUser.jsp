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
<div class="container">
    <div class="header">
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

    <div class="main" style="padding: 100px 0">
        <table id="example" class="table table-striped" style="width:100%">
            <thead>
            <tr>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Password</th>
                <th>Lựa chọn</th>
            </tr>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${accountUserList}" var="acountUser">
                <tr>
                    <th scope="row">${acountUser.getId()}</th>
                    <td class="name-movie">${acountUser.getUsername()}</td>
                    <td>${acountUser.getPassword()}</td>
                    <td>

                        <button type="button"
                                onclick="location.href='/admin?path=user&action=update&id=${acountUser.getId()}';"
                                class="btn btn-warning">Update
                        </button>

                        <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                data-bs-target="#exampleModal${acountUser.getId()}">
                            Delete
=======
                        <button type="button" onclick="location.href='admin?path=user&action=update&id=${acountUser.getId()}';"
                                class="btn btn-warning me-3">Update
                        </button>
                        <button type="button" onclick="location.href='admin?path=user&action=delete&id=${acountUser.getId()}';"
                                class="btn btn-danger">Delete
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal${acountUser.getId()}" tabindex="-1"
                             aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Delete account</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <span>Bạn có muốn xóa ${acountUser.getUsername()}</span>
                                        <span>này không?</span>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No
                                        </button>
                                        <button type="button" class="btn btn-danger">Yes</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
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

