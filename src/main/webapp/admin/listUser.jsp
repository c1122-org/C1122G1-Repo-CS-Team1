<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 3/16/2023
  Time: 10:15 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        .header{
            width: 100%;
            height: 4rem;
            /*background: #f8f9fa!important;*/
            background: #101010!important;
            color: white;

        }

        .table tr:nth-child(even) {
            background-color: white;
        }

        .table tr:nth-child(odd) {
            background-color: #eee;
        }

        th {
            background-color: #718093;
            color: aliceblue
        }

        table, td, th {
            border: 1px solid green;
            width: auto;
            text-align: center;
        }

        h1 {
            text-align: center;
            margin-top: 20px
        }

        .menu{
            background: #f8f9fa!important;
            /*background: #101010!important;*/
            max-width: 20%;
            margin: 0 1%;
            /*color: white;*/
        }
        @import url('https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap');
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            list-style: none;
            font-family: 'Montserrat', sans-serif
        }
        body {
            padding: 10px
        }
        .topnav a {
            float: left;
            display: block;
            color: #8d8b8b;
            font-weight: 800;
            font-size: 14px;
            text-transform: uppercase;
            padding: 14px 16px;
            text-decoration: none;
            border-bottom: 3px solid transparent
        }
        .topnav a:hover {
            color: #f7910c;
            border-bottom: 3px solid red
        }
        form.example input[type=text] {
            padding: 10px;
            font-size: 17px;
            border: 1px solid grey;
            float: left;
            width: 90%;
            height: 36px;
            background: #fff
        }
        form.example input[type=text]:focus {
            outline: none
        }
        form.example button {
            float: left;
            width: 10%;
            height: 36px;
            padding: 5px;
            border-top-right-radius: 5px;
            border-bottom-right-radius: 5px;
            background: black;
            color: white;
            font-size: 14px;
            border: 1px solid grey;
            border-left: none;
            cursor: pointer
        }
        ::placeholder {
            font-size: 10px
        }
        form.example button:hover {
            background: #0b7dda
        }

        /*.table thead tr th {*/
        /*  font-size: 11px;*/
        /*  color: white;*/
        /*  padding: 10px 10px*/
        /*}*/
        .table tbody tr td {
            font-size: 13.5px;
            padding: 10px 10px
        }
        #navbar a {
            color: white
        }
        ul#navbar-items li {
            color: black;
            padding: 15px 25px;
            font-weight: 600;
            text-transform: uppercase;
            font-size: 10px;
            display: flex;
            align-items: center
        }

        ul#navbar-items li:hover {
            background-color: #fd7e14;
            color: white
        }
        @media (max-width: 430px) {
            .topnav a {
                font-size: 12px;
                padding: 12px
            }
        }
        @media (max-width: 376px) {
            .topnav a {
                font-size: 12px;
                padding: 7px
            }
        }
        @media (max-width: 320px) {
            .topnav a {
                font-size: 10px;
                padding: 4px
            }
        }
        footer {
            background: #101010;
            padding: 44px 0;
        }
        .single-box p {
            color: #fff;
            line-height: 1.9;
        }
        .single-box h3 {
            font-size: 16px;
            font-weight: 700;
            color: #fff;
        }
        .single-box .card-area i {
            color: #ffffff;
            font-size: 20px;
            margin-right: 10px;
        }
        .single-box ul {
            list-style: none;
            padding: 0;
        }
        .single-box ul li a {
            text-decoration: none;
            color: #fff;
            line-height: 2.5;
            font-weight: 100;
        }
        .single-box h2 {
            color: #fff;
            font-size: 20px;
            font-weight: 700;
        }
        #basic-addon2 {
            background: #fe1e4f;
            color: #fff;
        }
        .socials i {
            font-size: 18px;
            margin-right: 15px;
        }
        @media (max-width: 767px) {
            .single-box {
                margin-bottom: 50px;
            }
        }
        @media (min-width: 768px) and (max-width: 991px) {
            .single-box {
                margin-bottom: 50px;
            }
        }
    </style>
</head>
<body>

<div class="">
    <div class="header">
        <h1>Header</h1>
    </div>
    <div class="row">
        <div class="col-3 menu">kỳ bé đẹp</div>
        <div class="col-9">
            <table class="table">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>ID</th>
                    <th>Account</th>
                    <th>User</th>
                    <th>Password</th>
                    <th>Lựa chọn</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list}" var="c" varStatus="loop">
                    <tr>
                        <td>${loop.count}</td>
                        <td>${c.id}</td>
                        <td>${c.account}</td>
                        <td>${c.user}</td>
                        <td>${c.password}</td>
                        <td>
                            <a class="btn btn-sm btn-primary btn-edit" data-toggle="modal" data-target="#exampleModal${c.id}"
                               title="Chỉnh sửa" href='/list'>
                                <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                            </a>

                            <div class="modal fade modal-dialog-centered" id="exampleModal${c.id}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel"> ${c.account}</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form>
                                                <div class="form-id">
                                                    <label for="recipient-id" class="col-form-label">ID:</label>
                                                    <input type="text" class="form-control" id="recipient-id" value="${c.id}">
                                                </div>

                                                <div class="form-account">
                                                    <label for="recipient-account" class="col-form-label">Account:</label>
                                                    <input type="text" class="form-control" id="recipient-account" value="${c.account}">
                                                </div>

                                                <div class="form-user">
                                                    <label for="recipient-user" class="col-form-label">User:</label>
                                                    <input type="text" class="form-control" id="recipient-user" value="${c.user}">
                                                </div>

                                                <div class="form-password">
                                                    <label for="recipient-password" class="col-form-label">Password:</label>
                                                    <input type="text" class="form-control" id="recipient-password" value="${c.password}">
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary">Send message</button>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
                               title="Xóa" href='/list?action=delete&id=${book.id}' style="background: #e74c3c;border-color: #e74c3c;">
                                <i class="fa fa-trash-o bigger-110 pink"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
    <%--  footer--%>
    <footer>
        <div>
            <div class="row" style="margin: 0px;padding: 0px">
                <div class="col-lg-3 col-sm-6">
                    <div class="single-box">
                        <img src="/oneteam.png" alt="" height="auto" width="90%">
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single-box">
                        <h2>Trụ sở</h2>
                        <ul>
                            <li><a href="#">Codegym Đà Nẵng</a></li>
                            <li><a href="#">Số điện thoại: 1900 2237</a></li>
                            <li><a href="#">Email: info@vuabia.com</a></li>
                            <li><a href="#">C1022G1</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single-box">
                        <h2>Thông tin liên lạc</h2>
                        <ul>
                            <li><a href="#">Nguyễn Hà Anh Quốc</a></li>
                            <li><a href="#">Châu Hoàng Tố Trinh</a></li>
                            <li><a href="#">Trần Thuận Kỳ</a></li>
                            <li><a href="#">Lê Văn Chính</a></li>
                            <li><a href="#">0702750320</a></li>
                            <li><a href="#">oneteam@gmail.com</a></li>
                            <li><a href="#">Trường Sơn, Cẩm Lệ, Đà Nẵng</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single-box">
                        <h2>Đăng ký nhận tin khuyến mãi</h2>
                        <p>Vui lòng nhập email | hoặc số điện thoại | hoặc Facebook của bạn tại ô dưới đây:</p>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Vui lòng nhập"
                                   aria-label="Enter your Email ..." aria-describedby="basic-addon2">
                            <span class="input-group-text" id="basic-addon2"><i class="fa fa-check"></i></span>
                        </div>
                        <h2>Follow us on</h2>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</div>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

