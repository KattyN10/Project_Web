<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="d" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="authUser" scope="session" type="com.example.edit.beans.User"/>

<d:web>
  <jsp:body>

    <div class="Extend">
      <div class="container">
        <form action="${pageContext.request.contextPath}/User/UpdatePre" method="post">
          <div class="container h-100 w-100 shadow-lg" style="margin-top: 120px">
            <div class="row justify-content-center align-items-center h-100">
              <div class="col-md-6 col-lg-7">

                <div class="card-body p-4 p-lg-5 text-black">
                  <div class="row justify-content-center">
                    <img src="https://cdn.dribbble.com/users/1573719/screenshots/15614354/media/2ea525a5cdc36eefbdc7d21a1ea6bfc0.png?compress=1&resize=1000x750&vertical=top" style="    width: 25%;
}" ></img>
                  </div>
                  <div class="row justify-content-center mt-4">
                    <span class="h4  mb-0">Gia Hạn Tài Khoản VIP</span>
                  </div>
                  <div class="row mt-5 justify-content-center">
                    <h5 class="fw-normal mt-2 mr-2" style="letter-spacing: 2px;">Email: </h5>
                    <div class="form-outline ml-4">
                      <input name="email" type="email" id="form2Example17" placeholder="Email" class="form-control form-control-lg" value="${authUser.email}" />
                    </div>
                  </div>
                  <div class="row mt-5 justify-content-center">
                    <h5 class="fw-normal mt-2 mr-4" style="letter-spacing: 2px;">Số ATM: </h5>
                    <div class="form-outline mr-4">
                      <input name="txt"type="text" id="form2Example171" placeholder="Số Tài khoản" class="form-control form-control-lg" />
                    </div>
                  </div>
                  <div class="row mt-5 mb-5 ml-5">
                    <h5 class="fw-normal mr-2 ml-4" style="letter-spacing: 2px;">Price: </h5>
                    <div class="ml-5">
                      <h5>9.00$</h5>
                    </div>
                  </div>
                  <div class="row  mb-3 float-right">
                    <a href="${pageContext.request.contextPath}/User/Index" class="btn btn-lg btn-success ">Thoát</a>
                    <button type="submit" class="btn btn-lg btn-warning ml-5 ">Xác Nhận</button>
                  </div>
                </div>

              </div>
            </div>
          </div>
        </form>
      </div>
    </div>


  </jsp:body>


</d:web>
