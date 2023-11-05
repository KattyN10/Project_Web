<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:useBean id="article" scope="request" type="com.example.edit.beans.Articles"/>
<jsp:useBean id="comments" scope="request" type="java.util.List<com.example.edit.beans.Comments>" />

<t:detail>
    <jsp:attribute name="css">
        <style>
            .contentnews img{
                width: 100%;
                height: 300px;
            }
            .listrand5 a{
                text-decoration: none;
            }
        </style>
    </jsp:attribute>
    <jsp:attribute name="js">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js" integrity="sha512-YcsIPGdhPK4P/uRW6/sruonlYj+Q7UHWeKfTAkBW+g83NKM+jMJFJ4iAPfSnVp7BKD4dKMHmVSvICUbE/V1sSw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        const options ={
            margin: 2,
            fileName: "file.pdf",
            image:{
                type: "jpeg",
                quality: 0.98
            },
            html2canvas:{
                scale:1
            },
        }
        $("#download").click(function (e){
            e.preventDefault();
            const element = document.getElementById("contents");
            html2pdf().from(element).set(options).save();
        })
    </script>
    </jsp:attribute>
    <jsp:body>
        <div class="container-fluid" style="margin-top: 100px">
            <div class="container mt-5">
                <div class="row row-cols-2">
                    <c:if test="${ (checkPre == false && checkAccPre == false  && checkEx== false) || (checkPre == false && checkAccPre == false  && checkEx== true)
                    || (checkPre == false && sessionScope.auth == false ) || (checkPre == false && checkEx== true  && checkAccPre == true )
                    || (checkPre == true && checkEx== true  && checkAccPre == true)
                     || (checkPre == false && checkEx== false  && checkAccPre == true )}">
                        <div class="col-8">
                            <!-- News Detail Start -->
                            <div class="position-relative mb-3" id="contents">
                                <img class="img-fluid w-100" style="height: 600px" src="${pageContext.request.contextPath}/image/Article/${article.avatar}">
                                <div class="bg-white border border-top-0 p-4">
                                    <div class="mb-3">
                                        <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2" href="">${article.categoryName}</a>
                                        <a class="text-body" href="">${article.publish_date}</a>
                                    </div>
                                    <h1 class="mb-3 text-secondary text-uppercase font-weight-bold">${article.title}</h1>
                                    <div class="contentnews">${article.content}</div>
                                </div>
                                <div class="d-flex justify-content-between bg-white border border-top-0 p-4">
                                    <div class="d-flex align-items-center">
                                        <img class="rounded-circle mr-2" src="${pageContext.request.contextPath}/image/user.png" width="25" height="25" alt="">
                                        <span>${user.second_name}</span>
                                    </div>
                                    <div class="d-flex align-items-center">
                                           <span class="ml-3">
                                               <i class="far fa-eye mr-2"></i>
                                               <fmt:formatNumber value="${article.views}" type="number"></fmt:formatNumber>
                                           </span>
                                    </div>
                                </div>
                            </div>
                            <!-- News Detail End -->
                            <c:if test="${checkPre == true && sessionScope.auth == true &&  checkEx== true}">
                                <button type="button" style="margin-bottom: 13px;
    margin-left: 635px;
}" class="btn btn-secondary" id="download">Download</button>
                            </c:if>
                            <!-- Comment List Start -->
                            <div class="mb-3">
                                <div class="section-title mb-0">
                                    <h4 class="m-0 text-uppercase font-weight-bold"> Comments</h4>
                                </div>
                                <div class="bg-white border border-top-0 p-4">
                                    <c:forEach items="${comments}" var="c">
                                        <div class="media mb-4">
                                            <img class="rounded-circle mr-2" src="${pageContext.request.contextPath}/image/user.png" width="25" height="25" alt="">
                                            <div class="media-body">
                                                <h6><a class="text-secondary font-weight-bold" href="#">${c.second_name}</a> <small><i>${c.create_date}</i></small></h6>
                                                <p>${c.comment}</p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <!-- Comment List End -->

                            <!-- Comment Form Start -->
                            <div class="mb-3">
                                <div class="section-title mb-0">
                                    <a href="${pageContext.request.contextPath}/Detail/Comment?article_id=${article.article_id}"
                                       class="btn btn-primary font-weight-semi-bold py-2 px-3">Post a comment</a>
                                </div>
                            </div>
                            <!-- Comment Form End -->
                        </div>
                        <div class="col-lg-4">

                            <!-- 5 Related Articles -->
                            <div class="listrand5 mb-3">
                                <div class="section-title mb-0">
                                    <h4 class="m-0 text-uppercase font-weight-bold">Related Articles</h4>
                                </div>
                                <c:forEach items="${listRand5SameCat}" var="r">
                                    <div class="bg-white border border-top-0 p-3">
                                        <div class="d-flex align-items-center bg-white mb-3" style="height: 150px; width: 320px">
                                            <img class="img-fluid h-100 w-50" src="${pageContext.request.contextPath}/image/Article/${r.avatar}" alt="">
                                            <div class="h-100 w-50 d-flex flex-column justify-content-center border">
                                                <div class="mb-1" style="font-size: 12px">
                                                    <a class="badge badge-primary text-uppercase font-weight-semi-bold p-1 mr-2" href="${pageContext.request.contextPath}/Post/Category?cid=${r.categories_id}">${r.categoryName}</a>
                                                    <a class="text-body"><small>${r.publish_date}</small></a>
                                                </div>
                                                <a class=" m-0 text-secondary text-uppercase font-weight-bold" style="font-size: 13px"
                                                   href="${pageContext.request.contextPath}/Detail?article_id=${r.article_id}">${r.title}</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <!-- 5 Related Articles -->

                            <!-- Tags Start -->
                            <div class="mb-3">
                                <div class="section-title mb-0">
                                    <h4 class="m-0 text-uppercase font-weight-bold">Tags</h4>
                                </div>
                                <c:forEach items="${tags}" var="t">
                                    <div class="bg-white border border-top-0 p-3">
                                        <div class="d-flex flex-wrap m-n1">
                                            <a href="${pageContext.request.contextPath}/Post/Tag?tid=${t.tags_id}" class="btn btn-sm btn-outline-secondary m-1">${t.value}</a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <!-- Tags End -->
                        </div>
                    </c:if>
                    <c:if test="${checkPre == true && checkEx== false && checkAccPre == true && sessionScope.auth == true}">
                        <div class="col-lg-8">
                            <!-- News Detail Start -->
                            <div class="position-relative mb-3">
                                <img src="https://i0.wp.com/www.einsurance.com/wp-content/uploads/do-life-insurane-benefits-expire.jpg?resize=1378%2C1378&ssl=1" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">
                                <p>Xin vui lòng gia hạn tài khoản</p>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${checkPre == true && sessionScope.auth == false}">
                        <div class="col-lg-8">
                            <!-- News Detail Start -->
                            <div class="position-relative mb-3">
                                <img src="https://tse2.mm.bing.net/th?id=OIP.usAcnyD4C2JZwdZ_gksHmgHaEv&pid=Api&P=0" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">
                                <p>Xin vui lòng đăng nhập tài khoản VIP</p>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${checkPre == true && sessionScope.auth == true &&  checkAccPre== false}">
                        <div class="col-lg-8">
                            <!-- News Detail Start -->
                            <div class="position-relative mb-3">
                                <img src="https://tse2.mm.bing.net/th?id=OIP.usAcnyD4C2JZwdZ_gksHmgHaEv&pid=Api&P=0" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">
                                <p>Xin vui lòng nâng cấp tài khoản VIP</p>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
        <!-- News With Sidebar End -->
    </jsp:body>
</t:detail>
