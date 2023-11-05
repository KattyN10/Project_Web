
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<t:main>
    <!--
    Begin content
    -->
        <div class="admin-report">
            <div class="container">
                <div class="text-heading border-danger mt-5" style="font-size: 25px"><i class="bi bi-align-start"></i>
                    Thống Kê</div>
                <div class="row row-cols-4 mt-5">
                    <div class="col">
                        <div class="card text-white bg-dark mb-3 shadow-lg" style="max-width: 18rem;">
                            <div class="card-body">
                                <p class="text-white text-center"><i class="bi bi-person-badge-fill" style="font-size: 40px"></i></p>
                                <p class="text-white text-center">${allUser}</p>
                                <p class="text-white text-center">Số lượng người dùng</p>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card text-white bg-dark mb-3 shadow" style="max-width: 18rem;">
                            <div class="card-body">
                                <p class="text-white text-center"><i class="bi bi-newspaper" style="font-size: 40px"></i></p>
                                <p class="text-white text-center">${allArticle}</p>
                                <p class="text-white text-center">Số Lượng Bài Viết</p>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card text-white bg-dark mb-3 shadow" style="max-width: 18rem;">
                            <div class="card-body">
                                <p class="text-white text-center"><i class="bi bi-card-list" style="font-size: 40px"></i></p>
                                <p class="text-white text-center">${allCate}</p>
                                <p class="text-white text-center">Số Lượng Phân Mục</p>
                            </div>
                        </div>
                    </div>
                    <div class="col">
                        <div class="card text-white bg-dark mb-3 shadow" style="max-width: 18rem;">
                            <div class="card-body">
                                <p class="text-white text-center"><i class="bi bi-tags-fill" style="font-size: 40px"></i></p>
                                <p class="text-white text-center">${allTag}</p>
                                <p class="text-white text-center">Số Lượng Nhãn Dán</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr class="mt-5">
        <div class="highligth-news pb-5">
            <div class="container">
                <div class="text-heading border-danger" style="font-size: 25px"><i class="bi bi-align-start"></i>
                    Nổi bật</div>
                <div class="row row-cols-3 mt-5">
                    <c:forEach items="${listtop3}" var="o">
                    <div class="col">
                        <div class="card h-100 shadow" style="width: 20rem;">
                            <a href="${pageContext.request.contextPath}/Detail?article_id=${o.article_id}">
                                <img src="${pageContext.request.contextPath}/image/Article/${o.avatar}" class="card-img-top " alt="Avatar" style="    height: 201px;">
                                <div class="card-body">
                                    <p class="card-title"> ${o.title}. </p>
                                    <p><i class="bi bi-hash mr-2"></i>${o.categoryName}</p>
                                    <p><i class="bi bi-calendar mr-2"></i>${o.publish_date}</p>
                                </div>
                            </a>
                        </div>
                    </div>
                    </c:forEach>
                </div>

                <!--.Carousel-->

            </div>
        </div>
        <hr class="mt-5">
        <div class="top-news mt-5">
            <div class="container">
                <div class="text-heading border-danger" style="font-size: 25px"><i class="bi bi-align-start"></i>
                    Xem nhiều</div>
                <div class="row blog mt-5">
                    <div class="col-md-12">
                        <div id="blogCarousel" class="carousel slide" data-ride="carousel">

                            <ol class="carousel-indicators">
                                <li data-target="#blogCarousel" data-slide-to="0" class="active"></li>
                                <li data-target="#blogCarousel" data-slide-to="1"></li>
                            </ol>

                            <!-- Carousel items -->
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <div class="row row-cols-5">
                                        <c:forEach items="${listtop}" var="o">
                                        <div class="col">
                                            <div class="card h-100 shadow" style="width: 13rem;">
                                                <a href="${pageContext.request.contextPath}/Detail?article_id=${o.article_id}">
                                                    <img src="${pageContext.request.contextPath}/image/Article/${o.avatar}" style=" height: 164px !important" class="card-img-top" alt="...">
                                                    <div class="card-body">
                                                        <p class="card-title">${o.title} </p>
                                                        <p><i class="bi bi-hash mr-2"></i>${o.categoryName}</p>
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
                                                        <img src="${pageContext.request.contextPath}/image/Article/${o.avatar}" style=" height: 164px !important" class="card-img-top" alt="...">
                                                        <div class="card-body">
                                                            <p class="card-title">${o.title} </p>
                                                            <p><i class="bi bi-hash mr-2"></i>${o.categoryName}</p>
                                                            <p><i class="bi bi-calendar mr-2"></i> ${o.publish_date} </p>
                                                        </div>
                                                    </a>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    <!--.row-->
                                </div>
                                <!--.item-->
                            </div>
                            <!--.carousel-inner-->
                            <button class="carousel-control-prev" type="button" data-target="#blogCarousel" data-slide="prev">
                                <span class="" style="margin-right: 200px; color: black ;" aria-hidden="true"><i class="bi bi-arrow-left-square"></i></span>
                            </button>
                            <button class="carousel-control-next" type="button" data-target="#blogCarousel" data-slide="next">
                                <span class="" style="margin-left: 200px ;color: black" aria-hidden="true"><i class="bi bi-arrow-right-square"></i></span>
                            </button>

                        </div>
                        <!--.Carousel-->

                    </div>
                </div>
            </div>
        </div>
        <hr>
        <div class="new-news pb-5">
            <div class="container">
                <div class="text-heading border-danger" style="font-size: 25px"><i class="bi bi-align-start"></i>
                    Mới Nhất</div>
                <div class="row blog mt-5">
                    <div class="col-md-12">
                        <div id="blogNew" class="carousel slide" data-ride="carousel">

                            <ol class="carousel-indicators">
                                <li data-target="#blogNew" data-slide-to="0" class="active"></li>
                                <li data-target="#blogNew" data-slide-to="1"></li>
                            </ol>

                            <!-- Carousel items -->
                            <div class="carousel-inner">

                                <div class="carousel-item active">
                                    <div class="row row-cols-5">
                                        <c:forEach items="${listtop5NewinWeek}" var="o">
                                            <div class="col">
                                                <div class="card h-100 shadow" style="width: 13rem;">
                                                    <a href="${pageContext.request.contextPath}/Detail?article_id=${o.article_id}">
                                                        <img src="${pageContext.request.contextPath}/image/Article/${o.avatar}" style=" height: 164px !important" class="card-img-top" alt="...">
                                                        <div class="card-body">
                                                            <p class="card-title">${o.title} </p>
                                                            <p><i class="bi bi-hash mr-2"></i>${o.categoryName}</p>
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
                                        <c:forEach items="${listtop5NewinWeekNext}" var="o">
                                            <div class="col">
                                                <div class="card h-100 shadow" style="width: 13rem;">
                                                    <a href="${pageContext.request.contextPath}/Detail?article_id=${o.article_id}">
                                                        <img src="${pageContext.request.contextPath}/image/Article/${o.avatar}" style=" height: 164px !important" class="card-img-top" alt="...">
                                                        <div class="card-body">
                                                            <p class="card-title">${o.title} </p>
                                                            <p><i class="bi bi-hash mr-2"></i>${o.categoryName}</p>
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
                            <button class="carousel-control-prev" type="button" data-target="#blogNew" data-slide="prev">
                                <span class="" style="margin-right: 200px; color: black ;" aria-hidden="true"><i class="bi bi-arrow-left-square"></i></span>
                            </button>
                            <button class="carousel-control-next" type="button" data-target="#blogNew" data-slide="next">
                                <span class="" style="margin-left: 200px ;color: black" aria-hidden="true"><i class="bi bi-arrow-right-square"></i></span>
                            </button>

                        </div>
                        <!--.Carousel-->

                    </div>
                </div>
            </div>
        </div>
        <hr class="mt-5">
        <div class="category-news mb-5">

            <div class="container">
                <div class="text-heading border-danger" style="font-size: 25px"><i class="bi bi-align-start"></i>
                    Danh Mục</div>
                <div class="row blog mt-5">
                    <div class="col">
                        <div id="blogCate" class="carousel slide" data-ride="carousel">

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
                                <!--.item-->

                                <div class="carousel-item">
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
                                <!--.item-->
                            </div>
                            <!--.carousel-inner-->
                            <button class="carousel-control-prev" type="button" data-target="#blogCate" data-slide="prev">
                                <span class="" style="margin-right: 180px; color: black ;" aria-hidden="true"><i class="bi bi-arrow-left-square"></i></span>
                            </button>
                            <button class="carousel-control-next" type="button" data-target="#blogCate" data-slide="next">
                                <span class="" style="margin-left: 210px ;color: black" aria-hidden="true"><i class="bi bi-arrow-right-square"></i></span>
                            </button>
                        </div>
                        <!--.Carousel-->

                    </div>
                </div>
            </div>

        </div>
        </div>
<!--
End content
-->
</t:main>