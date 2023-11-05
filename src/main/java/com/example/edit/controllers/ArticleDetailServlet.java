package com.example.edit.controllers;

import com.example.edit.Utils.ServletUtils;
import com.example.edit.beans.Articles;
import com.example.edit.beans.Comments;
import com.example.edit.beans.Tag;
import com.example.edit.beans.User;
import com.example.edit.models.ArticleModel;
import com.example.edit.models.CommentModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "ArticleDetailServlet", value = "/Detail/*")
public class ArticleDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }
        switch (path) {
            case "/Index":
                int articleID = Integer.parseInt(request.getParameter("article_id"));
                List<Articles> listRand5 = ArticleModel.findRand5SameCat(articleID);
                request.setAttribute("listRand5SameCat",listRand5);

                List<Tag> listTag = ArticleModel.findTagByArtId(articleID);
                request.setAttribute("tags",listTag);

                List<Comments> listComment = ArticleModel.findComment(articleID);
                request.setAttribute("comments",listComment);

                boolean checkPre = ArticleModel.checkPre(articleID);
                User user = ArticleModel.findAuthor(articleID);
                Articles article = ArticleModel.findById(articleID);
                if (checkPre ==true)
                {
                    request.setAttribute("checkPre",true);
                }
                else {
                    request.setAttribute("checkPre",false);
                }
                if(article==null){
                    ServletUtils.redirect("/Home", request, response);
                } else{
                    request.setAttribute("user",user);
                    request.setAttribute("article", article);
                    ServletUtils.forward("/views/viewArticleDetail/Index.jsp", request, response);
                }
                break;
            case "/Comment":
                HttpSession session = request.getSession();
                User Author = (User) session.getAttribute("authUser");
                if (Author != null){
                    int artID = Integer.parseInt(request.getParameter("article_id"));
                    Articles art = ArticleModel.findById(artID);
                    request.setAttribute("art",art);
                    ServletUtils.forward("/views/viewArticleDetail/Comment.jsp", request, response);
                }
                else {
                    ServletUtils.redirect("/User/Register",request,response);
                }
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
            case "/Comment":
                int article_id = Integer.parseInt(request.getParameter("article_id"));
                HttpSession session = request.getSession();
                User Author = (User) session.getAttribute("authUser");
                int user_id = Author.getUserId();
                String comment = request.getParameter("comment");
                LocalDateTime create_date = LocalDateTime.now();

                Comments comments = new Comments(0,article_id,user_id,comment,create_date);
                CommentModel.addComment(comments);
                ServletUtils.redirect("/Detail?article_id="+ article_id,request,response);

        }
    }
}
