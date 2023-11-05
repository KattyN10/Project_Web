package com.example.edit.controllers;

import com.example.edit.Utils.ServletUtils;
import com.example.edit.beans.Category;
import com.example.edit.beans.Editor_manage_categories;
import com.example.edit.beans.User;
import com.example.edit.models.CategoryModel;
import com.example.edit.models.EditorManageModel;
import com.example.edit.models.UserModel;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminUserEditServlet", value = "/Admin/User/EditCate/*")
public class AdminUserEditServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/EditCate";
        }
        switch (path) {
            case "/EditCate":
                List<User> listBTV = UserModel.listBTV();
                request.setAttribute("list", listBTV);
                ServletUtils.forward("/views/viewAdminUser/EditCate.jsp",request,response);
                break;
            case "/Edit":
                int id5 = 0;
                try {
                    id5 = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }
                List<Editor_manage_categories> listCateById = EditorManageModel.listCateByIdUser(id5);
                List<Category> listCates = CategoryModel.findAllIn();
                request.setAttribute("listCateById",listCateById);
                request.setAttribute("listCate",listCates);
                ServletUtils.forward("/views/viewAdminUser/Edit.jsp",request,response);
                break;
            case "/Edit/Delete":
                int id6 = 0;
                int id7=0;
                try {
                    id7 = Integer.parseInt(request.getParameter("id"));
                    id6 = Integer.parseInt(request.getParameter("id_editmana"));
                } catch (NumberFormatException e) {
                }
                EditorManageModel.DeleteEditorManage(id6);
                String url="/Admin/User/EditCate/Edit?id="+id7;
                ServletUtils.redirect("/Edit"+url,request,response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/Edit":
                editBTVCate(request,response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }
    private void editBTVCate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        int btv_id = Integer.parseInt(request.getParameter("id"));

        int id_cate = Integer.parseInt(request.getParameter("cate_id"));

        Editor_manage_categories c = new Editor_manage_categories(0,btv_id,id_cate);
        EditorManageModel.addBTVCate(c);

        String url="/Admin/User/EditCate/Edit?id="+btv_id;
        ServletUtils.redirect("/Edit"+url,request,response);
    }
}
