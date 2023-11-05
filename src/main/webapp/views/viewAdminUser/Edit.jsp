
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
                            <span class="text-title">Danh mục quản lí</span>
                        </div>
                            <div class="card-body">
                                <ul class="list-group list-group-flush">
                                    <c:forEach items="${listCateById}" var="a">
                                        <li class="list-group-item">
                                            <div class="d-flex justify-content-between">
                                                <span>${a.name}</span>
                                                <a href="${pageContext.request.contextPath}/Admin/User/EditCate/Edit/Delete?id_editmana=${a.id}&id=${a.editor_id}" role="button" class="link"><i class="bi bi-trash"></i></a>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        <div class="card-body ml-5">

                            <div class="form-group">
                                <label for="exampleFormControlSelect1">Categories</label>
                                <select class="form-control w-75" id="exampleFormControlSelect1" name="cate_id">
                                    <c:forEach items="${listCate}" var="k">
                                        <option value="${k.categories_id}">${k.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="row float-right mr-5">
                                <a href="${pageContext.request.contextPath}/Admin/User/EditCate" class="btn btn-light btn-lg mr-4">Back</a>
                                <button type="submit" class="btn btn-success btn-lg">Add</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </jsp:body>

</t:main>
