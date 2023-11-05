package com.example.edit.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.example.edit.Utils.ServletUtils;
import com.example.edit.beans.Articles;
import com.example.edit.beans.Category;
import com.example.edit.beans.Editor_manage_categories;
import com.example.edit.beans.User;
import com.example.edit.models.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(name = "AdminUserServlet", value = "/Admin/User/*")
public class AdminUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }

        switch (path) {
            case "/Index":
                List<User> list = UserModel.findAll();
                request.setAttribute("list", list);
                ServletUtils.forward("/views/viewAdminUser/Index.jsp", request, response);
                break;
            case "/Delete":
                int id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }
                List<Articles> articlesList = ArticleModel.findByUserId(id);
                for(int i=0;i<articlesList.size();i++)
                {
                    TagArticleModel.DeleteTagByArt(articlesList.get(i).getArticle_id());
                    CommentModel.DeleteCmtByArtId(articlesList.get(i).getArticle_id());
                    FeedbackModel.DeleteFeedByAId(articlesList.get(i).getArticle_id());
                }
                ArticleModel.DeleteArtByIdUser(id);
                CommentModel.DeleteCmtByUserId(id);
                EditorManageModel.DeleteByUserId(id);
                UserModel.deleteUser(id);
                ServletUtils.redirect("/Admin/User",request,response);
                break;
            case "/Update":
                int id2 = 0;
                try {
                    id2 = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }
                User u = UserModel.findById(id2);
                if (u != null) {
                    request.setAttribute("Users", u);
                    ServletUtils.forward("/views/viewAdminUser/Update.jsp", request, response);
                } else {
                    ServletUtils.redirect("/Admin/User", request, response);
                }
                break;
            case "/Detail":
                int id3 = 0;
                try {
                    id3 = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }

                User u2 = UserModel.findById(id3);
                if (u2 != null) {
                    request.setAttribute("Users", u2);
                    ServletUtils.forward("/views/viewAdminUser/Detail.jsp", request, response);
                } else {
                    ServletUtils.redirect("/Admin/User", request, response);
                }
                break;
            case "/Account":
                List<User> lists = UserModel.findAll();
                request.setAttribute("list", lists);
                ServletUtils.forward("/views/viewAdminUser/Account.jsp",request,response);
                break;
            case "/Account/Extend":
                int id4 = 0;
                try {
                    id4 = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }
                LocalDate date = LocalDate.now();
                UserModel.editAccPre(id4,date);
                ServletUtils.redirect("/Admin/User/Account", request, response);
                break;
            case "/EditCate":
                List<User> listBTV = UserModel.listBTV();
                request.setAttribute("list", listBTV);
                ServletUtils.forward("/views/viewAdminUser/EditCate.jsp",request,response);
                break;
            case "/EditCate/Edit":
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
            case "/EditCate/Edit/Delete":
                int id6 = 0;
                try {
                    id6 = Integer.parseInt(request.getParameter("id_editmana"));
                } catch (NumberFormatException e) {
                }
                EditorManageModel.DeleteEditorManage(id6);
               ServletUtils.redirect("/Admin/User/EditCate",request,response);
                break;
            case "/Add":
                ServletUtils.forward("/views/viewAdminUser/Add.jsp",request,response);
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
            case "/Add":
                addUser(request, response);
                break;
            case "/Update":
                updateUser(request, response);
                break;
            case "/EditCate/Edit":
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


        ServletUtils.redirect("/Admin/User",request,response);
    }
    private void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String rawpwd = request.getParameter("password");

        String bcryptHashString = BCrypt.withDefaults().hashToString(12, rawpwd.toCharArray());

        String strDate = request.getParameter("birthday");
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate birthday = LocalDate.parse(strDate, df);

        String strIssue = request.getParameter("issue_at");
        DateTimeFormatter dt = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate issue_at = LocalDate.parse(strDate, df);


        String second_name = request.getParameter("secondname");
        String username = request.getParameter("username");

        String name = request.getParameter("name");
        String email = request.getParameter("email");

        int role_id = Integer.parseInt(request.getParameter("role_id"));

        int otpExp = (int) Math.floor(((Math.random() * 899999) + 100000));
        int expiration = 7;

        boolean premium = request.getParameter("premium")!=null;

        User user = new User(0,username,bcryptHashString,name,issue_at,expiration,role_id,second_name,birthday,email,otpExp,otpExp,premium);
        UserModel.add(user);
        ServletUtils.redirect("/Admin/User",request,response);
    }
    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String rawpwd = request.getParameter("password");

        String bcryptHashString = BCrypt.withDefaults().hashToString(12, rawpwd.toCharArray());

        String strDate = request.getParameter("birthday");
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate birthday = LocalDate.parse(strDate, df);

        String strIssue = request.getParameter("issue_at");
        DateTimeFormatter dt = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate issue_at = LocalDate.parse(strDate, df);

        int user_id = Integer.parseInt(request.getParameter("id"));

        String second_name = request.getParameter("secondname");
        String username = request.getParameter("username");

        String name = request.getParameter("name");
        String email = request.getParameter("email");

        int role_id = Integer.parseInt(request.getParameter("role_id"));

        int otpExp = (int) Math.floor(((Math.random() * 899999) + 100000));
        int expiration = 7;

        boolean premium = request.getParameter("premium")!=null;

        User user = new User(user_id,username,bcryptHashString,name,issue_at,expiration,role_id,second_name,birthday,email,otpExp,otpExp,premium);
        UserModel.updateUser(user);
        ServletUtils.redirect("/Admin/User",request,response);
    }
}
