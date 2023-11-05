<!DOCTYPE html>
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
            <h2 class="text-center">Fotgot Password</h2>
            <p>Please check your Email.</p>
            <div class="panel-body">

              <form action="${pageContext.request.contextPath}/Loging/OTP" >

                <div class="form-group">
                  <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                    <input id="email" name="OTP" placeholder="OTP" class="form-control"  type="text">
                  </div>
                </div>
                <div class="form-group">
                  <input name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Confirm OTP" type="submit">
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