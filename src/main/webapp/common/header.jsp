<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
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
        <form class="form-search-header d-flex" method="get">
            <input type="text" class="input-search-header" name="search" placeholder="Search movie">
            <button class="search-btn d-flex align-items-end" type="submit"><i class="fa-solid fa-magnifying-glass"></i>
            </button>
        </form>
        <div class="account-user">
            <i class="fa-solid fa-user"></i>
        </div>
    </div>
</div>

