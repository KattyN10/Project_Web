
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="categories" type="java.util.List<com.example.edit.beans.Category>" scope="request"/>




<t:main>
  <!--
Begin content
-->
<div class="content-cate mt-5">
  <div class="container">
    <div class="card">
      <div class="card-header d-flex justify-content-md-between">
        <span class="text-title">Categories</span>
        <div class="d-flex">
          <a href="${pageContext.request.contextPath}/Admin/Category/Add" class="btn btn-success btn-lg ml-3 "><i class="bi bi-plus-square "></i></a>
        </div>
      </div>
      <div class="body">
        <table class="table">
          <thead class="thead-dark">
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Category Name</th>
            <th scope="col">Action</th>

          </tr>
          </thead>
          <tbody>
          <c:forEach items="${categories}" var="k">
            <tr>
              <th scope="row">${k.categories_id}</th>
              <td>${k.name}</td>
              <td class="d-flex " style="font-size: 20px">
                <a href="${pageContext.request.contextPath}/Admin/Category/Update?id=${k.categories_id}" type="button" class="btn link"><i class="bi bi-pencil-square"></i></a>
                <a href="${pageContext.request.contextPath}/Admin/Category/Delete?id=${k.categories_id}" role="button" class="btn link"><i class="bi bi-trash"></i></a>
                <a href="${pageContext.request.contextPath}/Admin/Category/Detail?id=${k.categories_id}" type="button" class="btn link"><i class="bi bi-eye"></i></a>
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
