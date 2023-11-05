<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="categories" scope="request" type="java.util.List<com.example.edit.beans.Category>"/>
<jsp:useBean id="tags" scope="request" type="java.util.List<com.example.edit.beans.Tag>"/>


<t:main>
    <jsp:attribute name="css">
      <link href="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.5.0/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
    </jsp:attribute>

    <jsp:attribute name="js">
    <script src="https://cdn.tiny.cloud/1/1jp8ineln53u6yy75unwd6d2dmxjp1y71wz8b7sfsp6qjo0x/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>s
    <script src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.5.0/js/fileinput.min.js"></script>
    <script>
        $('#avatar').fileinput({
            allowedFileExtensions: ['jpg','png','gif']
        });
    </script>
    <script>
        tinymce.init({
            entity_encoding : "raw",
            selector: '#txtContent',
            placeholder: 'Type content here',
            height: 450,
            plugins: 'paste image link autolink lists table media',
            menubar: false,
            toolbar: [
                'undo redo | bold italic underline strikethrough | numlist bullist | alignleft aligncenter alignright | forecolor backcolor | table link image media'
            ],
        });
    </script>
  </jsp:attribute>

    <jsp:body>
        <br><br><br>
        <div class="content-cate mt-5">
            <form action="" method="post" enctype="multipart/form-data">
                <div class="container">
                    <div class="card">
                        <div class="card-header d-flex justify-content-md-between">
                            <div class="justify-content-center"><b>ARTICLES POST</b></div>
                        </div>
                        <div class="card-body ml-5">
                            <div class="form-group">
                                <label for="txtTitle">Title</label>
                                <input type="text" class="form-control " id="txtTitle" name="title" autofocus />
                            </div>
                            <div class="form-group">
                                <label for="txtAbstracts">Abstracts</label>
                                <input type="text" class="form-control " id="txtAbstracts" name="abstracts"  />
                            </div>
                            <div class="form-group">
                                <label for="txtCategory">Categories</label>
                                <select id="txtCategory" class="form-control " name="name">
                                    <c:forEach items="${categories}" var="c">
                                        <option>${c.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="txtTag">Tags</label>
                                <select id="txtTag" name="value" class="form-control " multiple="multiple">
                                    <c:forEach items="${tags}" var="c">
                                        <option>${c.value}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="txtContent">Content</label>
                                <textarea class="form-control w-75" id="txtContent" name="content"></textarea>
                            </div>
                            <div class="form-group">
                                <label >Avatar</label>
                                <input  id="avatar" name="avatar" type="file"/>
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="row float-right mr-5">
                                <button type="submit" class="btn btn-success btn-lg " >
                                    <i aria-hidden="true"></i>
                                    Post
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </jsp:body>
</t:main>