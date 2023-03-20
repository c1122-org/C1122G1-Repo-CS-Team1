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

    .mult-select-tag .rounded {
        background: #d9d9d9;
    }
</style>
</head>
<body>
<div class="header" style="position: fixed; top: 0; left: 0; right: 0; z-index: 1000">
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand fw-bold" href="home">Home</a>
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
                                    <li><a class="dropdown-item" href="admin">Manager</a></li>
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
                    ${message} thành công.
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
<<<<<<< HEAD
                    placeholder="Name movie"
=======
                    placeholder="Nhập tên phim"
                    required
>>>>>>> 921264037db18d030d80c5bfd851f0993ea58bd0
            />
            <p>Movie Genre</p>
            <select name="type" style="background: #d9d9d9; margin-bottom: 16px" class="form-select"
<<<<<<< HEAD
                    aria-label="Default select example">
                <option selected>Choose genre</option>
=======
                    aria-label="Default select example" required>
                <option selected>Chọn thể loại</option>
>>>>>>> 921264037db18d030d80c5bfd851f0993ea58bd0
                <c:forEach items="${genreList}" var="genre">
                    <option value="${genre.getId()}">${genre.getName()}</option>
                </c:forEach>
            </select>
            <p style="margin-top: 16px">Movie Director</p>
            <select name="director" style="background: #d9d9d9; margin-bottom: 16px" class="form-select"
                    aria-label="Default select example" id="director" required multiple>
                <c:forEach items="${directorList}" var="director">
                    <option value="${director.getId()}">${director.getName()}</option>
                </c:forEach>
            </select>
            <p style="margin-top: 16px">Author</p>
            <select name="writer" style="background: #d9d9d9; margin-bottom: 16px" class="form-select"
                    aria-label="Default select example" id="writer" required multiple>
                <c:forEach items="${writerList}" var="writer">
                    <option value="${writer.getId()}">${writer.getName()}</option>
                </c:forEach>
            </select>
            <p style="margin-top: 16px">Rating</p>
            <input
                    type="text"
                    name="rating"
                    class="username w-100"
<<<<<<< HEAD
                    placeholder="Enter rating"
            />
            <p>Rank</p>
=======
                    placeholder="Nhập điểm bình chọn"
                    required
            />
            <c:if test="${param.status == false}"><p
                    style="color: red; font-weight: unset;font-size: 12px; margin-top: -8px">Bắt buộc phải là số. Vui
                lòng thử lại</p></c:if>
            <p>Xếp hạng phim</p>
>>>>>>> 921264037db18d030d80c5bfd851f0993ea58bd0
            <input
                    type="text"
                    name="rank"
                    class="username w-100"
<<<<<<< HEAD
                    placeholder="Enter rank"
            />
            <p>Year Public</p>
=======
                    placeholder="Nhập vị trí xếp hạng"
                    required
            />
            <c:if test="${param.status == false}"><p
                    style="color: red; font-weight: unset;font-size: 12px; margin-top: -8px">Bắt buộc phải là số. Vui
                lòng thử lại</p></c:if>
            <p>Năm sản xuất</p>
>>>>>>> 921264037db18d030d80c5bfd851f0993ea58bd0
            <input
                    type="text"
                    name="yearPublic"
                    class="username w-100"
<<<<<<< HEAD
                    placeholder="Enter year public"
            />
            <p>Link Image</p>
            <input
                    type="text"
                    name="image"
                    class="username w-100"
                    placeholder="Link image"
            />
            <p>Description</p>
            <input
                    type="text"
                    name="description"
                    class="username w-100"
                    placeholder="Description"
            />
            <p>Link trailer</p>
=======
                    placeholder="Nhập năm sản xuất"
                    required
            />
            <c:if test="${param.status == false}"><p
                    style="color: red; font-weight: unset;font-size: 12px; margin-top: -8px">Bắt buộc phải là số. Vui
                lòng thử lại</p></c:if>
            <p>Link ảnh đại diện</p>
            <input class="mb-3" type="file" id="img" name="img" accept="image/*">
            <p>Miêu tả phim</p>
            <textarea name="description" class="username w-100"></textarea>
            <p>Link trailer phim</p>
>>>>>>> 921264037db18d030d80c5bfd851f0993ea58bd0
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
                    value="Create"
            />
        </form>
    </c:if>
    <c:if test="${movie != null}">
        <form id="login" method="post" enctype="multipart/form-data">
            <h1>${message}</h1>
            <p>Name movie</p>
            <input
                    type="text"
                    name="title"
                    class="username w-100"
                    placeholder="Enter name movie"
                    value="${movie.getTitle()}"
                    required
            />
<<<<<<< HEAD
            <p>Movie Genre</p>
=======
            <c:if test="${param.status == false && param.error.equals('required')}"><p
                    style="color: red; font-weight: unset;font-size: 12px; margin-top: -8px">Vui lòng nhập đầy đủ các
                trường.</p></c:if>
            <p>Thể loại</p>
>>>>>>> 921264037db18d030d80c5bfd851f0993ea58bd0
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
<<<<<<< HEAD
            <p style="margin-top: 16px">Movie Director</p>
=======
            <c:if test="${param.status == false && param.error.equals('required')}"><p
                    style="color: red; font-weight: unset;font-size: 12px; margin-top: -8px">Vui lòng nhập đầy đủ các trường.</p></c:if>
            <p style="margin-top: 16px">Đạo diễn phim</p>
>>>>>>> 921264037db18d030d80c5bfd851f0993ea58bd0
            <select name="directorSelected" style="background: #d9d9d9; margin-bottom: 16px" class="form-select"
                    aria-label="Default select example" id="directorSelected" required multiple="multiple">
                <c:forEach items="${directorListSelected}" var="directorSelected">
                    <option value="${directorSelected.getId()}" selected>${directorSelected.getName()}</option>
                </c:forEach>
                <c:forEach items="${directorList}" var="director">
                    <option value="${director.getId()}">${director.getName()}</option>
                </c:forEach>
            </select>
<<<<<<< HEAD
            <p style="margin-top: 16px">Author</p>
=======
            <c:if test="${param.status == false && param.error.equals('required')}"><p
                    style="color: red; font-weight: unset;font-size: 12px;">Vui lòng nhập đầy đủ các trường.</p></c:if>
            <p style="margin-top: 16px">Tác giả phim</p>
>>>>>>> 921264037db18d030d80c5bfd851f0993ea58bd0
            <select name="writerSelected" style="background: #d9d9d9; margin-bottom: 16px" class="form-select"
                    aria-label="Default select example" id="writerSelected" required multiple>
                <c:forEach items="${writerListSelected}" var="writerSelected">
                    <option value="${writerSelected.getId()}" selected>${writerSelected.getName()}</option>
                </c:forEach>
                <c:forEach items="${writerList}" var="writer">
                    <option value="${writer.getId()}">${writer.getName()}</option>
                </c:forEach>
            </select>
<<<<<<< HEAD
            <p style="margin-top: 16px">Rating</p>
=======
            <c:if test="${param.status == false && param.error.equals('required')}"><p
                    style="color: red; font-weight: unset;font-size: 12px;">Vui lòng nhập đầy đủ các trường.</p></c:if>
            <p style="margin-top: 16px">Điểm số phim</p>
>>>>>>> 921264037db18d030d80c5bfd851f0993ea58bd0
            <input
                    type="text"
                    name="rating"
                    class="username w-100"
                    placeholder="Enter rating"
                    value="${movie.getRating()}"
                    required
            />
<<<<<<< HEAD
            <p>Rank</p>
=======
            <c:if test="${param.status == false && param.error.equals('number')}"><p
                    style="color: red; font-weight: unset;font-size: 12px; margin-top: -8px">Bắt buộc phải là số. Vui
                lòng thử lại</p></c:if>
            <p>Xếp hạng phim</p>
>>>>>>> 921264037db18d030d80c5bfd851f0993ea58bd0
            <input
                    type="text"
                    name="rank"
                    class="username w-100"
                    placeholder="Enter rank"
                    value="${movie.getRank()}"
                    required
            />
<<<<<<< HEAD
            <p>Year Public</p>
=======
            <c:if test="${param.status == false && param.error.equals('number')}"><p
                    style="color: red; font-weight: unset;font-size: 12px; margin-top: -8px">Bắt buộc phải là số. Vui
                lòng thử lại</p></c:if>
            <p>Năm sản xuất</p>
>>>>>>> 921264037db18d030d80c5bfd851f0993ea58bd0
            <input
                    type="text"
                    name="yearPublic"
                    class="username w-100"
                    placeholder="Enter year public"
                    value="${movie.getYearPublic()}"
                    required
            />
<<<<<<< HEAD
            <p>Link Image</p>
            <input
                    type="text"
                    name="image"
                    class="username w-100"
                    placeholder="Link Image"
                    value="${movie.getImage()}"
            />
            <p>Description</p>
            <input
                    type="text"
                    name="description"
                    class="username w-100"
                    placeholder="Description"
                    value="${movie.getDescription()}"
            />
            <p>Link trailer</p>
=======
            <c:if test="${param.status == false && param.error.equals('number')}"><p
                    style="color: red; font-weight: unset;font-size: 12px; margin-top: -8px">Bắt buộc phải là số. Vui
                lòng thử lại</p></c:if>
            <p>Link ảnh đại diện</p>
            <input class="mb-3" type="file" id="img" name="img" accept="image/*">
            <c:if test="${param.status == false && param.error.equals('required')}"><p
                    style="color: red; font-weight: unset;font-size: 12px; margin-top: -8px">Vui lòng nhập đầy đủ các
                trường.</p></c:if>
            <p>Miêu tả phim</p>
            <textarea name="description" class="username w-100">${movie.getDescription()}</textarea>
            <c:if test="${param.status == false && param.error.equals('required')}"><p
                    style="color: red; font-weight: unset;font-size: 12px; margin-top: -8px">Vui lòng nhập đầy đủ các
                trường.</p></c:if>
            <p>Link trailer phim</p>
>>>>>>> 921264037db18d030d80c5bfd851f0993ea58bd0
            <input
                    type="text"
                    name="trailer"
                    class="username w-100"
                    placeholder="Link trailer"
                    value="${movie.getTrailer()}"
                    required
            />
            <c:if test="${param.status == false && param.error.equals('required')}"><p
                    style="color: red; font-weight: unset;font-size: 12px; margin-top: -8px">Vui lòng nhập đầy đủ các
                trường.</p></c:if>
            <input
                    type="button"
                    id="update-submit-btn"
                    class="submit-btn w-100 fw-bold"
                    data-bs-toggle="modal" data-bs-target="#staticBackdrop"
                    value="Edit"
            />
        </form>
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
             tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Submit</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Edit "${movie.getTitle()}" ?
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