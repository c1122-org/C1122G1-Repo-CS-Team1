<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <title>Admin</title>
    <style>
        body {
            background-image: linear-gradient(rgba(0, 0, 0, 0.95), rgba(0, 0, 0, 0.95)), url(../assets/images/header-image.png);
            font-family: Netflix Sans, Helvetica Neue, Segoe UI, Roboto, Ubuntu, sans-serif;
        }
        .header {
            color: #d9d9d9;
            background: #0b0b0b;
            width: 100%;
            height: 60px;
            position: fixed;
            top: 0;
            right: 0;
            left: 0;
            display: flex;
            justify-content: space-between;
            z-index: 1;
        }
        .bg-body-tertiary {
            --bs-bg-opacity: 0;
        }
        @media (min-width: 992px) {
            .navbar-expand-lg .navbar-collapse {
                display: flex !important;
                flex-basis: auto;
                font-size: 1.4rem;
            }
        }
        .navbar {
            width: 100%;
            justify-content: space-between;
        }
        .navbar>.container-fluid{
            align-items: flex-start;
        }
        body ,.table-striped>tbody>tr:nth-of-type(odd)>* ,.nav-link {
            color: #ddd;
        }
        .nav-link:hover {
            color: #167ac6;
        }
        .btn-primary {
            --bs-btn-color: #000;
            --bs-btn-bg: #fff;
            --bs-btn-border-color: #fff;
        }
        .btn:hover {
            color: #ffffff;
            background-color: #7ed6df;
            border-color: #7ed6df;
        }
        .table {
            --bs-table-color: #dee2e6;
        }
        textarea {
            resize: vertical;
            color: #ddd;
            background: none;
            border: none;
        }
        button.dropdown-toggle {
            color: #ffffff !important;

        }
        @media only screen and (max-width: 992px){
            ul.navbar-nav.me-auto.mb-2.mb-lg-0{
                display: flex;
                align-content: space-between;
                align-items: flex-end;
            }
            li.nav-item{
                display: flex;
                width: 8em;
                text-indent: 1em;
                border: 1px solid;
                background: #dee2e6;
            }
            a.nav-link{
                color: #343a40;
            }
            .container{
                max-width: 980px;
                margin: 0 5em;
            }
            div.dataTables_wrapper div.dataTables_filter {
                text-align: right;
                margin-right: -18em;
            }
            .navbar>.container-fluid {
                align-items: center;
                margin-right: 2em;
            }
            .table>thead .table>thead {
                display: block;
            }
        }

    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <nav class="navbar navbar-expand-lg bg-body-tertiary" style="box-shadow: rgba(17, 17, 26, 0.1) 0px 1px 0px;">
            <div class="container-fluid">
                <img src="/oneteam.png" alt="Trang chủ" onclick="location.href='home'" style="width: 8rem;height: 3rem">
                <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="admin?path=movie">Movies</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="admin?path=user">Users</a>
                        </li>
                    </ul>
                    <ul>
                        <div class="account-user">
                            <div class="dropdown">
                                <button class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" style="background: transparent; outline: 0; border: 0; color: #000000">
                                    <i class="fa-solid fa-house-user"></i>
                                </button>
                                <ul class="dropdown-menu" style="left: auto !important; right: 0 !important;">
                                    <c:if test="${sessionScope.account != null}">
                                        <li><a class="dropdown-item">Hi ${sessionScope.account.getUsername()}</a></li>
                                    </c:if>
                                    <c:if test="${(sessionScope.account.isAdmin() ? 1: 0) == 1}">
                                        <li><a class="dropdown-item" href="admin">Admin Management</a></li>
                                    </c:if>
                                    <li><a class="dropdown-item" href="logout">Log out</a></li>
                                </ul>
                            </div>
                        </div>
                    </ul>
                </div>
            </div>
        </nav>
    </div>

    <div class="main" style="padding: 100px 0">
        <table id="example" class="table table-striped" style="width:100%; font-weight: 700">
            <thead>
            <tr>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Password</th>
                <th>Choice</th>
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
                                onclick="location.href='admin?path=user&action=update&id=${acountUser.getId()}';"
                                class="btn btn-warning me-3">Update
                        </button>

                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                data-bs-target="#exampleModal${acountUser.getId()}">Delete
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal${acountUser.getId()}" data-bs-backdrop="static"
                             data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content" style="color: #0b0b0b">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Delete account</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <span>Do you want delete ${acountUser.getUsername()}</span>
                                        <span>?</span>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close
                                        </button>
                                        <button type="button" class="btn btn-danger"
                                                onclick="location.href='admin?path=user&action=delete&id=${acountUser.getId()}'">
                                            Delete
                                        </button>
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


