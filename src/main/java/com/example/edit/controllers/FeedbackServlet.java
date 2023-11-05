package com.example.edit.controllers;

import com.example.edit.Utils.ServletUtils;
import com.example.edit.beans.Feedback;
import com.example.edit.beans.User;
import com.example.edit.models.FeedbackModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FeedbackServlet", value = "/Feedback/*")
public class FeedbackServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }
        switch (path) {
            case "/Index":
                HttpSession session = request.getSession();
                User writer = (User) session.getAttribute("authUser");
                int writer_id = writer.getUserId();
                boolean check = FeedbackModel.checkFeedback(writer_id);
                if (check == true){
                    List<Feedback> feedbacks = FeedbackModel.findFeedback(writer_id);
                    request.setAttribute("feedbacks",feedbacks);
                    ServletUtils.forward("/views/viewFeedBack/Index.jsp", request, response);
                }
                else{
                    ServletUtils.redirect("/Edit/Post", request, response);
                }

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
