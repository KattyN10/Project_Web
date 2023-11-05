<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <div class="form-gap" style="    padding-top: 70px;"></div>

</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="text-center">
                        <h3><i class="fa fa-lock fa-4x"></i></h3>
                        <h2 class="text-center">Forgot your password</h2>
                        <c:if test="${mess == null}">
                            <p>New Password</p>
                        </c:if>
                        <c:if test="${mess ne null}">
                            <div style="color: red;">
                                <p>${mess}</p>
                            </div>
                        </c:if>
                        <div class="panel-body">

                            <form action="${pageContext.request.contextPath}/Loging/Reset" >

                                <div class="form-group">
                                    <div class="input-group" style="   margin-bottom: 12px;">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                                        <input id="pass" name="pass" placeholder="Password" class="form-control"  type="password">
                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                                        <input id="confirm" name="confirm" placeholder="Confirm Password" class="form-control"  type="password">
                                        <input name="email" value="${email}" type="hidden" class="form-control"  type="text">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Reset Password" type="submit">
                                </div>
                                    <div class="row mt-2 mb-2" style="    float: right;
                                                                      margin-right: 1px;">
                                        <button type="button" class="btn btn-success">
                                            <a href="${pageContext.request.contextPath}/views/ViewUser/Login.jsp" style="    text-decoration: none;
                                                             color: #ffff;">Home</a>
                                        </button>
                                    </div>
                                <input type="hidden" class="hide" name="email" id="token" value="${email}">
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</body>
</html>