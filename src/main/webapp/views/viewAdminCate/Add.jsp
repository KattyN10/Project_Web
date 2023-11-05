
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>




<t:main>
  <!--
  Begin content
  -->
  <div class="content-cate mt-5">
    <form action="" id="#frmAdd" method="post">
    <div class="container">
      <div class="card">
        <div class="card-header d-flex justify-content-md-between">
          <span class="text-title">Add Categories</span>
        </div>
        <div class="card-body ml-5">

              <div class="form-group">
                <label for="txtName">Categories Name</label>
                <input type="text" class="form-control w-50" id="txtName" name="name" placeholder="Nhập vào đây..">
              </div>

        </div>
        <div class="card-footer">
          <div class="row float-right mr-5">
            <a href="${pageContext.request.contextPath}/Admin/Category/Index" class="btn btn-light btn-lg mr-4">Back</a>
            <button type="submit" class="btn btn-success btn-lg">Add</button>
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
