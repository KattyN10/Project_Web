<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="d" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="authUser" scope="session" type="com.example.edit.beans.User"/>

<d:web>
    <jsp:attribute name="css">
        <style>
          .user-icon img{
            border-radius: 50%;
            width: 150px;
            margin-right: 10px;
          }
        </style>
    </jsp:attribute>
  <jsp:body>
    <div class="content">
      <div class="container">
        <!-- Background image -->
        <div class="p-5 bg-image" style="
        background: bisque;
        height: 300px;
        "></div>
        <!-- Background image -->

        <div class="card mx-4 mx-md-5 shadow" style="
        margin-top: -250px;
        background: #eee;
        backdrop-filter: blur(30px);
        ">
          <c:choose>
            <c:when test="${auth}">
              <div class="card-body py-5 px-md-5">
                <div>
                  <h1 class="fw-bold mb-5 text-heading">User Profile</h1>
                </div>
                <div class="row row-cols-2">
                  <div class="col-4 ml-3 shadow-lg" style="background: #f7f7f7">
                    <div class="row mt-5">
                      <span class="user-icon" style="margin: 0px auto">
                         <img src="${pageContext.request.contextPath}/image/user.png" class="img-fluid">
                         </span>
                    </div>
                    <div class="row mt-3">
                      <h4 class="" style="margin: 0px auto">${authUser.name}</h4>
                    </div>

                    <c:if test="${authUser.role_id == 1}">
                      <div class="row mt-2">
                        <p class="" style="margin: 0px auto">${authUser.second_name}</p>
                      </div>
                      <div class="row mt-2 mb-2">
                        <p class="" style="margin: 0px auto">Administrator</p>
                      </div>
                    </c:if>
                    <c:if test="${authUser.role_id == 2}">
                      <div class="row mt-2">
                        <p class="" style="margin: 0px auto">${authUser.second_name}</p>
                      </div>
                      <div class="row mt-2 mb-2">
                        <p class="" style="margin: 0px auto">User</p>
                      </div>
                    </c:if>
                    <c:if test="${authUser.role_id == 3}">
                      <div class="row mt-2">
                        <p class="" style="margin: 0px auto">${authUser.second_name}</p>
                      </div>
                      <div class="row mt-2 mb-2">
                        <p class="" style="margin: 0px auto">Reporter</p>
                      </div>
                    </c:if>
                    <c:if test="${authUser.role_id == 4}">
                      <div class="row mt-2">
                        <p class="" style="margin: 0px auto">${authUser.second_name}</p>
                      </div>
                      <div class="row mt-2 mb-2">
                        <p class="" style="margin: 0px auto">Editor</p>
                      </div>
                    </c:if>
                  </div>
                  <div class="col-7 ml-5" style="background: #eee">
                    <ul class="list-group list-group-flush mt-3">
                      <li class="list-group-item">
                        <div class="row mt-4">
                          <span class="col-4">Name: </span>
                          <div class="col-6">
                            <span>${authUser.name}</span>
                          </div>
                        </div>
                      </li>
                      <li class="list-group-item">
                        <div class="row mt-4">
                          <span class="col-4">Name Writer: </span>
                          <div class="col-6">
                            <span>${authUser.second_name}</span>
                          </div>
                        </div>
                      </li>
                      <li class="list-group-item">
                        <div class="row mt-4">
                          <span class="col-4">Email: </span>
                          <div class="col-6">
                            <span>${authUser.email}</span>
                          </div>
                        </div>
                      </li>
                      <li class="list-group-item">
                        <div class="row mt-4 mb-2">
                          <span class="col-4">Birthday: </span>
                          <div class="col-6">
                            <span>${authUser.dateOfBirth}</span>
                          </div>
                        </div>
                      </li>
                    </ul>
                    <div class="row mt-2 mb-2">
                      <div class="col text-right">
                        <a href="${pageContext.request.contextPath}/User/EditProfile" class="btn btn-sm btn-outline-secondary alert-link nav-link text-heading">Cật nhập thông tin</a>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="mt-5">
                  <h4 class="fw-bold text-heading">Information Account</h4>
                </div>
                <form action="${pageContext.request.contextPath}/User/EditAcc" method="post">
                <div class="row mt-1 w-100">
                  <div class="card-body">
                    <ul class="list-group list-group-flush">
                      <li class="list-group-item">
                        <div class="row">
                          <span class="col-4">User: </span>
                          <div class="col-8">
                            <input class="w-75" type="text" name="username" id="#txtUsername" placeholder="${authUser.username}">
                          </div>
                        </div>
                      </li>
                      <li class="list-group-item">
                        <div class="row">
                          <span class="col-4">Password: </span>
                          <div class="col-8">
                            <input class="w-75" type="password" name="password" id="#txtPass" placeholder="${authUser.password}">
                          </div>
                        </div>
                      </li>
                      <li class="list-group-item">
                        <div class="row">
                          <c:if test="${checkEx eq true && checkAccPre eq true}">
                            <span class="col-4">Status: </span>
                            <div class="col-6 d-flex justify-content-between">
                              <span>Vip</span>
                              <a href="${pageContext.request.contextPath}/User/Extend"><i class="bi bi-plus-circle"></i></a>
                            </div>
                          </c:if>
                          <c:if test="${checkEx eq false && checkAccPre eq true}">
                            <span class="col-4">Status: </span>
                            <div class="col-6 d-flex justify-content-between">
                              <span>Hết hạn</span>
                              <a href="${pageContext.request.contextPath}/User/Extend" class=""><i class="bi bi-plus-circle"></i></a>
                            </div>
                          </c:if>
                        </div>
                      </li>
                    
                    </ul>
                  </div>
                </div>

                <div class="row mt-2">
                  <div class="col text-right">
                   <a href="${pageContext.request.contextPath}/User/Index" class="btn btn-lg btn-success ">Back</a>
                    <button type="submit"  class="btn btn-lg btn-warning ">Thay Đổi</button>
                  </div>
                </div>
              </form>
            </c:when>
            <c:when test="${authGg}">
              <div class="card-body py-5 px-md-5">
                <div>
                  <h1 class="fw-bold mb-5 text-heading">User Profile</h1>
                </div>
                <div class="row row-cols-2">
                  <div class="col-4 ml-3 shadow-lg" style="background: #f7f7f7">
                    <div class="row mt-5">
                      <span class="user-icon" style="margin: 0px auto">
                         <img src="${sessionScope.authUserGg.picture}" class="img-fluid">
                         </span>
                    </div>
                    <div class="row mt-3">
                      <h4 class="" style="margin: 0px auto">${sessionScope.authUserGg.name}</h4>
                    </div>
                    <div class="row mt-2 mb-5">
                      <p class="" style="margin: 0px auto">Name Role</p>
                    </div>
                  </div>
                  <div class="col-7 ml-5" style="background: #eee">
                    <ul class="list-group list-group-flush mt-3">
                      <li class="list-group-item">
                        <div class="row mt-4">
                          <span class="col-4">Name: </span>
                          <div class="col-6">
                            <span>${sessionScope.authUserGg.name}</span>
                          </div>
                        </div>
                      </li>
                      <li class="list-group-item">
                        <div class="row mt-4">
                          <span class="col-4">Email: </span>
                          <div class="col-6">
                            <span>${sessionScope.authUserGg.email}</span>
                          </div>
                        </div>
                      </li>
                    </ul>
                    <div class="row mt-2 mb-2">
                      <div class="col text-right">
                        <a href="#" class="btn btn-sm btn-outline-secondary alert-link nav-link text-heading">Cật nhập thông tin</a>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="mt-5">
                  <h4 class="fw-bold text-heading">Information Account</h4>
                </div>
                <div class="row mt-1 w-100">
                  <div class="card-body">
                    <ul class="list-group list-group-flush">
                      <li class="list-group-item">
                        <div class="row">
                          <span class="col-4">User: </span>
                          <div class="col-8">
                            <span>Goole Police</span>
                          </div>
                        </div>
                      </li>
                      <li class="list-group-item">
                        <div class="row">
                          <span class="col-4">Password: </span>
                          <div class="col-8">
                            <span>Goole Police</span>
                          </div>
                        </div>
                      </li>
                      <li class="list-group-item">
                        <div class="row">
                          <span class="col-4">Status: </span>
                          <div class="col-8">
                            <span>Vip</span>
                          </div>
                        </div>
                      </li>
                    </ul>
                  </div>
                </div>
                <div class="row mt-2">
                  <div class="col text-right">
                    <button class="btn btn-lg btn-success ">Back</button>
                    <button class="btn btn-lg btn-warning ">Thay Đổi</button>
                  </div>
                </div>
              </div>
            </c:when>
          </c:choose>
        </div>

      </div>

    </div>
  </jsp:body>
</d:web>
