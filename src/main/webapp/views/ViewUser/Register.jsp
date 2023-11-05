<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="d" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<d:web>
    <jsp:attribute name="css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" integrity="sha512-f0tzWhCwVFS3WeYaofoLWkTP62ObhewQ1EZn65oSYDZUg1+CyywGKkWzm8BxaJj5HGKI72PnMH9jYyIFz+GH7g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  </jsp:attribute>
    <jsp:attribute name="js">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js" integrity="sha512-AIOTidJAcHBH2G/oZv9viEGXRqDNmfdPVPYOYKGy3fti0xIplnlgMHUGfuNRzC6FkzIo0iIxgFnr9RikFxK+sw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script>

        $('#frmRegister').on('submit', function (e) {
            e.preventDefault();

            const username = $('#txtUsername').val();
            if (username.length === 0) {
                alert('Invalid username.');
                return;
            }
            $.getJSON('${pageContext.request.contextPath}/User/IsAvailable?user=' + username, function (data) {
                if (data === false) {
                    $('#frmRegister').off('submit').submit();
                } else {
                    alert('Username is not available.');
                }

        });
        });

        $('#date').datetimepicker({
            format: 'd/m/Y',
            timepicker: false,
            mask: true
        });
    </script>
  </jsp:attribute>
   <jsp:body>
       <div class="content">
           <form action="" id="frmRegister" method="post">
               <div class="container text-center">
                   <!-- Background image -->
                   <div class="p-5 bg-image" style="
        background: bisque;
        height: 300px;
        "></div>
                   <!-- Background image -->

                   <div class="card mx-4 mx-md-5 shadow" style="
        margin-top: -170px;
        background: hsla(0, 0%, 100%, 0.8);
        backdrop-filter: blur(30px);
        ">
                       <div class="card-body py-5 px-md-5">

                           <div class="row d-flex justify-content-center">
                               <div class="col-lg-8">
                                   <h2 class="fw-bold mb-5">Sign up now</h2>
                                   <!-- 2 column grid layout with text inputs for the first and last names -->
                                   <div class="row">
                                       <div class="col-md-6 mb-4">
                                           <div class="form-outline">
                                               <input type="text" id="txtName" name="name" placeholder="Name" class="form-control" />

                                           </div>
                                       </div>
                                       <div class="col-md-6 mb-4">
                                           <div class="form-outline">
                                               <input type="text" id="txtSecondName" name="namesecond" placeholder="Name Writer" class="form-control" />

                                           </div>
                                       </div>
                                   </div>



                                   <!-- Email input -->
                                   <div class="form-outline mb-4">
                                       <input type="text" id="txtEmail" name="email" placeholder="Email"class="form-control" />

                                   </div>

                                   <div class="form-outline mb-4">
                                       <input type="text" id="date" name="dateofbirth" placeholder="Birthday" class="form-control">
                                   </div>

                                   <div class="form-outline mb-4">
                                       <input type="text" id="txtUsername" name="username" placeholder="Username" class="form-control" />

                                   </div>

                                   <!-- Password input -->
                                   <div class="form-outline mb-4">
                                       <input type="password" id="txtPass" name="pass" placeholder="Password" class="form-control" />

                                   </div>


                                   <!-- Submit button -->
                                   <button type="submit" class="btn btn-primary btn-block mb-4">
                                       Sign up
                                   </button>

                                   <!-- Register buttons -->
                                   <div class="text-center">
                                       <p>or sign up with:</p>
                                       <button type="button" class="btn btn-link btn-floating mx-1">
                                           <i class="bi bi-facebook h3"></i>
                                       </button>

                                       <button type="button" class="btn btn-link btn-floating mx-1">
                                           <i class="bi bi-google h3"></i>
                                       </button>

                                       <button type="button" class="btn btn-link btn-floating mx-1">
                                           <i class="bi bi-github h3"></i>
                                       </button>
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>
           </form>

       </div>
   </jsp:body>
</d:web>

