<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="icon" href="${pageContext.request.contextPath}/assets/images/logo-title.png">
    <title>Login</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
            crossorigin="anonymous"
    />

</head>
<body>
<form action="/admin?path=user&action=update" method="post">
    <input
            type="text"
            name="id"
            class="password w-100"
            value="${account.getId()}"
    />

    <input
            type="password"
            name="password"
            class="password w-100"
           value="${account.getPassword()}"
    />

    <input
            type="password"
            name="password"
            class="password w-100"
            placeholder="Nhập mật khẩu mới"
    />
    <input
            type="password"
            name="confirmPassword"
            class="password w-100"
            placeholder="Nhập lại mật khẩu"
    />
    <input
            type="submit"
            class="submit-btn w-100 fw-bold"
            value="Submit"
    />
</form>
</body>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"
></script>
</html>

