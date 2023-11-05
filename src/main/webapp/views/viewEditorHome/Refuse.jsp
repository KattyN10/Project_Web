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
            <span class="text-title">Từ chối duyệt bài viết</span>
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
              <label for="txtDes">Description</label>
              <textarea type="text" rows="5" class="form-control " id="txtDes" name="description" placeholder="Hãy đóng góp ý kiến"></textarea>
            </div>
          </div>
          <div class="card-footer">
            <div class="row float-right mr-5">
              <a href="${pageContext.request.contextPath}/Editor/Home/" class="btn btn-light btn-lg mr-4">Back</a>
              <button type="submit" class="btn btn-outline-danger btn-lg">Refuse</button>
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
