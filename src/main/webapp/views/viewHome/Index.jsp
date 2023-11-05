<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="d" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="tags" scope="request" type="java.util.List<com.example.edit.beans.Tag>"/>


<d:web>
    <jsp:attribute name="css">
        <style>
            .noibat:hover .title-top4 {
                text-decoration: none;
                cursor: pointer;
                text-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
                transform: translate(0);
            }
            .noibat:hover img {
                opacity: 0.8;
            }
        </style>
    </jsp:attribute>
    <jsp:body>
        <div class="content">
            <div class="tag mb-3">
                <div class="navbar-expand-lg">
                    <div class="container-sm d-flex justify-content-sm-between">
                        <a class="navbar-brand mb-0 h1 mt-1" href="#"><i class="bi bi-backspace-reverse-fill" style="color: #3f3f3f"></i></a>
                        <div class="collapse navbar-collapse">
                            <ul class="navbar-nav mr-auto">
                                <c:forEach items="${tags}" var="o">
                                    <li class="nav-item active">
                                        <a href="${pageContext.request.contextPath}/Post/Tag?tid=${o.tags_id}" class=" link-cate mr-3" style="font-size: 10px; color: black;">${o.value}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="weather-item text-heading border-danger">TP.HCM - ${Day}</div>
                    </div>
                </div>
            </div>
            <div class="news-highlight">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-8">
                            <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
                                    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
                                    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>\
                                </ol>
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <div class="box" style="height:  600px">
                                            <div class="overlay-img h-100"> <img src="${pageContext.request.contextPath}/image/Article/${find1.avatar}" class="img-fluid h-100 w-100" alt="..."></div>
                                            <div class="carousel-caption d-none d-md-block text-img text-left">
                                                <a href="${pageContext.request.contextPath}/Post/Category?cid=${find1.categories_id}" class="link-cate nav-link"> ${find1.categoryName} </a>
                                                <p> ${find1.title}.</p>
                                                <h5>${find1.publish_date}</h5>
                                                <button class="btn btn-sm btn-outline-light" onclick="location.href='${pageContext.request.contextPath}/Detail?article_id=${find1.article_id}';">Xem Thêm</button>
                                            </div>
                                        </div>
                                    </div>
                                    <c:forEach items="${listtop3}" var="o">
                                        <div class="carousel-item">
                                            <div class="box" style="height:  600px">
                                                <div class="overlay-img h-100"> <img src="${pageContext.request.contextPath}/image/Article/${o.avatar}" class="img-fluid h-100" alt="..."></div>
                                                <div class="carousel-caption d-none d-md-block text-img text-left">
                                                    <a href="${pageContext.request.contextPath}/Post/Category?cid=${o.categories_id}" class="link-cate nav-link"> ${o.categoryName} </a>
                                                    <p> ${o.title}.</p>
                                                    <h5>${o.publish_date}</h5>
                                                    <button class="btn btn-sm btn-outline-light" onclick="location.href='${pageContext.request.contextPath}/Detail?article_id=${o.article_id}';">Xem Thêm</button>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>

                                </div>
                                <button class="carousel-control-prev" type="button" data-target="#carouselExampleCaptions" data-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Previous</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-target="#carouselExampleCaptions" data-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="sr-only">Next</span>
                                </button>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card h-100">
                                <div class="h4 text-heading border-danger">
                                    Nổi Bật
                                </div>
                                <ul class="list-unstyled">
                                    <c:forEach items="${listtop4}" var="r">
                                        <div class="bg-white ml-2 noibat">
                                            <div class="d-flex align-items-center bg-white mb-3" style="height: 150px; width: 320px">
                                                <img class="img-fluid h-100 w-50" src="${pageContext.request.contextPath}/image/Article/${r.avatar}" alt="">
                                                <div class="h-100 w-50 d-flex flex-column justify-content-center border">
                                                    <div class="mb-2 ml-1" style="font-size: 13px">
                                                        <a class="badge badge-primary text-uppercase font-weight-semi-bold p-1 mr-2" href="${pageContext.request.contextPath}/Post/Category?cid=${r.categories_id}">${r.categoryName}</a>
                                                        <a class="text-body"><small>${r.publish_date}</small></a>
                                                    </div>
                                                    <div class="title-top4 ml-1">
                                                        <a class=" h6  text-uppercase font-weight-bold" style="text-decoration: none; color: black;font-size: 13px"
                                                           href="${pageContext.request.contextPath}/Detail?article_id=${r.article_id}">${r.title}</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <div class="top-news">
                <div class="container">
                    <div class="text-heading border-danger" style="font-size: 25px"><i class="bi bi-align-start"></i>
                        Xem nhiều</div>
                    <div class="row blog mt-5">
                        <div class="col-md-12">
                            <div id="blogCarousel" class="carousel slide" data-ride="carousel">

                                <!-- Carousel items -->
                                <div class="carousel-inner">

                                    <div class="carousel-item active">

                                        <div class="row row-cols-5">
                                            <c:forEach items="${listtop}" var="o">
                                                <div class="col">
                                                    <div class="card h-100 shadow" style="width: 13rem;">
                                                        <a href="${pageContext.request.contextPath}/Detail?article_id=${o.article_id}">
                                                            <img src="${pageContext.request.contextPath}/image/Article/${o.avatar}" style="height: 164px !important" class="card-img-top h-50" alt="...">
                                                            <div class="card-body">
                                                                <p class="card-title h6 m-0 text-uppercase font-weight-bold">${o.title}</p>
                                                                <p class="badge badge-primary badge-pill mt-2"></i>${o.categoryName}</p>
                                                                <p><i class="bi bi-calendar mr-2"></i> ${o.publish_date} </p>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>

                                        <!--.row-->
                                    </div>


                                    <!--.item-->

                                    <div class="carousel-item ">
                                        <div class="row row-cols-5">
                                            <c:forEach items="${listtopnext}" var="o">
                                                <div class="col">
                                                    <div class="card h-100 shadow" style="width: 13rem;">
                                                        <a href="${pageContext.request.contextPath}/Detail?article_id=${o.article_id}">
                                                            <img src="${pageContext.request.contextPath}/image/Article/${o.avatar}" style="height: 164px !important" class="card-img-top h-50" alt="...">
                                                            <div class="card-body">
                                                                <p class="card-title h6 m-0  text-uppercase font-weight-bold">${o.title}</p>
                                                                <p class="badge badge-primary badge-pill mt-2" >${o.categoryName}</p>
                                                                <p><i class="bi bi-calendar mr-2"></i> ${o.publish_date} </p>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>



                                        <!--.row-->
                                    </div>
                                    <!--.item-->
                                </div>
                                <!--.carousel-inner-->
                                <button class="carousel-control-prev" type="button" data-target="#blogCarousel" data-slide="prev">
                                    <span  style="margin-right: 250px; color: black ;" aria-hidden="true"><i class="bi bi-arrow-left-square"></i></span>
                                </button>
                                <button class="carousel-control-next" type="button" data-target="#blogCarousel" data-slide="next">
                                    <span  style="margin-left: 250px ;color: black" aria-hidden="true"><i class="bi bi-arrow-right-square"></i></span>
                                </button>

                            </div>
                            <!--.Carousel-->

                        </div>
                    </div>
                </div>
            </div>
            <hr class="mt-5">
            <div class="new-news">
                <div class="container">
                    <div class="text-heading border-danger" style="font-size: 25px"><i class="bi bi-align-start"></i>
                        Mới Nhất </div>
                    <div class="row mt-5">
                        <div class="col-6">
                            <div class="box-new" style="height: 500px">
                                <a href="${pageContext.request.contextPath}/Detail?article_id=${find1New.article_id}">
                                    <img src="${pageContext.request.contextPath}/image/Article/${find1New.avatar}" class="card-img-top h-75" alt="...">
                                </a>
                                <div class="box-new-menu">
                                    <a href="${pageContext.request.contextPath}/Detail?article_id=${find1New.article_id}">
                                        <p class="h4 mt-1 text-uppercase font-weight-bold title"> ${find1New.title} </p>
                                    </a>
                                    <p style="font-size: 15px"> ${find1New.abstracts}  </p>
                                    <div class="d-flex justify-content-between">
                                        <p class="badge badge-primary badge-pill">${find1New.categoryName} </p>
                                        <p><i class="bi bi-calendar mr-2"></i> ${find1New.publish_date} </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="row row-cols-1 row-cols-md-2">
                                <c:forEach items="${listtop5New}" var="o">
                                    <div class="col mb-4" style="height: 300px">
                                        <div class="box-new" style="height: 250px">
                                            <a href="${pageContext.request.contextPath}/Detail?article_id=${o.article_id}">
                                                <img src="${pageContext.request.contextPath}/image/Article/${o.avatar}" class="card-img-top h-75" alt="...">
                                            </a>
                                            <div class="box-new-content-sm">
                                                <a href="${pageContext.request.contextPath}/Detail?article_id=${o.article_id}">
                                                    <span class="h6 m-0  text-uppercase font-weight-bold" style="font-size: 15px"> ${o.title} </span>
                                                </a>
                                                <div class="d-flex justify-content-between">
                                                    <span class="badge badge-primary badge-pill">  ${o.categoryName} </span>
                                                    <span><i class="bi bi-calendar mr-2"></i> ${o.publish_date} </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                    </div>
                    <hr>
                    <div class="row mt-5">
                        <ul class="list-unstyled">
                            <c:forEach items="${listtop5NewNext}" var="o">
                                <li class="media my-4" style="height: 200px">
                                    <img src="${pageContext.request.contextPath}/image/Article/${o.avatar}" class="mr-3 img-fluid d-block w-25 h-100" alt="...">
                                    <div class="media-body">
                                        <a href="${pageContext.request.contextPath}/Detail?article_id=${o.article_id}">
                                            <h4 class="mt-0 mb-1  text-uppercase font-weight-bold">${o.title}</h4>
                                        </a>
                                        <p> ${o.abstracts} </p>
                                        <p class="badge badge-primary badge-pill"> </i>${o.categoryName}</p>
                                        <p><i class="bi bi-calendar mr-2"></i> ${o.publish_date} </p>
                                    </div>
                                </li>
                                <hr>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <hr class="mt-5">
            <div class="category-news">

                <div class="container">
                    <div class="text-heading border-danger" style="font-size: 25px"><i class="bi bi-align-start"></i>
                        Danh Mục</div>
                    <div class="row blog mt-5">
                        <div class="col">
                            <div id="blogCate" class="carousel slide" data-ride="carousel">

                                <ol class="carousel-indicators">
                                    <li data-target="#blogCate" data-slide-to="0" class="active"></li>
                                    <li data-target="#blogCate" data-slide-to="1"></li>
                                </ol>

                                <!-- Carousel items -->
                                <div class="carousel-inner d-flex ml-3">

                                    <div class="carousel-item active">
                                        <div class="row row-cols-5">
                                            <c:forEach items="${list10Cate}" var="k">
                                                <div class="col">
                                                    <div class="card h-100 shadow" style="width: 13rem;">
                                                        <div class="box-cate" style="height: 350px">
                                                            <a href="${pageContext.request.contextPath}/Detail?article_id=${k.article_id}">
                                                                <img src="${pageContext.request.contextPath}/image/Article/${k.avatar}" alt="" class="d-block img-fluid h-100">
                                                                <div class="box-cate-content carousel-caption d-none d-md-block text-img">
                                                                    <span href="${pageContext.request.contextPath}/Post/Category?cid=${k.categories_id}" class="link-cate">${k.categoryName}</span>
                                                                </div>
                                                                <div class="overlay-content">
                                                                    <h5 class="title"  style="font-size: 15px">${k.title}</h5>
                                                                    <p class="description">${k.publish_date}</p>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>

                                        </div>
                                        <!--.row-->
                                    </div>
                                    <div class="carousel-item ">
                                        <div class="row row-cols-5">
                                            <c:forEach items="${list10CateNext}" var="k">
                                                <div class="col">
                                                    <div class="card h-100 shadow" style="width: 13rem;">
                                                        <div class="box-cate" style="height: 350px">
                                                            <a href="${pageContext.request.contextPath}/Detail?article_id=${k.article_id}">
                                                                <img src="${pageContext.request.contextPath}/image/Article/${k.avatar}" alt="" class="d-block img-fluid h-100">
                                                                <div class="box-cate-content carousel-caption d-none d-md-block text-img">
                                                                    <span href="${pageContext.request.contextPath}/Post/Category?cid=${k.categories_id}" class="link-cate">${k.categoryName}</span>
                                                                </div>
                                                                <div class="overlay-content">
                                                                    <h5 class="title" style="font-size: 15px">${k.title}</h5>
                                                                    <p class="description">${k.publish_date}</p>
                                                                </div>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>

                                        </div>
                                        <!--.row-->
                                    </div>
                                </div>
                                <!--.carousel-inner-->
                                <button class="carousel-control-prev" type="button" data-target="#blogCate" data-slide="prev">
                                    <span class="" style="margin-right: 180px; color: black ;" aria-hidden="true"><i class="bi bi-arrow-left-square"></i></span>
                                </button>
                                <button class="carousel-control-next" type="button" data-target="#blogCate" data-slide="next">
                                    <span class="" style="margin-left: 250px ;color: black" aria-hidden="true"><i class="bi bi-arrow-right-square"></i></span>
                                </button>
                            </div>
                            <!--.Carousel-->

                        </div>
                    </div>
                </div>

            </div>
        </div>
    </jsp:body>
</d:web>