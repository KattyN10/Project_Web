
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="categories" type="java.util.List<com.example.edit.beans.Category>" scope="request"/>
<jsp:useBean id="category" type="com.example.edit.beans.Category" scope="request"/>

<t:main>
   <div class="container">
       <!--
   Begin content
   -->
       <h3 class="text-heading mt-5">${category.name}</h3>
       <div class="card">
           <h4 class="card-header">
               Danh sách các danh mục con
           </h4>
           <div class="card-body">
               <ul class="list-group list-group-flush">
                   <c:forEach items="${categories}" var="a">
                       <li class="list-group-item">
                           <div class="d-flex justify-content-between">
                               <span>${a.name}</span>
                               <a href="${pageContext.request.contextPath}/Admin/Category/Detail/Delete?id=${a.categories_id}" role="button" class="link"><i class="bi bi-trash"></i></a>
                           </div>
                       </li>
                   </c:forEach>
               </ul>
           </div>
       </div>
       <form action="" method="post">
           <div class="card mt-5">
               <h4 class="card-header">
                   Thêm Danh Mục Con
               </h4>
               <div class="card-body">
                   <div class="form-group">
                       <label>Categories</label>
                       <input type="text" name="name" class="form-control w-75">
                   </div>
                   <a href="${pageContext.request.contextPath}/Admin/Category/Index" class="btn btn-light mr-4">Back</a>
                   <button class="btn btn-success float-right" type="submit">Add Categories</button>
               </div>
           </div>
       </form>
           <!--
           End content
           -->
</t:main>
