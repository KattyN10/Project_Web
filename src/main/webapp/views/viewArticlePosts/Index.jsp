<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="d" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<d:web>
<jsp:attribute name="css">
    <style>
        .list3row a{
            text-decoration: none;
        }
        .rowcontent:hover a{
            text-decoration: none;
            cursor: pointer;
            color: #2d3436;
            text-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            transform: translate(0);
        }
    </style>
    <link href="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.2.5/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
</jsp:attribute>
    <jsp:body>
        <div class="container">
            <div class="content">
                <c:forEach items="${listCa}" var="o">
                    <h1 class="text-heading" style="text-align: center; border-bottom: 1px solid black;">
                        <div  style=" color: #333 !important;">${o.name}</div>
                    </h1>
                </c:forEach>

                <c:if test="${check eq true}">
                    <div class="menu_two" style="border-bottom: 3px solid rgb(234, 222, 207); margin-bottom: 16px;">
                        <ul class="nav justify-content-center">
                            <c:forEach items="${listC}" var="o">
                                <li class="nav-item">
                                    <a style="color: #333" class="link nav-link active" href="${pageContext.request.contextPath}/Post/Category?cid=${o.categories_id}">${o.name}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:if>
                <section class="border-bottom pb-4 mb-5">
                    <div class="row row-cols-2">
                        <div class="col-6">
                            <div class="bg-image hover-overlay ripple shadow-2-strong rounded-5" style="height: 350px" data-mdb-ripple-color="light">
                                <img src="${pageContext.request.contextPath}/image/Article/${listOneTag.get(0).avatar}" class="img-fluid h-100 w-100" />
                                <a href="${pageContext.request.contextPath}/Detail?article_id=${o.article_id}">
                                    <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                                </a>
                            </div>
                        </div>
                        <!--  -->
                        <div class="col-6">
                            <div class="d-flex justify-content-between">
                                <div class="badge badge-warning badge-pill mb-3">Tin mới nhất</div>
                                <p><i class="bi bi-calendar mr-2"></i>${listOneTag.get(0).publish_date}</p>
                            </div>
                            <h4 class="mt-0 mb-1  text-uppercase font-weight-bold"><strong>${listOneTag.get(0).title}</strong></h4>
                            <p class="text-muted">
                                    ${listOneTag.get(0).abstracts}
                            </p>
                            <div class="chip">
                                <c:forEach items="${listOneTag}" var="l">
                                    <p class="badge badge-info badge-pill"></i>${l.value}</p>
                                </c:forEach>
                            </div>
                            <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/Detail?article_id=${listOneTag.get(0).article_id}">Tìm hiểu ngay</a>
                        </div>
                    </div>
                </section>
                <!--  -->
                <section>
                    <div class="list3row row gx-lg-5">
                        <c:forEach items="${listT}" var="o">
                            <div class="col-lg-4 rowcontent">
                                <!-- News block -->
                                <div style="height: 600px">
                                    <!-- Featured image -->
                                    <div class="bg-image hover-overlay shadow-1-strong ripple rounded-5 mb-4"
                                         data-mdb-ripple-color="light">
                                        <img style="    max-width: 90% !important;     height: 286px;" src="${pageContext.request.contextPath}/image/Article/${o.avatar}" class="img-fluid w-100" />
                                        <a href="${pageContext.request.contextPath}/Detail?article_id=${o.article_id}">
                                            <div class="mask" style="background-color: rgba(251, 251, 251, 0.15);"></div>
                                        </a>
                                    </div>

                                    <!-- Article data -->
                                    <div class="row mb-3">
                                        <div class="col-6">

                                            <a href="${pageContext.request.contextPath}/Detail?article_id=${o.article_id}" class="text-info">

                                                <span class="badge badge-pill badge-primary">${o.categoryName}</span>
                                            </a>
                                        </div>

                                        <div class="col-6 text-end">
                                            <p><i class="bi bi-calendar mr-2"></i>${o.publish_date}</p>
                                        </div>
                                    </div>

                                    <!-- Article title and description -->
                                    <a href="${pageContext.request.contextPath}/Detail?article_id=${o.article_id}" class="text-dark">
                                        <p class="mt-0 mb-1  text-uppercase font-weight-bold h5">${o.title}</p>
                                    </a>
                                    <p>
                                            ${o.abstracts}
                                    </p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <hr>
                    <!--  -->
                    <div class="list3row row mt-3">
                        <ul class="list-unstyled">
                            <c:forEach items="${list}" var="o">
                                <li class="media my-4" style="height: 250px">
                                    <img src="${pageContext.request.contextPath}/image/Article/${o.avatar}" class="mr-3 img-fluid d-block w-25 h-100" alt="...">
                                    <div class="media-body">
                                        <a href="${pageContext.request.contextPath}/Detail?article_id=${o.article_id}">
                                            <h4 class="mt-0 mb-1  text-uppercase font-weight-bold" >${o.title}</h4>
                                        </a>
                                        <span class="badge badge-pill badge-primary">${o.categoryName}</span>
                                        <p> ${o.abstracts}
                                        </p>
                                        <p><i class="bi bi-calendar mr-2"></i>${o.publish_date}</p>
                                    </div>
                                </li>
                                <hr>
                            </c:forEach>
                        </ul>
                    </div>
                </section>
            </div>

            <div>
                <nav class="my-4" aria-label="...">
                    <ul class="pagination pagination-circle justify-content-center">
                        <li class="page-item">
                            <a class="page-link" href="${pageContext.request.contextPath}/Post/Pagging?cid=${listOne.categories_id}&index=${indexPre}" tabindex="-1" aria-disabled="true">Previous</a>
                        </li>
                        <c:forEach begin="1" end="${EndPage}" var="i">
                            <li class="page-item ">
                                <a  class="${tag==i?"active":" page-link "}"
                                    href="${pageContext.request.contextPath}/Post/Pagging?cid=${listOne.categories_id}&index=${i}"> ${i}
                                    <span class="sr-only">(current)</span></a>
                            </li>
                        </c:forEach>
                        <li class="page-item">
                            <a class="page-link" href="${pageContext.request.contextPath}/Post/Pagging?cid=${listOne.categories_id}&index=${indexNext}">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </jsp:body>
</d:web>
