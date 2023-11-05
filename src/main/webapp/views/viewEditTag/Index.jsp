
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<t:main>

  <jsp:body>
    <div class="content-cate mt-5">
      <form action="" id="#frmEdit" method="post">
        <div class="container">
          <div class="card">
            <div class="card-header d-flex justify-content-md-between">
              <span class="text-title">Danh sách Tags</span>
            </div>
            <div class="card-body">
              <ul class="list-group list-group-flush">
                <c:forEach items="${tags}" var="a">
                  <li class="list-group-item">
                    <div class="d-flex justify-content-between">
                      <span>${a.value}</span>
                      <a href="${pageContext.request.contextPath}/Editor/EditTag/Delete?tags_id=${a.tags_id}&a_id=${a.article_id}" type="button" class="link"><i class="bi bi-trash"></i></a>
                    </div>
                  </li>
                </c:forEach>
              </ul>
            </div>
            <div class="card-body ml-5">
              <div class="form-group">
                <label for="exampleFormControlSelect1">Tags</label>
                <select class="form-control w-75" id="exampleFormControlSelect1" name="tags_id">
                  <c:forEach items="${listtag}" var="k">
                    <option value="${k.tags_id}">${k.value}</option>
                  </c:forEach>
                </select>
              </div>
            </div>
            <div class="card-footer">
              <div class="row float-right mr-5">
                <a href="${pageContext.request.contextPath}/Editor/Home/Agree?article_id=${article.article_id}" class="btn btn-light btn-lg mr-4">Back</a>
                <button type="submit" class="btn btn-success btn-lg">Add Tags</button>
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>
  </jsp:body>

</t:main>
