package com.example.edit.controllers;


import com.example.edit.Utils.ServletUtils;
import com.example.edit.beans.Tag;
import com.example.edit.models.TagArticleModel;
import com.example.edit.models.TagModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminTagServlet", value = "/Admin/Tag/*")
public class AdminTagServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }
        switch (path) {
            case "/Index":
                List<Tag> list = TagModel.findAll();
                request.setAttribute("tags", list);
                ServletUtils.forward("/views/viewAdminTag/Index.jsp", request, response);
                break;
            case "/Delete":
                int id = 0;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }
                TagArticleModel.deleteTagArt(id);
                TagModel.deleteTag(id);
                ServletUtils.redirect("/Admin/Tag",request,response);
                break;
            case "/Add":
                ServletUtils.forward("/views/viewAdminTag/Add.jsp", request, response);
                break;
            case "/Update":
                int idtag = 0;
                try {
                    idtag = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                }

                Tag c = TagModel.findTagById(idtag);
                if (c != null) {
                    request.setAttribute("tag", c);
                    ServletUtils.forward("/views/viewAdminTag/Update.jsp", request, response);
                } else {
                    ServletUtils.redirect("/Admin/Tag", request, response);
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
                addTag(request, response);
                break;
            case "/Update":
                updateTag(request, response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }
    private void addTag(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String value = request.getParameter("value");
        Tag tag = new Tag(0,value);
        TagModel.addTag(tag);
        ServletUtils.redirect("/Admin/Tag",request,response);
    }
    private void updateTag(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String value = request.getParameter("value");
        int id = Integer.parseInt(request.getParameter("tags_id"));

        Tag tag = new Tag(id,value);
        TagModel.updateTage(tag);
        ServletUtils.redirect("/Admin/Tag",request,response);
    }

}
