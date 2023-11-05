<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="tags" scope="request" type="java.util.List<com.example.edit.beans.Tag>"/>

<t:main>
    <jsp:body>
       <div class="container mt-5">
           <div class="card">
               <div class="card-header d-flex justify-content-md-between">
                   <span class="text-title">Tags</span>
                   <div class="d-flex">
                       <a href="${pageContext.request.contextPath}/Admin/Tag/Add" class="btn btn-success btn-lg ml-5 "><i class="bi bi-plus-square "></i></a>
                   </div>
               </div>
               <c:choose>
                   <c:when test="${tags.size() == 0}">
                       <div class="body">
                           <p>Không có dữ liệu</p>
                       </div>
                   </c:when>
                   <c:otherwise>
                       <div class="body">
                           <table class="table">
                               <thead class="thead-dark">
                               <tr>
                                   <th scope="col">ID</th>
                                   <th scope="col">Tags Name</th>
                                   <th scope="col">Action</th>

                               </tr>
                               </thead>
                               <tbody>
                               <c:forEach items="${tags}" var="c">
                                   <tr>
                                       <th scope="row">${c.tags_id}</th>
                                       <td>${c.value}</td>
                                       <td class="d-flex " style="font-size: 20px">
                                           <a href="${pageContext.request.contextPath}/Admin/Tag/Update?id=${c.tags_id}" type="button" class="btn link"><i class="bi bi-pencil-square"></i></a>
                                           <a href="${pageContext.request.contextPath}/Admin/Tag/Delete?id=${c.tags_id}" type="button" class="btn link"><i class="bi bi-trash"></i></a>
                                       </td>
                                   </tr>
                               </c:forEach>
                               </tbody>
                           </table>
                       </div>
                   </c:otherwise>
               </c:choose>
               <div class="card-footer d-flex justify-content-md-between">
                   <span class="text-title">Footer</span>

               </div>
           </div>
       </div>
    </jsp:body>
</t:main>