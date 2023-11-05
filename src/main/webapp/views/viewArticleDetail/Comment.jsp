<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="art" scope="request" type="com.example.edit.beans.Articles"/>
<t:detail>
    <jsp:body>
        <br><br><br><br>
        <div class="container-fluid">
            <div class="container">
                <div class="row">
                    <c:if test="${sessionScope.auth == false}">
                        <div class="col-lg-8">
                            <!-- News Detail Start -->
                            <div class="position-relative mb-3">
                                <p>Xin vui lòng <a href="${pageContext.request.contextPath}/User/Register">đăng ký</a>
                                    hoặc <a href="${pageContext.request.contextPath}/User/Index">đăng nhập</a> để bình luận.</p>
                            </div>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.auth == true}">
                        <div class="col-lg-8">
                            <!-- Comment Form Start -->
                            <div class="mb-3">
                                <div class="section-title mb-0">
                                    <h4 class="m-0 text-uppercase font-weight-bold">Post a comment</h4>
                                </div>
                                <div class="bg-white border border-top-0 p-4">
                                    <form method="post">
                                        <div class="form-row">
                                            <label for="article_id">ID</label>
                                            <input type="text" class="form-control" id="article_id" name="article_id" value="${art.article_id}" readonly>
                                        </div>
                                        <div class="form-row">
                                            <label for="title">Title</label>
                                            <textarea id="title" class="form-control" rows="2"  name="title"  readonly>${art.title}</textarea>
                                        </div>
                                        <div class="form-row">
                                            <label for="email">Email *</label>
                                            <input type="email" class="form-control" id="email" name="email" value="${authUser.email}" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label for="comment">Comment *</label>
                                            <textarea id="comment" name="comment" cols="30" rows="5" class="form-control"></textarea>
                                        </div>
                                        <div class="form-group mb-0">
                                            <a href="${pageContext.request.contextPath}/Detail?article_id=${art.article_id}" class="btn btn-success font-weight-semi-bold py-2 px-3" >Back</a>
                                            <input type="submit" value="Post"
                                                   class="btn btn-primary font-weight-semi-bold py-2 px-3">
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- Comment Form End -->
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </jsp:body>
</t:detail>
