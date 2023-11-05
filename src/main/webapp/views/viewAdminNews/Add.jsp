
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<t:main>
   <jsp:attribute name="css">
      <link href="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.5.0/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />
    </jsp:attribute>
  <jsp:attribute name="js">
        <script src="https://cdn.jsdelivr.net/gh/kartik-v/bootstrap-fileinput@5.5.0/js/fileinput.min.js"></script>
        <script src="https://cdn.tiny.cloud/1/1jp8ineln53u6yy75unwd6d2dmxjp1y71wz8b7sfsp6qjo0x/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
        <script>
          $('#avatar').fileinput({
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
             <span class="text-title">Add Articles</span>
           </div>
           <div class="card-body ml-5">

             <div class="form-group">
               <label >Title</label>
               <input type="text" class="form-control " name="title"  placeholder="Nhập vào đây..">
             </div>
             <div class="form-group">
               <label >Publish Date</label>
               <input type="date" name="publish_date" class="form-control">
             </div>

             <div class="form-group">
               <label >views</label>
               <input type="text" class="form-control " name="views"  placeholder="Nhập vào đây..">
             </div>
             <div class="form-group">
               <label >Abstract</label>
               <input type="text" class="form-control" name="abstracts"  placeholder="Nhập vào đây..">
               </input>
             </div>
             <div class="form-group">
               <label >Content</label>
               <textarea class="form-control" name="content" id="txtContent" placeholder="Nhập vào đây.."/>
               </textarea>
             </div>
             <div class="form-group">
               <label for="exampleFormControlSelect1">Categories</label>
               <select class="form-control" id="exampleFormControlSelect1" name="categories_name">
                <c:forEach items="${listCate}" var="k">
                  <option >${k.name}</option>
                </c:forEach>
               </select>
             </div>
             <div class="title">Danh sách Tag</div>
             <div class="form-group">
               <select id="txtTag" name="value" class="form-control " multiple="multiple">
                 <c:forEach items="${tags}" var="c">
                   <option>${c.value}</option>
                 </c:forEach>
               </select>
             </div>
             <div class="form-group">
               <label for="writer">Writer</label>
               <select class="form-control" id="writer" name="second_name">
                 <c:forEach items="${listPv}" var="t">
                   <option>${t.second_name}</option>
                 </c:forEach>
               </select>
             </div>
             <div class="form-group">
               <label for="writer">Status</label>
               <select class="form-control" id="status" name="status_id">
                 <option value="101">Đã được duyệt và chờ xuất bản</option>
                 <option value="102">Đã xuất bản</option>
                 <option value="103">Bị từ chối</option>
                 <option value="104">Chưa được duyệt</option>
               </select>
             </div>
             <div class="form-group form-check mt-5 mb-5">
               <label class="form-check-label" for="defaultCheck1">
                 Premium
               </label>
               <input class="form-check-input ml-3" type="checkbox" value="" id="defaultCheck1">
             </div>
             <div class="form-group">
               <label >Avatar</label>
               <input id="avatar" name="avatar" type="file"/>
             </div>
           </div>
           <div class="card-footer">
             <div class="row float-right mr-5">
               <a href="${pageContext.request.contextPath}/Admin/News/Index" class="btn btn-light btn-lg mr-4">Back</a>
               <button type="submit" class="btn btn-success btn-lg">Add Article</button>
             </div>
           </div>
         </div>
       </div>
     </form>
   </div>
 </jsp:body>

</t:main>
