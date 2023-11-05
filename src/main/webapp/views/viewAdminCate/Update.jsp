
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="category" scope="request" type="com.example.edit.beans.Category"/>




<t:main>
    <!--
    Begin content
    -->
    <div class="content-cate mt-5">
        <form action="" id="#frmUpdate" method="post">
            <div class="container">
                <div class="card">
                    <div class="card-header d-flex justify-content-md-between">
                        <span class="text-title">Update Categories</span>
                    </div>
                    <div class="card-body ml-5">
                        <div class="form-group">
                            <label for="txtName">Categories ID</label>
                            <input type="text" class="form-control w-50" id="txtId" name="categories_id" value="${category.categories_id}" readonly>
                        </div>
                        <div class="form-group">
                            <label for="txtName">Categories Name</label>
                            <input type="text" class="form-control w-50" id="txtName" name="name"  value="${category.name}">
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="row float-right mr-5">
                            <a href="${pageContext.request.contextPath}/Admin/Category/Index" class="btn btn-light btn-lg mr-4">Back</a>
                            <button type="submit" class="btn btn-success btn-lg">Update</button>
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
