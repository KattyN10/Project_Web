package com.example.edit.controllers;

import com.example.edit.Utils.ServletUtils;
import com.example.edit.beans.Articles;
import com.example.edit.beans.Category;
import com.example.edit.beans.Tag;
import com.example.edit.models.ArticleModel;
import com.example.edit.models.CategoryModel;
import com.example.edit.models.TagModel;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeServlet", value = "/Home/*")
public class HomeServlet extends HttpServlet {
    private static java.sql.Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new java.sql.Date(today.getTime());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }

        switch (path) {
            case "/Index":
                HttpSession session = request.getSession();
                List<Articles> listTop10CateNext = ArticleModel.findTop10CateNext();
                List<Articles> listTop10Cate = ArticleModel.findTop10Cate();
                List<Category> lisAllCate = CategoryModel.findAllIn();
                List<Category> list4cate  = CategoryModel.find4Cate();

                List<Tag> list = TagModel.findByindex();

                // 10 bài nhiều nhất mọi chuyên mục
                List<Articles> listtop5 = ArticleModel.findTop5();
                List<Articles> listtop10 = ArticleModel.findTop10();

                // Tìm kiếm nổi bật nhất trong tuần
                Articles find1 = ArticleModel.fin1();
                List<Articles> listtop4 = ArticleModel.findTop4();
                List<Articles> listtop3 = ArticleModel.findTop3();

                // Mới nhất mọi chuyên mục
                Articles find1New = ArticleModel.find1New();
                List<Articles> listtop5New = ArticleModel.findTop5New();
                List<Articles> listtop5NewNext = ArticleModel.findTop5NewNext();


                session.setAttribute("list4cate",list4cate);
                session.setAttribute("lisAllCate",lisAllCate);
                session.setMaxInactiveInterval(6000);

                request.setAttribute("listtop3", listtop3);
                request.setAttribute("find1", find1);

                // Top nổi bật
                request.setAttribute("find1New", find1New);
                request.setAttribute("listtop5New", listtop5New);
                request.setAttribute("listtop5NewNext", listtop5NewNext);
                request.setAttribute("listtop4", listtop4);
                request.setAttribute("Day",getCurrentDate());
                request.setAttribute("listtop", listtop5);
                request.setAttribute("listtopnext", listtop10);
                request.setAttribute("tags", list);
                request.setAttribute("listAllCate", lisAllCate);
                request.setAttribute("list4cate",list4cate);
                request.setAttribute("list10Cate",listTop10Cate);
                request.setAttribute("list10CateNext",listTop10CateNext);
                ServletUtils.forward("/views/viewHome/Index.jsp", request, response);
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
