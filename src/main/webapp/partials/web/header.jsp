<%@ taglib prefix="t" tagdir="/WEB-INF/tags/web.tag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="authUser" scope="session" type="com.example.edit.beans.User"/>
<div class="header">
    <nav class="navbar navbar-expand-lg navbar-light  shadow-sm sticky-top" style="background: #EAE9E8">
        <div class="container d-flex justify-content-between">
            <a class="navbar-brand mb-0 h1" href="${pageContext.request.contextPath}/Home/Index">
                <img src="${pageContext.request.contextPath}/image/logo11.png" class="img-fluid w-100" alt="...">
            </a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav mr-auto mt-2 ml-3">
                    <c:forEach items="${sessionScope.list4cate}" var="o">
                        <li class="nav-item text-category" style="font-size: 16px;">
                            <a class="link nav-link" href="${pageContext.request.contextPath}/Post/Category?cid=${o.categories_id}" aria-expanded="false">
                                    ${o.name}
                            </a>
                        </li>
                    </c:forEach>
                    <li class=" nav-item dropdown">
                        <a class="nav-link show-modal" href="#" role="button" data-toggle="modal" data-target="#myModal" aria-expanded="false">
                            <i class="bi bi-grid-3x3-gap-fill" style="font-size: 16px"></i>
                        </a>
                        <div class="modal fade mt-5" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content modal-cate shadow clearfix">
                                    <button type="button" class="close text-right mr-2" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    <div class="modal-body w-100 h-100">
                                        <div class="container text-category">
                                            <div class="row row-cols-4">
                                                <c:forEach items="${sessionScope.lisAllCate}" var="k">
                                                    <div class="col-3">
                                                        <div class="panel-group" id="a${k.categories_id}" role="tablist" aria-multiselectable="true">
                                                            <div class="panel panel-info">
                                                                <div class="panel-heading" role="tab" id="b${k.categories_id}">
                                                                    <div class="row">
                                                                        <i class="bi bi-align-start mt-2" style="color: darkred;font-size: 17px;"></i>
                                                                        <a href="${pageContext.request.contextPath}/Post/Category?cid=${k.categories_id}" style="font-size: 18px;" class="link nav-link">${k.name}</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <c:if test="${checkEx eq true && checkAccPre == true}">
                        <li class="nav-item text-category mt-1 ml-1 mr-1 " style="font-size: 14px;">
                            <a  class="btn btn-outline-success btn-sm"  href="${pageContext.request.contextPath}/Post/Premium" aria-expanded="false">
                                PREMIUM
                            </a>
                        </li>
                    </c:if>
                </ul>
                <ul class="navbar-nav mr-auto mt-2">
                    <li class="nav-item dropdown text-category">
                        <form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/Posts/Search" >
                            <div class="p-1 rounded rounded-pill shadow-lg mw-100" style="background: snow">
                                <div class="input-group text-white">
                                    <input type="search" name="search" placeholder="Nhập vào đây" aria-describedby="button-addon1" class="form-control border-0 rounded rounded-pill bg-light">
                                    <div class="input-group-append">
                                        <button id="button-addon1" type="submit" class="btn btn-link"><i class="bi bi-search" style="color: black"></i></button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </li>
                    <c:choose>
                        <c:when test="${auth}">
                            <form action="${pageContext.request.contextPath}/User/Logout" method="post" id="frmLogout"></form>
                            <li class="nav-item dropdown text-category">
                                <div class="nav-item dropdown text-category mt-1 ml-3">
                                    <a class="nav-link" href="#" data-toggle="dropdown" role="button"  aria-expanded="false">
                                        <div class="row">
                                            <span class="user-action"><img src="${pageContext.request.contextPath}/image/user.png" class="avatar" alt="Avatar"></span>
                                            <h5 class="text-category mt-1" style="font-size: 16px">Hi, <b>${authUser.name}</b></h5>
                                        </div>

                                    </a>
                                    <div class="dropdown-menu" class="navbarDropdown">
                                        <a href="${pageContext.request.contextPath}/User/Index" class="dropdown-item">Profile</a>
                                        <c:if test="${authUser.role_id == 1}">
                                            <a class="dropdown-item" href="${pageContext.request.contextPath}/Admin/Home/Index" aria-expanded="false">
                                                Admin
                                            </a>
                                        </c:if>
                                        <c:if test="${authUser.role_id == 3}">

                                            <a class="dropdown-item"  href="${pageContext.request.contextPath}/Post" aria-expanded="false">
                                                Reporter
                                            </a>
                                        </c:if>
                                        <c:if test="${authUser.role_id == 4}">
                                            <a class="dropdown-item" href="${pageContext.request.contextPath}/Editor/Home/ " aria-expanded="false">
                                                Editor
                                            </a>
                                        </c:if>
                                        <div class="dropdown-divider"></div>
                                        <a href="javascript: $('#frmLogout').submit()" class="dropdown-item">Logout</a>
                                    </div>
                                </div>
                            </li>
                        </c:when>
                        <c:when test="${authGg}">
                            <form action="${pageContext.request.contextPath}/User/Logout" method="post" id="frmLogout"></form>
                            <li class="nav-item dropdown text-category">
                                <div class="nav-item dropdown text-category mt-1 ml-4">
                                    <a class="nav-link" href="#" data-toggle="dropdown" role="button"  aria-expanded="false">
                                        <div class="row">
                                            <span class="user-action"><img src="${sessionScope.authUserGg.picture}" class="avatar" alt="Avatar"></span>
                                            <h5 class="text-category mt-2" style="font-size: 9px">Hi, <b>${sessionScope.authUserGg.name}</b></h5>
                                        </div>

                                    </a>
                                    <div class="dropdown-menu" class="navbarDropdown">
                                        <a href="${pageContext.request.contextPath}/views/ViewUser/Index.jsp" class="dropdown-item">Profile</a>
                                        <div class="dropdown-divider"></div>
                                        <a href="javascript: $('#frmLogout').submit()" class="dropdown-item">Logout</a>
                                    </div>
                                </div>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item dropdown text-category mt-1 ml-3">
                                <a href="${pageContext.request.contextPath}/User/Login" class="text-category nav-link link" style="font-size: 20px">LOGIN</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </nav>
</div>