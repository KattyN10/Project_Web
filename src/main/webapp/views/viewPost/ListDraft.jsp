<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="listDraft" scope="request" type="java.util.List<com.example.edit.beans.Articles>"/>

<t:main>
  <!--
  Begin content
  -->
  <div class="content-cate mt-5">
    <div class="container">
      <div class="card w-100 h-100 shadow">
        <div class="card-header d-flex justify-content-md-between">
          <span class="text-title">Draft Articles</span>
        </div>
        <div class="body">
          <table class="table">
            <thead class="thead-dark">
            <tr>
              <th scope="col">ID</th>
              <th scope="col">Title</th>
              <th scope="col">Date</th>
              <th scope="col">Views</th>
              <th scope="col">Abstract</th>
              <th scope="col">Category</th>
              <th scope="col">Writer</th>
              <th scope="col">Status</th>
              <th scope="col">Premium</th>
              <th scope="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listDraft}" var="r">
              <tr>
                <th scope="row">${r.article_id}</th>
                <td>${r.title}</td>
                <td>${r.create_date}</td>
                <td>${r.views}</td>
                <td>${r.abstracts}</td>
                <td>${r.categoryName}</td>
                <td>${r.second_name}</td>
                <td><span class="badge badge-danger">draft</span></td>
                <c:choose>
                  <c:when test="${r.premium eq true}">
                    <td><span class="badge badge-success"><i class="bi bi-check-square"></i></span></td>
                  </c:when>
                  <c:when test="${r.premium eq false}">
                    <td><span class="badge badge-danger"><i class="bi bi-x-square"></i></span></td>
                  </c:when>
                </c:choose>
                <td class="d-flex justify-content-sm-between" style="font-size: 20px">
                  <a href="${pageContext.request.contextPath}/Post/Update?article_id=${r.article_id}" type="button" class="btn link"><i class="bi bi-pencil-square"></i></a>
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

  <!--
  End content
  -->
</t:main>