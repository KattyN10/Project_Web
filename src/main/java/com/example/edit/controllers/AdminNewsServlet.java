package com.example.edit.controllers;

import com.example.edit.Utils.ServletUtils;
import com.example.edit.beans.*;
import com.example.edit.models.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet(name = "AdminNewsServlet", value = "/Admin/News/*")
@MultipartConfig(
        fileSizeThreshold = 2 * 1024 * 1024,
        maxFileSize = 50 * 1024 * 1024,
        maxRequestSize = 50 * 1024 * 1024
)
public class AdminNewsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }
        switch (path) {
            case "/Index":
                try {
                    List<Articles> list = ArticleModel.findAll();
                    request.setAttribute("list",list);
                    ServletUtils.forward("/views/viewAdminNews/Index.jsp",request,response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "/Delete":
                int id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }
                FeedbackModel.DeleteFeedByAId(id);
                CommentModel.DeleteCmtByArtId(id);
                TagArticleModel.DeleteTagByArt(id);
                ArticleModel.deleteNews(id);
                ServletUtils.redirect("/Admin/News",request,response);
                break;
            case "/Detail":
                int id2 = 0;
                try {
                    id2 = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }
                Articles c = ArticleModel.findByIdAll(id2);
                List<Tag> listTag = ArticleModel.findTagByArtId(id2);

                User u = ArticleModel.findAuthor(id2);
                if (c != null) {
                    request.setAttribute("tags",listTag);
                    request.setAttribute("User",u);
                    request.setAttribute("Articles", c);
                    ServletUtils.forward("/views/viewAdminNews/Detail.jsp", request, response);
                } else {
                    ServletUtils.redirect("/Admin/News", request, response);
                }
                break;
            case "/Add":
                List<Category> listCate = CategoryModel.findAllIn();
                List<User> listPv = UserModel.listPhongVien(3);
                List<Tag> listTags = TagModel.findAll();
                request.setAttribute("tags",listTags);
                request.setAttribute("listPv",listPv);
                request.setAttribute("listCate",listCate);
                ServletUtils.forward("/views/viewAdminNews/Add.jsp", request, response);
                break;
            case "/Update":
                int id3 = 0;
                try {
                    id3 = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }
                Articles c3 = ArticleModel.findByIdAll(id3);
                List<User> listPvs = UserModel.listPhongVien(3);
                List<Category> listCates = CategoryModel.findAllIn();
                List<Tag> listTagId = ArticleModel.findTagByArtId(id3);
                if (c3 != null) {
                    request.setAttribute("listCate",listCates);
                    request.setAttribute("listPv",listPvs);
                    request.setAttribute("tags",listTagId);
                    request.setAttribute("Articles", c3);
                    ServletUtils.forward("/views/viewAdminNews/Update.jsp", request, response);
                } else {
                    ServletUtils.redirect("/Admin/News", request, response);
                }
                break;
            case "/EditTag":
                int id7 = 0;
                try {
                    id7 = Integer.parseInt(request.getParameter("article_id"));
                } catch (NumberFormatException e) {
                }
                Articles c7 = ArticleModel.findByIdAll(id7);
                List<Tag> listTag7 = ArticleModel.findTagByArtIdKhoa(id7);
                List<Tag> listTagAll = TagModel.findAll();
                request.setAttribute("article",c7);
                request.setAttribute("tags",listTag7);
                request.setAttribute("listtag",listTagAll);
                ServletUtils.forward("/views/viewAdminNews/EditTag.jsp", request, response);
                break;
            case "/EditTag/Delete":
                int id4 = 0;
                int id1 =0;
                try {
                    id4 = Integer.parseInt(request.getParameter("tags_id"));
                    id1 = Integer.parseInt(request.getParameter("a_id"));
                } catch (NumberFormatException e) {
                }

                TagArticleModel.deleteTagArt(id4);

                String url ="/Admin/News/EditTag?article_id="+id1;
                ServletUtils.redirect("/Edit"+url,request,response);
                break;
            case "/Draft":
                List<Articles> list = ArticleModel.findDraft();
                request.setAttribute("draftArt",list);
                ServletUtils.forward("/views/viewAdminNews/Draft.jsp", request, response);
                break;
            case "/Draft/Edit":
                int id8 =0;
                try {
                    id8 = Integer.parseInt(request.getParameter("article_id"));
                } catch (NumberFormatException e) {
                }
                ArticleModel.UpdateDraft(id8);
                String url2 = "/Admin/News/Draft";
                ServletUtils.redirect("/Edit"+url2,request,response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String path = request.getPathInfo();
        switch (path) {
            case "/EditTag":
                addTags(request,response);
                break;
            case "/Add":
                addNews(request, response);
                postTagArticle(request,response);
                break;
            case "/Update":
                updateNews(request, response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }

    }
    private void addTags(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int article_id = Integer.parseInt(request.getParameter("article_id"));
        int tags_id = Integer.parseInt(request.getParameter("tags_id"));
        int index = 0;
        Tags_articles tagArticleModel = new Tags_articles(tags_id,article_id,index);
        TagArticleModel.addTagArticle(tagArticleModel);
        String url = "/Admin/News/EditTag?article_id="+article_id;
        ServletUtils.redirect("/Edit"+url,request,response);
    }
    private void addNews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");

        int views = Integer.parseInt(request.getParameter("views"));
        String abstracts = request.getParameter("abstracts");
        String content = request.getParameter("content");
        String categories_name = request.getParameter("categories_name");
        Category category = CategoryModel.findCatByName(categories_name);
        int catetogy_id = category.getCategories_id();
        String categoriesName = request.getParameter("categories_name");
        boolean premium = request.getParameter("premium") !=null;

        Date create_date = new Date(System.currentTimeMillis());
        java.util.Date publish_date = Date.valueOf(request.getParameter("publish_date"));

        for (Part part : request.getParts()){
            if (part.getName().equals("avatar")) {
                String contentDisposition = part.getHeader("content-disposition");
                String[] items = contentDisposition.split(";");
                for (String s : items) {
                    String tmp = s.trim();
                    if (tmp.startsWith("filename")) {
                        int idx = tmp.indexOf("=") + 2;
                        String avatar = tmp.substring(idx, tmp.length() - 1);
                        String targetDir = this.getServletContext().getRealPath("image/Article/");
                        String destination = targetDir + avatar;
                        part.write(destination);
                        Articles articles = new Articles(0,title,create_date,publish_date,views,abstracts,content,catetogy_id,premium,4,104,avatar,categoriesName);
                        ArticleModel.addNews(articles);
                    }
                }
            }
        }

        ServletUtils.redirect("/Admin/News", request,response);
    }

    private void updateNews(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String title = request.getParameter("title");
        int views = Integer.parseInt(request.getParameter("views"));
        String abstracts = request.getParameter("abstracts");
        String content = request.getParameter("content");
        String categories_name = request.getParameter("categories_name");
        Category category = CategoryModel.findCatByName(categories_name);
        int catetogy_id = category.getCategories_id();
        String categoriesName = request.getParameter("categories_name");
        boolean premium = request.getParameter("premium") !=null;
        Date create_date = new Date(System.currentTimeMillis());
        java.util.Date publish_date = Date.valueOf(request.getParameter("publish_date"));


        String second_name = request.getParameter("second_name");
        User user = UserModel.findCatBySecondName(second_name);
        int writer_id = user.getUserId();
        String nameWriter = request.getParameter("second_name");

        int status_id = Integer.parseInt(request.getParameter("status_id"));

        int id = Integer.parseInt(request.getParameter("id"));


        for (Part part : request.getParts()){
            if (part.getName().equals("avatar")) {
                String contentDisposition = part.getHeader("content-disposition");
                String[] items = contentDisposition.split(";");
                for (String s : items) {
                    String tmp = s.trim();
                    if (tmp.startsWith("filename")) {
                        int idx = tmp.indexOf("=") + 2;
                        String avatar = tmp.substring(idx, tmp.length() - 1);
                        String targetDir = this.getServletContext().getRealPath("image/Article/");
                        String destination = targetDir + avatar;
                        part.write(destination);
                        Articles articles = new Articles(id,title,create_date,publish_date,views,abstracts,content,catetogy_id,premium,writer_id,status_id,avatar,categoriesName,nameWriter);
                        ArticleModel.updateNews(articles);
                    }
                }
            }
        }

        ServletUtils.redirect("/Admin/News", request,response);
    }
    private void postTagArticle(HttpServletRequest request, HttpServletResponse response) {
        Articles art = ArticleModel.findArtByMaxID();
        int article_id = art.getArticle_id();
        String[] tagValue = request.getParameterValues("value");
        int size = tagValue.length;
        for (int i=0 ;i<size;i++){
            Tag tag = TagArticleModel.findTagByTagName(tagValue[i]);
            int tags_id = tag.getTags_id();

            Tags_articles t = new Tags_articles(tags_id,article_id,0);
            TagArticleModel.addTagArticle(t);
        }
    }
}
