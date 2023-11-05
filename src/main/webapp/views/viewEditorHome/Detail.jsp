
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="Articles" scope="request" type="com.example.edit.beans.Articles"/>
<jsp:useBean id="User" scope="request" type="com.example.edit.beans.User"/>

<t:main>

  <jsp:body>
    <div class="container mt-5">
      <div class="content-news mt-5">
        <div class="container">
          <div class="card w-100 h-100 shadow">
            <div class="card-header d-flex justify-content-md-between">
              <span class="text-title">Bài Viết</span>
            </div>
            <div class="body">
              <table class="table">
                <thead class="thead-dark">
                <tr>
                  <th scope="col">Attribute</th>
                  <th scope="col">Description</th>
                </tr>
                </thead>
                <tbody>
                  <tr>
                    <th>ID:</th>
                    <td>${Articles.article_id}</td>
                  </tr>
                  <tr>
                    <th>Title:</th>
                    <td>${Articles.title}</td>
                  </tr>
                  <tr>
                    <th>Create Date:</th>
                    <td>${Articles.create_date}</td>
                  </tr>
                  <tr>
                    <th>Views:</th>
                    <td>${Articles.views}</td>
                  </tr>
                  <tr>
                    <th>Abstracts:</th>
                    <td>${Articles.abstracts}</td>
                  </tr>
                  <tr>
                    <th>Contents:</th>
                    <td>${Articles.content}</td>
                  </tr>
                  <tr>
                    <th>Categories:</th>
                    <td>${Articles.categoryName}</td>
                  </tr>
                  <tr>
                    <th>Premium:</th>
                    <td>${Articles.premium}</td>
                  </tr>
                  <tr>
                    <th>Writer:</th>
                    <td>${User.second_name}</td>
                  </tr>
                  <tr>
                    <th>Status:</th>
                    <td>draft</td>
                  </tr>
                  <tr>
                    <th>Avatar:</th>
                    <td><img src="${pageContext.request.contextPath}/image/Article/${Articles.avatar}" weight="400" height="400" alt=""></td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="card-footer d-flex justify-content-md-between">
              <a href="${pageContext.request.contextPath}/Editor/Home/" type="button" class="btn btn-primary btn-lg">Back</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </jsp:body>

</t:main>