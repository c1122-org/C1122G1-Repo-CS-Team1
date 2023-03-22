<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/dist/css/multi-select-tag.css">
    <title>Admin</title>
    <style>
        body {
            background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url(../assets/images/header-image.png);
            font-family: Netflix Sans, Helvetica Neue, Segoe UI, Roboto, Ubuntu, sans-serif;
            color: #ddd;
        }

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
            backdrop-filter: brightness(0.2);
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
        input:not(:last-child), select {
            background: #ffffff !important;
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

        .mult-select-tag {
            color: #000000;
            background: #ffffff;
        }
        select {
            background: #ffffff !important;
        }

        .mult-select-tag .rounded, textarea {
            background: #ffffff !important;

        }


        .header {
            color: #d9d9d9;
            background: #0b0b0b;
            height: 60px;
            position: fixed;
            top: 0;
            right: 0;
            left: 0;
            display: flex;
            justify-content: space-between;
            z-index: 1;
        }
        .navbar.navbar-expand-lg {
            width: 100%;
        }
        .navbar > .container-fluid {
            align-items: flex-start;
            height: 70px;
            align-items: center;
            background: #0b0b0b;
        }

        @media only screen and (max-width: 992px) {
            .navbar > .container-fluid {
                align-items: center;
                margin-right: 2em;
            }


        }


        @media only screen and (min-width: 992px) {
            .navbar-expand-lg .navbar-toggler {
                display: none;
            }

            .navbar-expand-lg .navbar-collapse {
                display: flex !important;
                flex-basis: auto;
                font-size: 1.4rem;
            }
        }


        button.navbar-toggler {
            background: #dee2e6;
        }

    </style>
</head>
<body>
<div class="header">
    <nav class="navbar navbar-expand-lg bg-body-tertiary" style="box-shadow: rgba(17, 17, 26, 0.1) 0px 1px 0px;">
        <div class="container-fluid">
            <img src="/oneteam.png" alt="Trang chủ" href="home" style="width: 8rem;height: 3rem">
            <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" style="color: #fff; font-weight: 500" aria-current="page" href="admin?path=movie">Movies</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link"style="color: #fff; font-weight: 500" href="admin?path=user">Users</a>
                    </li>
                </ul>
                <ul>
                    <div class="account-user">
                        <div class="dropdown">
                            <button class="dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" style="background: transparent; outline: 0; border: 0; color: #ffffff">
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
<c:if test="${param.status == true}">
    <div class="toast align-items-center"
         style="position: fixed;display: block; top: 70px; background: forestgreen; right: 5px; color: #ffffff"
         role="alert"
         aria-live="assertive" aria-atomic="true">
        <div class="d-flex">
            <div class="toast-body">
                    ${message} success.
            </div>
            <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    </div>
</c:if>

<div class="form-login" style="margin: 100px auto 100px;">
    <c:if test="${movie == null}">
        <form id="login" method="post" enctype="multipart/form-data">
            <h1>${message}</h1>
            <p>Name Movie</p>
            <input
                    type="text"
                    name="title"
                    class="username w-100"
                    placeholder="Name movie"
                    required
            />
            <p>Movie Genre</p>
            <select name="type" style="background: #d9d9d9; margin-bottom: 16px" class="form-select"
                    aria-label="Default select example" required>
                <option selected>Choose genre</option>
                <c:forEach items="${genreList}" var="genre">
                    <option value="${genre.getId()}">${genre.getName()}</option>
                </c:forEach>
            </select>
            <p style="margin-top: 16px">Movie Director</p>
            <select name="director" style="background: #d9d9d9; margin-bottom: 16px" class="form-select"
                    aria-label="Default select example" id="director" multiple>
                <c:forEach items="${directorList}" var="director">
                    <option value="${director.getId()}">${director.getName()}</option>
                </c:forEach>
            </select>
            <p style="margin-top: 16px">Author</p>
            <select name="writer" style="background: #d9d9d9; margin-bottom: 16px" class="form-select"
                    aria-label="Default select example" id="writer" multiple>
                <c:forEach items="${writerList}" var="writer">
                    <option value="${writer.getId()}">${writer.getName()}</option>
                </c:forEach>
            </select>
            <p style="margin-top: 16px">Rating</p>
            <input
                    type="text"
                    name="rating"
                    class="username w-100"
                    placeholder="Enter rating"
                    required pattern="[1-9]|10|[1-9].[0-9]"
                    title="Rating from 1 to 10"
            />
            <c:if test="${param.status == false}"><p
                    style="color: red; font-weight: unset;font-size: 12px; margin-top: -8px">Must be a number</p></c:if>
            <p>Rank</p>
            <input
                    type="text"
                    name="rank"
                    class="username w-100"
                    placeholder="Enter rank"
                    required pattern="[^[1-9]$|^[1-9][0-9]$|^(100)$]"
                    title="Rank from 1 to 100"
            />
            <c:if test="${param.status == false}"><p
                    style="color: red; font-weight: unset;font-size: 12px; margin-top: -8px">Must be a number
            </p></c:if>
            <p>Year Public</p>
            <input
                    type="text"
                    name="yearPublic"
                    class="username w-100"
                    placeholder="Enter year public"
                    required pattern="^\d{4}"
            />
            <c:if test="${param.status == false}"><p
                    style="color: red; font-weight: unset;font-size: 12px; margin-top: -8px">Must be a
                number.</p></c:if>
            <p>Avatar</p>
            <input class="mb-3" type="file" id="img" name="img" style="color: #000000" accept="image/*">
            <p>Description</p>
            <input
                    type="text"
                    name="description"
                    class="username w-100"
                    placeholder="Description"
            />
            <p>Link trailer</p>
            <input
                    type="text"
                    name="trailer"
                    class="username w-100"
                    placeholder="Link trailer"
                    required
            />
            <input
                    type="submit"
                    class="submit-btn w-100 fw-bold"
                    value="Create movie"
            />
        </form>
    </c:if>
    <c:if test="${movie != null}">
        <form id="login" method="post" enctype="multipart/form-data">
            <h1>${message}</h1>
            <p>Tên phim</p>
            <input
                    type="text"
                    name="title"
                    class="username w-100"
                    placeholder="Name Movie"
                    value="${movie.getTitle()}"
                    required
            />
            <c:if test="${param.status == false && param.error.equals('required')}"><p
                    style="color: red; font-weight: unset;font-size: 12px; margin-top: -8px">Please enter all fields.</p></c:if>
            <p>Genre</p>
            <select name="type" style="background: #d9d9d9; margin-bottom: 16px" class="form-select"
                    aria-label="Default select example" required>
                <c:forEach items="${genreList}" var="genre">
                    <c:if test="${movie.getGenre() == genre.getId()}">
                        <option value="${genre.getId()}" selected>${genre.getName()}</option>
                    </c:if>
                    <c:if test="${movie.getGenre() != genre.getId()}">
                        <option value="${genre.getId()}">${genre.getName()}</option>
                    </c:if>
                </c:forEach>
            </select>
            <c:if test="${param.status == false && param.error.equals('required')}"><p
                    style="color: red; font-weight: unset;font-size: 12px; margin-top: -8px">Please enter all fields.</p></c:if>
            <p style="margin-top: 16px">Director</p>
            <select name="directorSelected" style="background: #d9d9d9; margin-bottom: 16px" class="form-select"
                    aria-label="Default select example" id="directorSelected" multiple="multiple">
                <c:forEach items="${directorListSelected}" var="directorSelected">
                    <option value="${directorSelected.getId()}" selected>${directorSelected.getName()}</option>
                </c:forEach>
                <c:forEach items="${directorList}" var="director">
                    <option value="${director.getId()}">${director.getName()}</option>
                </c:forEach>
            </select>
            <c:if test="${param.status == false && param.error.equals('required')}"><p
                    style="color: red; font-weight: unset;font-size: 12px;">Please enter all fields.</p></c:if>
            <p style="margin-top: 16px">Writer</p>
            <select name="writerSelected" style="background: #d9d9d9; margin-bottom: 16px" class="form-select"
                    aria-label="Default select example" id="writerSelected" multiple>
                <c:forEach items="${writerListSelected}" var="writerSelected">
                    <option value="${writerSelected.getId()}" selected>${writerSelected.getName()}</option>
                </c:forEach>
                <c:forEach items="${writerList}" var="writer">
                    <option value="${writer.getId()}">${writer.getName()}</option>
                </c:forEach>
            </select>
            <c:if test="${param.status == false && param.error.equals('required')}"><p
                    style="color: red; font-weight: unset;font-size: 12px;">Please enter all fields.</p></c:if>
            <p style="margin-top: 16px">Rating</p>
            <input
                    type="text"
                    name="rating"
                    class="username w-100"
                    placeholder="Rating"
                    value="${movie.getRating()}"
                    required pattern="[1-9]|10"
                    title="Rating from 1 to 10"
            />
            <c:if test="${param.status == false && param.error.equals('number')}"><p
                    style="color: red; font-weight: unset;font-size: 12px; margin-top: -8px">Must be a number (0 - 10)</p></c:if>
            <p>Rank</p>
            <input
                    type="text"
                    name="rank"
                    class="username w-100"
                    placeholder="Rank"
                    value="${movie.getRank()}"
                    required
            />
            <c:if test="${param.status == false && param.error.equals('number')}"><p
                    style="color: red; font-weight: unset;font-size: 12px; margin-top: -8px">Must be a number ( greater than 0 )</p></c:if>
            <p>Year Public</p>
            <input
                    type="text"
                    name="yearPublic"
                    class="username w-100"
                    placeholder="Year Public"
                    value="${movie.getYearPublic()}"
                    required pattern="^\d{4}"
            />
            <c:if test="${param.status == false && param.error.equals('number')}"><p
                    style="color: red; font-weight: unset;font-size: 12px; margin-top: -8px">Required following year format (yyyy).</p></c:if>
            <p>Link Image</p>
            <input class="mb-3" type="file" id="img" name="img" style="color: #000000" value="..${movie.getImage()}" accept="image/*">
            <c:if test="${param.status == false && param.error.equals('required')}"><p
                    style="color: red; font-weight: unset;font-size: 12px; margin-top: -8px">Please enter all fields.</p></c:if>
            <p>Description</p>
            <textarea name="description" class="username w-100">${movie.getDescription()}</textarea>
            <c:if test="${param.status == false && param.error.equals('required')}"><p
                    style="color: red; font-weight: unset;font-size: 12px; margin-top: -8px">Please enter all fields.</p></c:if>
            <p>Link trailer</p>
            <input
                    type="text"
                    name="trailer"
                    class="username w-100"
                    placeholder="Link trailer"
                    value="${movie.getTrailer()}"
                    required
            />
            <c:if test="${param.status == false && param.error.equals('required')}"><p
                    style="color: red; font-weight: unset;font-size: 12px; margin-top: -8px">Please enter all fields.</p></c:if>
            <input
                    type="button"
                    id="update-submit-btn"
                    class="submit-btn w-100 fw-bold"
                    data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                    value="Edit"
            />
        </form>
    </c:if>
</div>
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
     tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="color: #000000">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="staticBackdropLabel">Xác nhận</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Submit "${movie.getTitle()}" ?
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
</body>
<script src="${pageContext.request.contextPath}/assets/dist/js/multi-select-tag.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>
<script type="text/javascript">
    function handleSubmitFromUpdate() {
        document.getElementById("login").submit();
    };
    let toast = document.getElementsByClassName("toast")[0];
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const statusAdd = urlParams.get("status");
    if (statusAdd) {
        setTimeout(() => {
            toast.style.opacity = "0";
            toast.style.transition = "opacity 1s ease-in";
        }, 2000);
    }
    new MultiSelectTag('director');
    new MultiSelectTag('writer');
</script>
<script type="text/javascript">
    new MultiSelectTag('directorSelected');
    new MultiSelectTag('writerSelected');
</script>
</html>