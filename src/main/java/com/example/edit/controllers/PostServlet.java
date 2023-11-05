package com.example.edit.controllers;

import com.example.edit.Utils.ServletUtils;
import com.example.edit.beans.*;
import com.example.edit.models.ArticleModel;
import com.example.edit.models.CategoryModel;
import com.example.edit.models.TagArticleModel;
import com.example.edit.models.TagModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.List;


@WebServlet(name = "PostServlet", value = "/Post/*")
@MultipartConfig(
        fileSizeThreshold = 2 * 1024 * 1024,
        maxFileSize = 50 * 1024 * 1024,
        maxRequestSize = 50 * 1024 * 1024
)

public class PostServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }
        HttpSession session = request.getSession();
        User writer = (User) session.getAttribute("authUser");
        int writer_id = writer.getUserId();
        switch (path) {
            case "/Index":
                List<Category> listCat = CategoryModel.findAllCat();
                request.setAttribute("categories",listCat);
                List<Tag> listTag = TagModel.findAll();
                request.setAttribute("tags",listTag);

                ServletUtils.forward("/views/viewPost/Index.jsp", request, response);
                break;
            case "/Waiting":
                List<Articles> listWaiting = ArticleModel.findArticleByStatus2(101, writer_id);
                request.setAttribute("listWaiting",listWaiting);
                ServletUtils.forward("/views/viewPost/ListWaiting.jsp", request, response);
                break;
            case "/Draft":
                List<Articles> listDraft = ArticleModel.findArticleByStatus2(104,writer_id);
                request.setAttribute("listDraft",listDraft);
                ServletUtils.forward("/views/viewPost/ListDraft.jsp", request, response);
                break;
            case "/Refused":
                List<Articles> listRefused = ArticleModel.findArticleByStatus2(103,writer_id);
                request.setAttribute("listRefused",listRefused);
                ServletUtils.forward("/views/viewPost/ListRefused.jsp", request, response);
                break;
            case "/Published":
                List<Articles> listPublished = ArticleModel.findArticleByStatus2(102, writer_id);
                request.setAttribute("listPublished",listPublished);
                ServletUtils.forward("/views/viewPost/ListPublished.jsp", request, response);
                break;
            case "/Update":
                int article_id = Integer.parseInt(request.getParameter("article_id"));
                int checkStatus = ArticleModel.checkStatus(article_id);
                Articles article = ArticleModel.findByIdAll(article_id);
                if(article == null){
                    ServletUtils.redirect("/Post", request, response);
                } else{
                    request.setAttribute("checkStatus",checkStatus);
                    request.setAttribute("article", article);
                    ServletUtils.forward("/views/viewPost/Update.jsp", request, response);
                }
                break;
            case "/Category":
                getArticleByCate(request,response);
                break;
            case "/Tag":
                getArticleByTag(request,response);
                break;
            case "/Pagging":
                paggingByCate(request,response);
                break;
            case "/Premium":
                getArticlePre(request,response);
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
        if (path == null || path.equals("/")) {
            path = "/Index";
        }
        switch (path) {
            case "/Index":
                postArticles(request, response);
                postTagArticle(request,response);
                break;
            case "/Update":
                int article_id = Integer.parseInt(request.getParameter("article_id"));
                int checkStatus = ArticleModel.checkStatus(article_id);
                update(request,response);
                if (checkStatus == 3){
                    ServletUtils.redirect("/Edit/Post/Refused", request, response);
                }
                else if (checkStatus == 4){
                    ServletUtils.redirect("/Edit/Post/Draft", request, response);
                }
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }
    private void update(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        int article_id = Integer.parseInt(request.getParameter("article_id"));
        Articles a = ArticleModel.findByIdAll(article_id);

        String title = request.getParameter("title");
        int views = Integer.parseInt(request.getParameter("views"));
        String abstracts = request.getParameter("abstracts");
        String content = request.getParameter("content");
        String categoryName = a.getCategoryName();
        int categories_id = a.getCategories_id();
        boolean premium = a.isPremium();
        java.util.Date create_date = Date.valueOf(request.getParameter("create_date"));
        Date publish_date = (Date) a.getPublish_date();
        int writer_id = a.getWriter_id();
        int status_id = 104;
        String avatar = a.getAvatar();

        Articles articles = new Articles(article_id,title,create_date,publish_date,views,abstracts,content,categories_id,premium,writer_id,status_id,avatar,categoryName);
        ArticleModel.updateNews(articles);

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

    private void postArticles(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String title = request.getParameter("title");
        Date create_date = getCurrentDate();
        Date publish_date = Date.valueOf("1111-11-11");
        int views= 0;

        String abstracts = request.getParameter("abstracts");
        String content = request.getParameter("content");
        String categoryName = request.getParameter("name");
        Category category = CategoryModel.findCatByName(categoryName);
        int categories_id = category.getCategories_id();
        boolean premium = false;

        HttpSession session = request.getSession();
        User Author = (User) session.getAttribute("authUser");

        int writer_id = Author.getUserId();
        int status_id = 104;

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

                        Articles a = new Articles(0,title,create_date,publish_date,views,abstracts,content,
                                categories_id,premium, writer_id,status_id,avatar,categoryName);
                        ArticleModel.addNews(a);
                    }
                }
            }
        }

        ServletUtils.redirect("/Post",request,response);
    }

    private void getArticleByCate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String cid = request.getParameter("cid");
        int cateId = Integer.parseInt(cid);
        String indexPage = request.getParameter("index");
        if(indexPage==null)
        {
            indexPage="1";
        }
        int index =Integer.parseInt(indexPage);
        int indexNext = index+1;
        int indexPre = index-1;
        if (indexPre == 0)
        {
            indexPre = 1;
        }
        if(index ==  1)
        {
            index =0 ;
        }
        else
        {
            index = (index -1) * 6 ;
        }
        int count  = ArticleModel.getTotalArtilceByCate(cateId);

        int endPage = count/6;
        if(count  % 6!=0 ) {
            endPage++;
        }
        if (indexNext > endPage)
        {
            indexNext = indexNext -1;
        }
        if (session.getAttribute("checkAccPre")== null)

        {
            List<Articles> listA = ArticleModel.getArticleToPagging(cateId,index);
            request.setAttribute("list", listA);
        }
        else {
            boolean checkPreUser=  (boolean) session.getAttribute("checkAccPre");
            if(checkPreUser == true)
            {
                List<Articles> listA = ArticleModel.getArticleToPaggingPre(cateId,index);
                request.setAttribute("list", listA);
            }
            else {
                List<Articles> listA = ArticleModel.getArticleToPagging(cateId,index);
                request.setAttribute("list", listA);
            }
        }
        List<Articles> listOneTag = ArticleModel.findTopCateTag(cateId);
        Articles listOne = ArticleModel.findTopCate(cateId);
        boolean check = CategoryModel.checkCate(cateId);
        List<Articles> listT = ArticleModel.getArticleByCateList3(cateId);
        // Tìm danh mục con
        List<Category> listC =CategoryModel.getCateChilds(cateId);
        // Lấy tên danh muc
        List<Category> listCa =CategoryModel.getCateByID(cateId);
        // Lấy tất cả danh mục
        List<Category> lisAllCate = CategoryModel.findAllIn();
        List<Category> list5cate  = CategoryModel.find5Cate();
        session.setAttribute("list5cate",list5cate);
        session.setAttribute("lisAllCate",lisAllCate);
        session.setMaxInactiveInterval(6000);

        request.setAttribute("listC", listC);
        request.setAttribute("listT", listT);
        request.setAttribute("listOne", listOne);
        request.setAttribute("listOneTag", listOneTag);
        request.setAttribute("check", check);
        request.setAttribute("listCa", listCa);
        request.setAttribute("tag", index);
        request.setAttribute("indexNext", indexNext);
        request.setAttribute("indexPre", indexPre);
        request.setAttribute("EndPage",endPage);
        ServletUtils.forward("/views/viewArticlePosts/Index.jsp", request, response);
    }
    private static Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new Date(today.getTime());
    }
    private void getArticleByTag(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session =request.getSession();
        String indexPage = request.getParameter("index");
        String tid = request.getParameter("tid");
        int tagId = Integer.parseInt(tid);
        if(indexPage==null)
        {
            indexPage="1";
        }
        int index =Integer.parseInt(indexPage);
        int indexNext = index+1;
        int indexPre = index-1;
        if (indexPre == 0)
        {
            indexPre = 1;
        }
        if(index ==  1)
        {
            index =0 ;
        }
        else
        {
            index = (index -1) * 6 ;
        }
        int count  = ArticleModel.getTotalArtilceByTag(tagId);
        int endPage = count/6;
        if(count  % 6!=0 ) {
            endPage++;
        }
        if (indexNext > endPage)
        {
            indexNext = indexNext -1;
        }
        request.setAttribute("Day",getCurrentDate());
        if (session.getAttribute("checkAccPre")== null)

        {
            List<Articles> listA = ArticleModel.getArticleByTag(tagId,index);
            request.setAttribute("listA", listA);
        }
        else {
            boolean checkPreUser=  (boolean) session.getAttribute("checkAccPre");
            if(checkPreUser == true)
            {
                List<Articles> listA = ArticleModel.getArticleByTagToPre(tagId,index);
                request.setAttribute("listA", listA);
            }
            else {
                List<Articles> listA = ArticleModel.getArticleByTag(tagId,index);
                request.setAttribute("listA", listA);
            }
        }
        List<Category> lisAllCate = CategoryModel.findAllIn();
        List<Category> list5cate  = CategoryModel.find5Cate();
        session.setAttribute("list5cate",list5cate);
        session.setAttribute("lisAllCate",lisAllCate);
        session.setMaxInactiveInterval(6000);
        request.setAttribute("tag", index);
        request.setAttribute("tid", tid);
        request.setAttribute("indexNext", indexNext);
        request.setAttribute("indexPre", indexPre);
        request.setAttribute("EndPage",endPage);
        ServletUtils.forward("/views/viewArticlePosts/SearchTag.jsp", request, response);
    }
    private void paggingByCate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session =request.getSession();
        String cid = request.getParameter("cid");
        String indexPage = request.getParameter("index");
        int cids =Integer.parseInt(cid);
        if(indexPage==null)
        {
            indexPage="1";
        }
        int index =Integer.parseInt(indexPage);
        int indexNext = index+1;
        int indexPre = index-1;
        if (indexPre == 0)
        {
            indexPre = 1;
        }
        if(index ==  1)
        {
            index =0 ;
        }
        else
        {
            index = (index -1) * 6 ;
        }
        int count  = ArticleModel.getTotalArtilceByCate(cids);
        if (indexNext > count)
        {
            indexNext = indexNext -1;
        }
        int endPage = count/6;
        if(count  % 6!=0 ) {
            endPage++;
        }
        if (indexNext > endPage)
        {
            indexNext = indexNext -1;
        }
        if (session.getAttribute("checkAccPre")== null)

        {
            List<Articles> listA = ArticleModel.getArticleToPagging(cids,index);
            request.setAttribute("list", listA);
        }
        else {
            boolean checkPreUser=  (boolean) session.getAttribute("checkAccPre");
            if(checkPreUser == true)
            {
                List<Articles> listA = ArticleModel.getArticleToPaggingPre(cids,index);
                request.setAttribute("list", listA);
            }
            else {
                List<Articles> listA = ArticleModel.getArticleToPagging(cids,index);
                request.setAttribute("list", listA);
            }
        }
        Articles listOne = ArticleModel.findTopCate(cids);
        List<Articles> listOneTag = ArticleModel.findTopCateTag(cids);
        boolean check = CategoryModel.checkCate(cids);
        List<Articles> listT = ArticleModel.getArticleByCateList3(cids);
        List<Category> listC =CategoryModel.getCateChilds(cids);
        List<Category> listCa =CategoryModel.getCateByID(cids);
        List<Category> lisAllCate = CategoryModel.findAllIn();
        List<Category> list5cate  = CategoryModel.find5Cate();
        session.setAttribute("list5cate",list5cate);
        session.setAttribute("lisAllCate",lisAllCate);
        session.setMaxInactiveInterval(6000);
        request.setAttribute("listC", listC);
        request.setAttribute("listT", listT);
        request.setAttribute("listOneTag",listOneTag);
        request.setAttribute("listOne", listOne);
        request.setAttribute("check", check);
        request.setAttribute("listCa", listCa);
        request.setAttribute("tag", index);
        request.setAttribute("indexNext", indexNext);
        request.setAttribute("indexPre", indexPre);
        request.setAttribute("EndPage",endPage);
        ServletUtils.forward("/views/viewArticlePosts/Index.jsp", request, response);
    }private void getArticlePre(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String indexPage = request.getParameter("index");
        if(indexPage==null)
        {
            indexPage="1";
        }
        int index =Integer.parseInt(indexPage);
        int indexNext = index+1;
        int indexPre = index-1;
        if (indexPre == 0)
        {
            indexPre = 1;
        }
        if(index ==  1)
        {
            index =0 ;
        }
        else
        {
            index = (index -1) * 6 ;
        }
        int count  = ArticleModel.getTotalArticlePre();
        if (indexNext > count)
        {
            indexNext = indexNext -1;
        }
        int endPage = count/6;
        if(count  % 6!=0 ) {
            endPage++;
        }
        if (indexNext > endPage)
        {
            indexNext = indexNext -1;
        }
        List<Articles> list = ArticleModel.getArticlePre(index);
        List<Category> lisAllCate = CategoryModel.findAllIn();
        List<Category> list5cate  = CategoryModel.find5Cate();
        session.setAttribute("list5cate",list5cate);
        session.setAttribute("lisAllCate",lisAllCate);
        session.setMaxInactiveInterval(6000);
        request.setAttribute("list", list);
        request.setAttribute("tag", index);
        request.setAttribute("Day",getCurrentDate());
        request.setAttribute("indexNext", indexNext);
        request.setAttribute("indexPre", indexPre);
        request.setAttribute("EndPage",endPage);
        ServletUtils.forward("/views/viewArticlePosts/Prenium.jsp", request, response);
    }

}
