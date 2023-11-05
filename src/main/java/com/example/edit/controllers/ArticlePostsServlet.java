package com.example.edit.controllers;

import com.example.edit.Utils.ServletUtils;
import com.example.edit.beans.Articles;
import com.example.edit.beans.Tag;
import com.example.edit.models.ArticleModel;
import com.example.edit.models.TagModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ArticlePostsServlet", value = "/Posts/*")
public class ArticlePostsServlet extends HttpServlet {
    private static java.sql.Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new java.sql.Date(today.getTime());
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }
        switch (path) {
            case "/Index":
                List<Articles> list = ArticleModel.findDraftArticles();
                request.setAttribute("articles", list);
                ServletUtils.forward("/views/viewArticlePosts/Index.jsp", request, response);
                break;
            case "/Search":
              try {
                  response.setContentType("text/html;charset=UTF-8");
                  HttpSession session =request.getSession();
                  String text = request.getParameter("search");
                  String indexPage = request.getParameter("index");;
                  if(indexPage==null)
                  {
                      indexPage="1";
                  }
                  int index =Integer.parseInt(indexPage);
                  int indexNext = index+1;
                  int indexPre = index-1;
                  if(index ==  1)
                  {
                      index =0 ;
                  }
                  else
                  {
                      index = (index -1) * 6 ;
                  }
                  if (indexPre == 0)
                  {
                      indexPre = 1;
                  }
                  int count  = ArticleModel.getTotalArtilceBySearh(text);
                  int endPage = count/6;
                  if(count  % 6!=0 ) {
                      endPage++;
                  }
                  if (indexNext > endPage)
                  {
                      indexNext = indexNext -1;
                  }
                  if (session.getAttribute("checkAccPre") == null)
                  {
                      List<Articles> listA = ArticleModel.findSearchPagging(text, index);
                      request.setAttribute("listA", listA);
                  }
                  else {
                      boolean checkPreUser=  (boolean) session.getAttribute("checkAccPre");
                      if(checkPreUser == true)
                      {
                          List<Articles> listA = ArticleModel.findSearchPaggingToPre(text,index);
                          request.setAttribute("listA", listA);
                      }
                      else {
                          List<Articles> listA = ArticleModel.findSearchPagging(text, index);
                          request.setAttribute("listA", listA);
                      }
                  }

                  List<Tag> listT = TagModel.findByindex();
                  request.setAttribute("Day",getCurrentDate());
                  request.setAttribute("tags", listT);
                  request.setAttribute("text", text);
                  request.setAttribute("EndPage",endPage);
                  request.setAttribute("indexNext", indexNext);
                  request.setAttribute("indexPre", indexPre);
                  ServletUtils.forward("/views/viewArticlePosts/Search.jsp", request, response);
              }
              catch (Exception e)
              {
                  e.printStackTrace();
              }
                break;
            case "/PaggingSearch":
                paggingSearch(request,response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    private void paggingSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String text = request.getParameter("search");
        String indexPage = request.getParameter("index");;
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
        int count  = ArticleModel.getTotalArtilceBySearh(text);
        int endPage = count/6;
        if(count  % 6!=0 ) {
            endPage++;
        }
        if (indexNext > endPage)
        {
            indexNext = indexNext -1;
        }
        HttpSession session =request.getSession();

        if (session.getAttribute("checkAccPre")== null)

        {
            List<Articles> listA = ArticleModel.findSearchPagging(text, index);
            request.setAttribute("listA", listA);
        }
        else {
            boolean checkPreUser=  (boolean) session.getAttribute("checkAccPre");
            if(checkPreUser == true)
            {
                List<Articles> listA = ArticleModel.findSearchPaggingToPre(text,index);
                request.setAttribute("listA", listA);
            }
            else {
                List<Articles> listA = ArticleModel.findSearchPagging(text, index);
                request.setAttribute("listA", listA);
            }
        }
        List<Tag> listT = TagModel.findByindex();
        request.setAttribute("Day",getCurrentDate());
        request.setAttribute("tags", listT);

        request.setAttribute("text", text);
        request.setAttribute("EndPage",endPage);
        request.setAttribute("indexNext", indexNext);
        request.setAttribute("indexPre", indexPre);
        ServletUtils.forward("/views/viewArticlePosts/Search.jsp", request, response);
    }
}
