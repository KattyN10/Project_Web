
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="list" scope="request" type="java.util.List<com.example.edit.beans.Articles>"/>

<t:main>
    <jsp:body>
        <div class="container mt-5">
            <div class="content-cate mt-5">
                <div class="container">
                    <div class="card w-100 h-100 shadow">
                        <div class="card-header d-flex justify-content-md-between">
                            <span class="text-title">Articles</span>
                            <div class="d-flex">
                                <a href="${pageContext.request.contextPath}/Admin/News/Add" class="btn btn-success btn-lg ml-5 "><i class="bi bi-plus-square "></i></a>
                            </div>
                        </div>
                        <div class="body">
                            <table class="table">
                                <thead class="thead-dark text-center">
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Title</th>
                                    <th scope="col">Date</th>
                                    <th scope="col">Views</th>
                                    <th scope="col">Abstract</th>
                                    <th scope="col">Category</th>
                                    <th scope="col">Writer</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Prenium</th>
                                    <th scope="col">Action</th>

                                </tr>
                                </thead>
                                <tbody class="text-center">
                                <c:forEach items="${list}" var="a">
                                    <tr>
                                        <th scope="row">${a.article_id}</th>
                                        <td>${a.title}</td>
                                        <td>${a.publish_date}</td>
                                        <td>${a.views}</td>
                                        <td>${a.abstracts}</td>
                                        <td>${a.categoryName}</td>
                                        <td>${a.second_name}</td>
                                        <td>
                                            <c:if test="${a.status_id == 103}">
                                                <span class="badge badge-primary">fail</span>
                                            </c:if>
                                            <c:if test="${a.status_id == 102}">
                                                <span class="badge badge-success">push</span>
                                            </c:if>
                                            <c:if test="${a.status_id == 104}">
                                                <span class="badge badge-danger">draft</span>
                                            </c:if>
                                            <c:if test="${a.status_id == 101}">
                                                <span class="badge badge-warning">wait</span>
                                            </c:if>
                                        </td>
                                        <c:if test="${a.premium eq true}">
                                            <td>
                                                <span class="badge badge-success"><i class="bi bi-check-square"></i></span>
                                            </td>
                                        </c:if>
                                        <c:if test="${a.premium eq false}">
                                            <td>
                                                <span class="badge badge-danger"><i class="bi bi-x-square"></i></span>
                                            </td>
                                        </c:if>
                                        <td class="d-flex justify-content-sm-between" style="font-size: 20px">
                                            <a href="${pageContext.request.contextPath}/Admin/News/Update?id=${a.article_id}" type="button" class="btn link"><i class="bi bi-pencil-square"></i></a>
                                            <a href="${pageContext.request.contextPath}/Admin/News/Delete?id=${a.article_id}" type="button" class="btn link"><i class="bi bi-trash"></i></a>
                                            <a href="${pageContext.request.contextPath}/Admin/News/Detail?id=${a.article_id}" type="button" class="btn link"><i class="bi bi-eye"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>
                        </div>
                        <div class="card-footer d-flex justify-content-md-between">
                            <span class="text-title">Footer</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>

</t:main>