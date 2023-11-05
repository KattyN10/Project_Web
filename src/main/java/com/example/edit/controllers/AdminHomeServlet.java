package com.example.edit.controllers;

import com.example.edit.Utils.ServletUtils;
import com.example.edit.beans.Articles;
import com.example.edit.beans.Tag;
import com.example.edit.models.ArticleModel;
import com.example.edit.models.TagModel;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminHomeServlet", value = "/Admin/Home/*")
public class AdminHomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }

        switch (path) {
            case "/Index":
                int allArticle = ArticleModel.getAllArticle();
                int allCate = ArticleModel.getAllCateAdmin();
                int allTag = ArticleModel.getAllTag();
                int allUser = ArticleModel.getAllUser();
                List<Articles> listTop10CateNext = ArticleModel.findTop10CateNext();
                List<Articles> listTop10Cate = ArticleModel.findTop10Cate();
                List<Articles> listtop3 = ArticleModel.findTop3Admin();
                List<Tag> list = TagModel.findAll();
                List<Articles> listtop5 = ArticleModel.findTop5();
                List<Articles> listtop10 = ArticleModel.findTop10();
                List<Articles> listtop5NewinWeek = ArticleModel.get5ArticleNewinWeek();
                List<Articles> listtop5NewinWeekNext = ArticleModel.get5ArticleNewinWeekNext();
                request.setAttribute("list10Cate",listTop10Cate);
                request.setAttribute("list10CateNext",listTop10CateNext);
                request.setAttribute("listtop5NewinWeek", listtop5NewinWeek);
                request.setAttribute("listtop5NewinWeekNext", listtop5NewinWeekNext);
                request.setAttribute("listtop", listtop5);
                request.setAttribute("listtopnext", listtop10);
                request.setAttribute("listtop3", listtop3);
                request.setAttribute("allArticle", allArticle);
                request.setAttribute("allCate", allCate);
                request.setAttribute("allTag", allTag);
                request.setAttribute("allUser", allUser);
                request.setAttribute("tags", list);
                ServletUtils.forward("/views/viewAdminHome/Index.jsp", request, response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
