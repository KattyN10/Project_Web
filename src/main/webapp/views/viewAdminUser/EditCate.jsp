
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<t:main>
    <jsp:body>
        <div class="content-cate mt-5">
            <div class="container">
                <div class="card">
                    <div class="card-header d-flex justify-content-md-between">
                        <span class="text-title">Users - Editor</span>

                    </div>
                    <div class="body">
                        <table class="table">
                            <thead class="thead-dark">
                            <tr class="text-center">
                                <th scope="col">ID</th>
                                <th scope="col">Name</th>
                                <th scope="col">Name Writer</th>

                                <th scope="col">Role</th>
                                <th scope="col">Birthday</th>
                                <th scope="col">Email</th>

                                <th scope="col">Action</th>
                            </tr>
                            </thead>
                            <tbody class="text-center">
                            <c:forEach items="${list}" var="k">
                                <tr>
                                    <th scope="row">${k.userId}</th>

                                    <td>${k.name}</td>
                                    <td>${k.second_name}</td>

                                    <c:if test="${k.role_id==1}">
                                        <td>Admin</td>
                                    </c:if>
                                    <c:if test="${k.role_id==2}">
                                        <td>User</td>
                                    </c:if>
                                    <c:if test="${k.role_id==3}">
                                        <td>Phóng viên</td>
                                    </c:if>
                                    <c:if test="${k.role_id==4}">
                                        <td>Biên tập viên</td>
                                    </c:if>
                                    <td>${k.dateOfBirth}</td>
                                    <td>${k.email}</td>
                                    <td class="" style="font-size: 20px">
                                        <a href="${pageContext.request.contextPath}/Admin/User/EditCate/Edit?id=${k.userId}" type="button" class="btn link"><i class="bi bi-pencil-square"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer d-flex justify-content-md-between">
                        <span class="text-title">Footer</span>
                    </div>
                </div>
            </div>
        </div>

    </jsp:body>
</t:main>
