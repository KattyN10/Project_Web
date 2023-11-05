package com.example.edit.controllers;

import com.example.edit.Utils.ServletUtils;
import com.example.edit.beans.Articles;
import com.example.edit.beans.Category;
import com.example.edit.models.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminCateServlet", value = "/Admin/Category/*")
public class AdminCateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }

        switch (path) {
            case "/Index":
                List<Category> list = CategoryModel.findAll();
                request.setAttribute("categories", list);
                ServletUtils.forward("/views/viewAdminCate/Index.jsp", request, response);
                break;
            case "/Detail/Delete":
                int id5 = 0;
                try {
                    id5 = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }
                List<Articles> listArt2 = ArticleModel.getArticleByCateId(id5);
                for(int i =0;i<listArt2.size();i++)
                {
                    FeedbackModel.DeleteFeedByAId(listArt2.get(i).getArticle_id());
                    CommentModel.DeleteCmtByArtId(listArt2.get(i).getArticle_id());
                    TagArticleModel.DeleteTagByArt(listArt2.get(i).getArticle_id());
                }
                ArticleModel.DeleteArtByIdCate(id5);
                CategoryModel.deleteCate(id5);
                String url = "/Admin/Category/Detail?id="+id5;
                ServletUtils.redirect("/Edit"+url,request,response);
                break;
            case "/Delete":
                int id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }
                List<Category> cateconList = CategoryModel.findCatCon(id);
                for(int j = 0;j<cateconList.size();j++)
                {
                    List<Articles> listArtCon = ArticleModel.getArticleByCateId(cateconList.get(j).getCategories_id());
                    for(int t=0;t<listArtCon.size();t++)
                    {
                        CommentModel.DeleteCmtByArtId(listArtCon.get(t).getArticle_id());
                        TagArticleModel.DeleteTagByArt(listArtCon.get(t).getArticle_id());
                        FeedbackModel.DeleteFeedByAId(listArtCon.get(t).getArticle_id());
                    }
                    EditorManageModel.DeleteByCate(cateconList.get(j).getCategories_id());
                    ArticleModel.DeleteArtByIdCate(cateconList.get(j).getCategories_id());
                }
                List<Articles> listArt = ArticleModel.getArticleByCateId(id);
                for(int i =0;i<listArt.size();i++)
                {
                    CommentModel.DeleteCmtByArtId(listArt.get(i).getArticle_id());
                    TagArticleModel.DeleteTagByArt(listArt.get(i).getArticle_id());
                    FeedbackModel.DeleteFeedByAId(listArt.get(i).getArticle_id());
                }
                ArticleModel.DeleteArtByIdCate(id);
                CategoryModel.deleteCateCon(id);
                EditorManageModel.DeleteByCate(id);
                CategoryModel.deleteCate(id);
                ServletUtils.redirect("/Admin/Category",request,response);
                break;
            case "/Add":
                ServletUtils.forward("/views/viewAdminCate/Add.jsp", request, response);
                break;

            case "/Update":
                int idCate = 0;
                try {
                    idCate = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }

                Category c = CategoryModel.findCateById(idCate);
                if (c != null) {
                    request.setAttribute("category", c);
                    ServletUtils.forward("/views/viewAdminCate/Update.jsp", request, response);
                } else {
                    ServletUtils.redirect("/Admin/Category", request, response);
                }
                break;
            case "/Detail":
                response.setContentType("text/html;charset=UTF-8");
                request.setCharacterEncoding("UTF-8");
                int id3 = 0;
                try {
                    id3 = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }
                Category c3 = CategoryModel.findCateById(id3);
                List<Category> categoryList = CategoryModel.findAllIn();
                if (c3 != null) {
                    List<Category> listCon = CategoryModel.getCateChilds(id3);
                    request.setAttribute("categories", listCon);
                    request.setAttribute("categoryList", categoryList);
                    request.setAttribute("category", c3);
                    ServletUtils.forward("/views/viewAdminCate/Detail.jsp", request, response);
                } else {
                    ServletUtils.redirect("/Admin/Category", request, response);
                }
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
                addCate(request, response);
                break;
            case "/Update":
                updateCate(request, response);
                break;
            case "/Detail":
                addCateCon(request,response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }
    private void addCate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");

        Category category = new Category(0,name,0);
        CategoryModel.addCate(category);
        ServletUtils.redirect("/Admin/Category",request,response);
    }
    private void addCateCon(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        int parent_id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        Category category = new Category(0,name,parent_id);
        CategoryModel.addCateCon(category);

        String url = "/Admin/Category/Detail?id=" +parent_id;
        ServletUtils.redirect("/Edit"+url,request,response);
    }
    private void updateCate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("categories_id"));
        String name = request.getParameter("name");
        Category category = new Category(id,name,0);
        CategoryModel.updateCate(category);
        ServletUtils.redirect("/Admin/Category",request,response);
    }
}
