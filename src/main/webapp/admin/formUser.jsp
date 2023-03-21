<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <link rel="icon" href="${pageContext.request.contextPath}/assets/images/logo-title.png">
  <title>Reset Password</title>
  <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous"
  />
</head>
<style>
  *,
  div,
  p {
    margin: 0;
    padding: 0;
  }
  body {
    background: #000;
    color: #fff;
  }

  .container {
    min-width: 100%;
    padding: 0;
    background-image: linear-gradient(
            rgba(10, 10, 10, 0.7),
            rgba(10, 10, 10, 0.7)),
    url(../assets/images/header-image.png);
    height: 100vh;
    font-family: Netflix Sans, Helvetica Neue, Segoe UI, Roboto, Ubuntu,
    sans-serif;
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
  /* --------------------MAIN--------------------- */
  .main {
    display: flex;
    justify-content: center;
    align-items: center;
  }
  .main .form-login {
    margin-top: 100px;
    width: 450px;
    height: 600px;
    backdrop-filter: brightness(25%);
    border-radius: 5px;
    padding: 60px 68px 40px;
  }

  .form-login #login h1 {
    font-size: 32px;
    font-weight: 450;
    margin-bottom: 28px;
  }

  #login .username,
  #login .password {
    outline: 0;
    color: #fff;
    background: #333;
    border: 0;
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


  @media only screen and (max-width: 768px) {
    .container {
      background: none;
    }

    .main .form-login {
      background: transparent;
      width: 100%;
    }
  }

</style>
<body>
<div class="container">
  <div class="header">
    <nav class="navbar navbar-expand-lg bg-body-tertiary" style="box-shadow: rgba(17, 17, 26, 0.1) 0px 1px 0px;">
      <div class="container-fluid">
        <img src="/oneteam.png" alt="Trang chủ" onclick="location.href = 'admin'" style="width: 8rem;height: 3rem">
        <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link" style="color: #fff; font-size: 22.4px" aria-current="page" href="admin?path=movie">Movies</a>
            </li>
            <li class="nav-item">
              <a class="nav-link"style="color: #fff; font-size: 22.4px" href="admin?path=user">Users</a>
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
            Reset password success.
        </div>
        <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
      </div>
    </div>
  </c:if>
  <div class="main">
    <div class="form-login">
      <form id="login" method="post">
        <h1>Reset password</h1>
        <input
                type="text"
                name="username"
                class="username w-100"
                value="${accountUser.getUsername()}"
                disabled
        />
        <input
                type="text"
                name="password"
                class="password w-100"
                value="${accountUser.getPassword()}"
                disabled
        />
        <input
                type="password"
                name="newPassword"
                class="password w-100"
                placeholder="New Password"
                required
                pattern="[A-Za-z0-9]{6,}"
                title="More 6 characters"
        />
        <c:if test="${param.status == false}">
          <p style="color: red">You confirmed the wrong password</p>
        </c:if>
        <input
                type="password"
                name="confirmPassword"
                class="password w-100"
                placeholder="Confirm Password"
                required
                pattern="[A-Za-z0-9]{6,}"
                title="More 6 characters"
        />
        <input
                type="submit"
                class="submit-btn w-100 fw-bold"
                value="Reset password"
        />
      </form>
    </div>
  </div>
</div>
</body>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"
></script>
<script>
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
</script>
</html>

