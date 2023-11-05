<%@ taglib prefix="t" tagdir="/WEB-INF/tags/main.tag" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="authUser" scope="session" type="com.example.edit.beans.User"/>

<div class="w3-container">
    <nav class="navbar navbar-expand-xl navbar-dark bg-dark shadow-lg">
        <button type="button" class="close text-right mr-4 " onclick="w3_open()" aria-label="Open"><span aria-hidden="true"><i class="bi bi-list" style="color: white; font-size: 25px"></i></span></button>
        <a href="${pageContext.request.contextPath}/Home" class="navbar-brand">UTE<b> NEWS</b></a>
        <div id="navbarCollapse" class="collapse navbar-collapse justify-content-start">

            <div class="navbar-nav ml-auto">
                <c:if test="${authUser.role_id == 1}">
                <a href="${pageContext.request.contextPath}/Admin/Home/Index" class="nav-item nav-link active mr-2"><i class="bi bi-house"></i> Home</a>
                </c:if>
            </div>

            <c:if test="${authUser.role_id == 3}">
                <div class="dropdown">
                    <a href="#" data-toggle="dropdown" class="dropdown-link" aria-haspopup="true" aria-expanded="false">
                        <span class="wrap-icon nav-item nav-link "><i class="bi bi-bell-fill"></i> Feedback</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-lg-left" aria-labelledby="dropdownMenuButton">
                        <ul class="list-group">
                            <li class="list-group-item"><a href="${pageContext.request.contextPath}/Feedback">Feedback</a></li>
                        </ul>
                    </div>
                </div>
            </c:if>
            <div class="nav-item ">
                <span  class="nav-item nav-link user-action"><img src="${pageContext.request.contextPath}/image/user.png" class="avatar" alt="Avatar"> ${authUser.second_name} <b class="caret"></b></span>
            </div>
        </div>
    </nav>
</div>