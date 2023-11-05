
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="article" scope="request" type="com.example.edit.beans.Articles"/>

<t:main>
 <jsp:attribute name="css">
      <link href="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.5.0/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
    </jsp:attribute>
  <jsp:attribute name="js">
  <script src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.5.0/js/fileinput.min.js"></script>
  <script src="https://cdn.tiny.cloud/1/1jp8ineln53u6yy75unwd6d2dmxjp1y71wz8b7sfsp6qjo0x/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
  <script>
    $('#avatar1').fileinput({
      allowedFileExtensions: ['jpg','png','gif']
    });
  </script>
  <script>
    tinymce.init({
      entity_encoding : "raw",
      selector: '#txtContent',
      height: 450,
      plugins: "paste image link autolink lists table media",
      menubar: false,
      toolbar:[
        "undo redo | bold italic underline strikethrough | numlist bullist | alignleft aligncenter alignright | forecolor backcolor | table link image media"
      ]
    });
    $('#publish_date').datetimepicker({
      format: 'd/m/Y',
      timepicker: false,
      mask: true
    });
  </script>
</jsp:attribute>

  <jsp:body>
    <div class="content-cate mt-5">
      <form action="" id="#frmAdd" method="post" enctype="multipart/form-data">
        <div class="container">
          <div class="card">
            <div class="card-header d-flex justify-content-md-between">
              <span class="text-title">Bài Viết</span>
            </div>
            <div class="card-body ml-5">
              <div class="form-group">
                <label>ID</label>
                <input type="text" class="form-control " name="article_id"  value="${article.article_id}" readonly>
              </div>
              <div class="form-group">
                <label>Title</label>
                <input type="text" class="form-control " name="title"  value="${article.title}">
              </div>
              <div class="form-group">
                <label>Create Date</label>
                <input type="date" id="create_date" class="form-control " name="create_date"  value="${article.create_date}">
              </div>
              <div class="form-group">
                <label >Views</label>
                <input type="text" class="form-control " name="views"  value="${article.views}">
              </div>
              <div class="form-group">
                <label >Abstract</label>
                <input type="text" class="form-control " name="abstracts"  value="${article.abstracts}">
              </div>
              <div class="form-group">
                <label >Content</label>
                <textarea class="form-control " name="content" id="txtContent" placeholder="${article.content}"/>
                </textarea>
              </div>
            </div>
            <div class="card-footer">
              <div class="row float-right mr-5">
                <c:if test="${checkStatus == 3}">
                  <a href="${pageContext.request.contextPath}/Post/Refused" class="btn btn-primary btn-lg mr-4">Back</a>
                </c:if>
                <c:if test="${checkStatus == 4}">
                  <a href="${pageContext.request.contextPath}/Post/Draft" class="btn btn-primary btn-lg mr-4">Back</a>
                </c:if>
                <button type="submit" class="btn btn-success btn-lg">Update</button>
              </div>
            </div>
          </div>
        </div>
      </form>
    </div>
  </jsp:body>

</t:main>
