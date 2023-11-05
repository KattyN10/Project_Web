<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="d" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<d:web>
  <div class="content">
    <div class="tag mb-3">
      <div class="navbar-expand-lg">
        <div class="container-sm d-flex justify-content-sm-between">
          <div class="weather-item text-heading border-danger">TP.HCM - ${Day}</div>
        </div>
      </div>
    </div>
    <div class="new-news">
      <div class="container">
        <div class="text-heading border-danger" style="font-size: 25px"><i class="bi bi-align-start"></i>
          Tìm kiếm </div>
        <div class="row mt-5">
          <ul class="list-unstyled mt-5">
            <c:forEach items="${list}" var="o">
              <li class="media my-4" style="height: 250px">
                <img src="${pageContext.request.contextPath}/image/Article/${o.avatar}" class="mr-3 img-fluid d-block w-25 h-100 " alt="...">
                <div class="media-body">
                  <a href="${pageContext.request.contextPath}/Detail?article_id=${o.article_id}">
                    <h4 class="mt-0 mb-1  text-uppercase font-weight-bold">${o.title}</h4>
                  </a>
                  <p> ${o.abstracts} </p>
                  <a  style="color: white" class="badge badge-pill badge-primary  mb-3" href="${pageContext.request.contextPath}/Post/Category?cid=${o.categories_id}">${o.categoryName}</a>
                  <p><i class="bi bi-calendar mr-2"></i> ${o.publish_date} </p>
                </div>
              </li>
              <hr>
            </c:forEach>
          </ul>
        </div>
      </div>
    </div>
    <div>
      <nav class="my-4" aria-label="...">
        <ul class="pagination pagination-circle justify-content-center">
          <li class="page-item">
            <a class="page-link" href="${pageContext.request.contextPath}/Post/Premium?index=${indexPre}" tabindex="-1" aria-disabled="true">Previous</a>
          </li>
          <c:forEach begin="1" end="${EndPage}" var="i">
            <li class="page-item ">
              <a  class="${tag==i?"active":" page-link "}"
                  href="${pageContext.request.contextPath}/Post/Premium?index=${i}"> ${i}
                <span class="sr-only">(current)</span></a>
            </li>
          </c:forEach>
          <li class="page-item">
            <a class="page-link" href="${pageContext.request.contextPath}/Post/Premium?index=${indexNext}">Next</a>
          </li>
        </ul>
      </nav>
    </div>


  </div>
</d:web>