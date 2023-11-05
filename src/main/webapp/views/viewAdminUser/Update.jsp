
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="Users" type="com.example.edit.beans.User" scope="request"/>

<t:main>
     <jsp:attribute name="css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  </jsp:attribute>
    <jsp:attribute name="js">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js" integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>
        $('#txtBirthday').datetimepicker({
            format: 'd/m/Y',
            timepicker: false,
            mask: true
        });
        $('#txtIssuedat').datetimepicker({
            format: 'd/m/Y',
            timepicker: false,
            mask: true
        });
    </script>
  </jsp:attribute>

    <jsp:body>
        <div class="content-cate mt-5">
            <form action="" id="#frmAdd" method="post">
                <div class="container">
                    <div class="card">
                        <div class="card-header d-flex justify-content-md-between">
                            <span class="text-title">Update Users</span>
                        </div>
                        <div class="card-body ml-5">
                            <div class="form-group">
                                <label for="txtName">Username</label>
                                <input type="text" class="form-control w-75" id="txtUserName" name="username" value="${Users.username}">
                            </div>
                            <div class="form-group">
                                <label >Password</label>
                                <input type="password" class="form-control w-75" id="txtPass" name="password" value="${Users.password}">
                            </div>
                            <div class="form-group">
                                <label >Name</label>
                                <input type="text" class="form-control w-75" id="txtName" name="name" value="${Users.name}">
                            </div>
                            <div class="form-group">
                                <label >Writer Name</label>
                                <input type="text" class="form-control w-75" id="txtSeondName" name="secondname" value="${Users.second_name}">
                            </div>
                            <div class="form-group">
                                <label>Issue Day</label>
                                <input type="text" class="form-control w-75" id="txtIssuedat" name="issue_at"  value="${Users.issueAt}">
                            </div>
                            <div class="form-group">
                                <label >Birthday</label>
                                <input type="text" class="form-control w-75" id="txtBirthday" name="birthday" value="${Users.dateOfBirth}">
                            </div>
                            <div class="form-group">
                                <label >Role</label>
                                <select class="form-control w-75" id="role" name="role_id">
                                    <option value="1">Admin</option>
                                    <option value="2">User</option>
                                    <option value="3">Phóng viên</option>
                                    <option value="4">Biên tập viên</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="txtName">Email</label>
                                <input type="text" class="form-control w-75" id="txtEmail" name="email" value="${Users.email}">
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" name="premium" value="${Users.premium}" id="defaultCheck1">
                                <label class="form-check-label" for="defaultCheck1">
                                    Premium
                                </label>
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="row float-right mr-5">
                                <a href="${pageContext.request.contextPath}/Admin/User/Index" class="btn btn-light btn-lg mr-4">Back</a>
                                <button type="submit" class="btn btn-success btn-lg">Update</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </jsp:body>

</t:main>
