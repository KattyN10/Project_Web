<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Login</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">

</head>
<body>
<div class="login">
  <div class="container">
    <form action="${pageContext.request.contextPath}/User/Login" method="post" id="frmLogin">
      <div class="container h-100 w-100 shadow-lg mt-5 mb-5">
        <div class="row justify-content-center align-items-center h-100">
          <div class="col-md-6 col-lg-7">
            <div class="card-body p-4 p-lg-5 text-black">
              <div class="row justify-content-center">
                <img src="${pageContext.request.contextPath}/image/logo11.png" class="img-fluid w-50" alt="...">
              </div>
              <div class="row justify-content-center">
                <h5 class="fw-normal mb-3 mt-5 pb-3" style="letter-spacing: 2px;">Đăng nhập</h5>
              </div>

              <div class="form-outline mb-4">
                <input type="text" id="txtUsername" name="username" placeholder="Username" class="form-control form-control-lg" />
              </div>

              <div class="form-outline mb-3">
                <input type="password" id="txtPassword" name="password" placeholder="Password" class="form-control form-control-lg" />
              </div>

              <t:if test="${hasError}">
                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                  <strong>Login fail!</strong> ${errorMessage}
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
              </t:if>

              <div class="pt-1 mb-3 mt-3">
                <button class="btn btn-dark btn-lg btn-block" type="submit">Login </button>
              </div>
              <div class="text-center">
                <p>Not a member? <a href="${pageContext.request.contextPath}/User/Register">Register</a></p>
                <p>Forgot Passs? <a href="${pageContext.request.contextPath}/views/viewHome/ForgotPass.jsp">Reset Passs</a></p>
                <p>or sign up with:</p>
                <button type="button" class="btn btn-link btn-floating mx-1"
                        onclick="location.href='https://www.facebook.com/dialog/oauth?client_id=515625173274802&redirect_uri=http://localhost:8080/Edit/Loging/Facebook'">
                  <a href=""></a>
                  <i class="bi bi-facebook h3"></i>
                </button>

                <button type="button" class="btn btn-link btn-floating mx-1"
                        onclick="location.href='https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/Edit/Loging/Google&response_type=code&client_id=1042745399242-4360ia1ghlrnq5ej8cejthrvfjr1n38s.apps.googleusercontent.com&approval_prompt=force'">
                  <i class="bi bi-google h3"></i>
                </button>

                <button type="button" class="btn btn-link btn-floating mx-1">
                  <i class="bi bi-instagram h3"></i>
                </button>

              </div>
            </div>
          </div>
        </div>
      </div>
    </form>
  </div>
</div>



<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>