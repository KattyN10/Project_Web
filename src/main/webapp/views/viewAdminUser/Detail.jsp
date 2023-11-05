
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="Users" scope="request" type="com.example.edit.beans.User"/>

<t:main>

    <jsp:body>
        <div class="container mt-5">
            <div class="content-news mt-5">
                <div class="container">
                    <div class="card w-100 h-100 shadow">
                        <div class="card-header d-flex justify-content-md-between">
                            <span class="text-title">User Detail</span>
                        </div>
                        <div class="body">
                            <table class="table">
                                <thead class="thead-dark">
                                <tr>
                                    <th scope="col">Attribute</th>
                                    <th scope="col">Content</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th>ID:</th>
                                    <td>${Users.userId}</td>
                                </tr>
                                <tr>
                                    <th>Username:</th>
                                    <td>${Users.username}</td>
                                </tr>
                                <tr>
                                    <th>Password:</th>
                                    <td>${Users.password}</td>
                                </tr>
                                <tr>
                                    <th>Name:</th>
                                    <td>${Users.name}</td>
                                </tr>
                                <tr>
                                    <th>Name Writer:</th>
                                    <td>${Users.second_name}</td>
                                </tr>
                                <tr>
                                    <th>Issue Day:</th>
                                    <td>${Users.issueAt}</td>
                                </tr>
                                <tr>
                                    <th>Birthday:</th>
                                    <td>${Users.dateOfBirth}</td>
                                </tr>
                                <tr>
                                    <th>Role:</th>
                                    <c:if test="${Users.role_id == 1}">
                                        <td>Admin</td>
                                    </c:if>
                                    <c:if test="${Users.role_id == 2}">
                                        <td>User</td>
                                    </c:if>
                                    <c:if test="${Users.role_id == 3}">
                                        <td>Phóng viên</td>
                                    </c:if>
                                    <c:if test="${Users.role_id == 4}">
                                        <td>Biên tập viên</td>
                                    </c:if>
                                </tr>
                                <tr>
                                    <th>Email:</th>
                                    <td>${Users.email}</td>
                                </tr>
                                <tr>
                                    <th>Premium:</th>
                                    <td>${Users.premium}</td>
                                </tr>
                                <tr>
                                    <th>OTP:</th>
                                    <td>${Users.otp}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="card-footer d-flex justify-content-md-between">
                            <span class="text-title">Footer</span>
                            <a href="${pageContext.request.contextPath}/Admin/User/Index" class="btn btn-light btn-lg mr-4">Back</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>

</t:main>