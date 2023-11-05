<%@ taglib prefix="t" tagdir="/WEB-INF/tags/main.tag" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="authUser" scope="session" type="com.example.edit.beans.User"/>
<!--

Begin Sidebar
-->
<div class="sidebar">
    <div class="w3-sidebar w3-bar-block w3-card w3-animate-left shadow-lg " style="display:none; background:ghostwhite" id="mySidebar">
        <button type="button" class="close text-right mr-2 mt-3" onclick="w3_close()" aria-label="Close"><span aria-hidden="true"><i class="bi bi-arrow-bar-left" style="font-size: 30px"></i></span></button>
        <div class="sidebar-cate mt-5">
            <div class="logo h-100 w-100">
                <img src="${pageContext.request.contextPath}/image/logo11.png" alt="" class="img-fluid w-100 mt-5">
            </div>
            <c:if test="${authUser.role_id == 1}">
                <h4 class="text-center text-heading mt-5 text-top-heading">ADMIN</h4>
                <li class="nav-item text-center mt-5 text-heading">
                    <div class="panel-group" id="accordion1" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne1">
                                <a class="link nav-link" role="button" data-toggle="collapse" data-parent="#accordion1" href="#collapseOne1" aria-expanded="true" aria-controls="collapseOne1">
                                    <i class="bi bi-caret-down-fill"></i>Categories
                                </a>
                            </div>
                            <div id="collapseOne1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne1">
                                <div class="panel-body">
                                    <div class="row">
                                        <a href="${pageContext.request.contextPath}/Admin/Category/" class="dropdown-item text-par-heading">Quản lí</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="nav-item text-center text-heading">
                    <div class="panel-group" id="accordion2" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne2">
                                <a class="link nav-link" role="button" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne2" aria-expanded="true" aria-controls="collapseOne2">
                                    <i class="bi bi-caret-down-fill"></i>Tags
                                </a>
                            </div>
                            <div id="collapseOne2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne2">
                                <div class="panel-body">
                                    <div class="row">
                                        <a href="${pageContext.request.contextPath}/Admin/Tag/" class="dropdown-item text-par-heading">Quản lí</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="nav-item text-center text-heading">
                    <div class="panel-group" id="accordion3" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne3">
                                <a class="link nav-link" role="button" data-toggle="collapse" data-parent="#accordion3" href="#collapseOne3" aria-expanded="true" aria-controls="collapseOne3">
                                    <i class="bi bi-caret-down-fill"></i>Articles
                                </a>
                            </div>
                            <div id="collapseOne3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne1">
                                <div class="panel-body">
                                    <div class="row">
                                        <a href="${pageContext.request.contextPath}/Admin/News/" class="dropdown-item text-par-heading">Quản lí</a>
                                    </div>
                                    <div class="row">
                                        <a href="${pageContext.request.contextPath}/Admin/News/Draft" class="dropdown-item text-par-heading">Xuất bản</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="nav-item text-center mt-3 text-heading">
                    <div class="panel-group" id="accordion4" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne4">
                                <a class="link nav-link" role="button" data-toggle="collapse" data-parent="#accordion4" href="#collapseOne4" aria-expanded="true" aria-controls="collapseOne4">
                                    <i class="bi bi-caret-down-fill"></i>Users
                                </a>
                            </div>
                            <div id="collapseOne4" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne4">
                                <div class="panel-body">
                                    <div class="row">
                                        <a href="${pageContext.request.contextPath}/Admin/User/" class="dropdown-item text-par-heading mr-1">Quản lí</a>
                                    </div>
                                    <div class="row">
                                        <a href="${pageContext.request.contextPath}/Admin/User/EditCate" class="dropdown-item text-par-heading mr-1">Phân danh mục</a>
                                    </div>
                                    <div class="row">
                                        <a href="${pageContext.request.contextPath}/Admin/User/Account" class="dropdown-item text-par-heading mr-1">Gia hạn tài khoản</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </c:if>
            <c:if test="${authUser.role_id == 3}">
                <h4 class="text-center mt-5 text-heading text-top-heading">REPORTTER</h4>
                <li class="nav-item text-center mt-5 text-heading">
                    <div class="panel-group" id="accordion_rep1" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne_rep1">
                                <a class="link nav-link" role="button" data-toggle="collapse" data-parent="#accordion_rep1" href="#collapseOne_rep1" aria-expanded="true" aria-controls="collapseOne_rep1">
                                    <i class="bi bi-caret-down-fill"></i>Post Articles
                                </a>
                            </div>
                            <div id="collapseOne_rep1" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne_rep1">
                                <div class="panel-body">
                                    <div class="row">
                                        <a href="${pageContext.request.contextPath}/Post" class="dropdown-item text-par-heading">Post</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="nav-item text-center text-heading">
                    <div class="panel-group" id="accordion_rep2" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne_rep2">
                                <a class="link nav-link" role="button" data-toggle="collapse" data-parent="#accordion_rep2" href="#collapseOne_rep2" aria-expanded="true" aria-controls="collapseOne_rep2">
                                    <i class="bi bi-caret-down-fill"></i>List Articles
                                </a>
                            </div>
                            <div id="collapseOne_rep2" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne_rep2">
                                <div class="panel-body">
                                    <div class="row">
                                        <a href="${pageContext.request.contextPath}/Post/Waiting" class="dropdown-item text-par-heading">Waiting</a>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <a href="${pageContext.request.contextPath}/Post/Published" class="dropdown-item text-par-heading">Published</a>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <a href="${pageContext.request.contextPath}/Post/Refused" class="dropdown-item text-par-heading">Refused</a>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <a href="${pageContext.request.contextPath}/Post/Draft" class="dropdown-item text-par-heading">Draft</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </c:if>
            <c:if test="${authUser.role_id == 4}">
                <h4 class="text-center text-heading mt-5 text-top-heading">EDITOR</h4>
                <li class="nav-item text-center mt-5 text-heading">
                    <div class="panel-group" id="accordion_rep3" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne_rep3">
                                <a class="link nav-link" role="button" data-toggle="collapse" data-parent="#accordion_rep3" href="#collapseOne_rep3" aria-expanded="true" aria-controls="collapseOne_rep3">
                                    <i class="bi bi-caret-down-fill"></i>Draft Articles
                                </a>
                            </div>
                            <div id="collapseOne_rep3" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne_rep3">
                                <div class="panel-body">
                                    <div class="row">
                                        <a href="${pageContext.request.contextPath}/Editor/Home" class="dropdown-item text-par-heading">Xử Lý</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="nav-item text-center text-heading">
                    <div class="panel-group" id="accordion_rep4" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne_rep4">
                                <a class="link nav-link" role="button" data-toggle="collapse" data-parent="#accordion_rep4" href="#collapseOne_rep4" aria-expanded="true" aria-controls="collapseOne_rep4">
                                    <i class="bi bi-caret-down-fill"></i>List Articles
                                </a>
                            </div>
                            <div id="collapseOne_rep4" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne_rep4">
                                <div class="panel-body">
                                    <div class="row">
                                        <a href="${pageContext.request.contextPath}/Editor/Home/List/Refuse" class="dropdown-item text-par-heading">Refuse</a>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <a href="${pageContext.request.contextPath}/Editor/Home/List/Agree" class="dropdown-item text-par-heading">Agree</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </c:if>
        </div>
    </div>
</div>

<!--
End Sidebar
-->

