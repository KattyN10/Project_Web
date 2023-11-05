<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="article" scope="request" type="com.example.edit.beans.Articles"/>

<t:main>
  <!--
  Begin content
  -->
  <div class="content-cate mt-5">
    <form action="" method="post">
      <div class="container">
        <div class="card">
          <div class="card-header d-flex justify-content-md-between">
            <span class="text-title">Xác nhận bài viết</span>
          </div>
          <div class="card-body ml-5">
            <div class="form-group">
              <label for="txtName">ID</label>
              <input type="text" class="form-control " id="txtID" name="article_id"  value="${article.article_id}" readonly>
            </div>
            <div class="form-group">
              <label for="txtName">Title</label>
              <input type="text" class="form-control " id="txtName" name="title" value="${article.title}" readonly>
            </div>
            <div class="form-group">
              <label for="txtCategory">Categories</label>
              <select id="txtCategory" class="form-control " name="name">
                <c:forEach items="${categories}" var="c">
                  <option>${c.name}</option>
                </c:forEach>
              </select>
            </div>
            <div class="title">Danh sách Tag</div>
            <div class="border mt-3">
              <ul class="list-group list-group-flush">
                <c:forEach items="${tags}" var="a">
                  <li class="list-group-item">
                    <div class="d-flex justify-content-between">
                      <span>${a.value}</span>
                    </div>
                  </li>
                </c:forEach>
              </ul>
            </div>
           <div class="mb-3 float-right">
             <a href="${pageContext.request.contextPath}/Editor/EditTag/Index?article_id=${article.article_id}">Chỉnh sửa Tags</a>
           </div>
            <div class="form-group mt-3">
              <label >Publish Date</label>
              <input type="date" name="publish_date" class="form-control">
            </div>
          </div>
          <div class="card-footer">
            <div class="row float-right mr-5">
              <a href="${pageContext.request.contextPath}/Editor/Home" class="btn btn-light btn-lg mr-4">Back</a>
              <button type="submit" class="btn btn-outline-success btn-lg">Agree</button>
            </div>
          </div>
        </div>
      </div>
    </form>
  </div>

  <!--
  End content
  -->
</t:main>
