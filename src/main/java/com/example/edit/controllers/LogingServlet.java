package com.example.edit.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.example.edit.Utils.ServletUtils;
import com.example.edit.beans.*;
import com.example.edit.models.CategoryModel;
import com.example.edit.models.TagModel;
import com.example.edit.models.UserModel;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.restfb.DefaultFacebookClient;
import com.restfb.FacebookClient;
import com.restfb.Version;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LogingServlet", value = "/Loging/*")
public class LogingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public static String GOOGLE_CLIENT_ID = "1042745399242-4360ia1ghlrnq5ej8cejthrvfjr1n38s.apps.googleusercontent.com";
    public static String GOOGLE_CLIENT_SECRET = "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";
    public static String GOOGLE_REDIRECT_URI = "http://localhost:8080/Edit/Loging/Google";
    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
    public static String GOOGLE_GRANT_TYPE = "authorization_code";


    public static String FACEBOOK_APP_ID = "515625173274802";
    public static String FACEBOOK_APP_SECRET = "823031fd00ef84d519ce4826e472de2d";
    public static String FACEBOOK_REDIRECT_URL = "http://localhost:8080/Edit/Loging/Facebook";
    public static String FACEBOOK_LINK_GET_TOKEN = "https://graph.facebook.com/oauth/access_token?client_id=%s&client_secret=%s&redirect_uri=%s&code=%s";
    public static String FACEBOOK_LINK_GET_USER_INFO = "https://graph.facebook.com/me?access_token=";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }

        switch (path) {
            case "/Google":
                try {
                    String code=request.getParameter("code");
                    String accessToken=  getToken(code);
                    AccountGG usergg = getUserInfo(accessToken);
                    List<Tag> list = TagModel.findAll();
                    String messGg = "Bạn không được sửa đổi thông tin do chính sách của Google";
                    request.setAttribute("tags", list);
                    HttpSession session = request.getSession();
                    session.setAttribute("authGg", true);
                    session.setAttribute("messGg", messGg);
                    session.setAttribute("authUserGg",usergg);;
                    List<Category> lisAllCate = CategoryModel.findAllIn();
                    List<Category> list5cate  = CategoryModel.find5Cate();
                    session.setAttribute("list5cate",list5cate);
                    session.setAttribute("lisAllCate",lisAllCate);
                    session.setMaxInactiveInterval(6000);
                    String url = "/Home";
                    ServletUtils.forward(url,request,response);
                }
                catch (Exception e)
                {
                    e.printStackTrace();
                }
                break;
            case "/Facebook":
                try{
                    String code = request.getParameter("code");
                    String avatar="https://static2.yan.vn/YanNews/2167221/202102/facebook-cap-nhat-avatar-doi-voi-tai-khoan-khong-su-dung-anh-dai-dien-e4abd14d.jpg";
                    String accessToken = getTokenFace(code);
                    AccountFace user = getUserInfoFace(accessToken);
                    List<Tag> list = TagModel.findAll();
                    HttpSession session = request.getSession();
                    List<Category> lisAllCate = CategoryModel.findAllIn();
                    List<Category> list5cate  = CategoryModel.find5Cate();
                    session.setAttribute("list5cate",list5cate);
                    session.setAttribute("lisAllCate",lisAllCate);
                    session.setMaxInactiveInterval(6000);
                    session.setAttribute("auth", true);
                    session.setAttribute("authUser",user);;
                    String url = "/Home";
                    ServletUtils.forward(url,request,response);
                }
                catch (Exception e)
                {
                    e.printStackTrace();
                }
                break;
            case "/Email":
              try {
                  String email =request.getParameter("email");
                  String otp = UserModel.getOtp(email);
                  User uForgot = UserModel.getNameUserByEmail(email);
                  String name = uForgot.getName();
                  StringBuilder content = new StringBuilder();
                  content.append("Dear ").append(name).append("\n");
                  content.append("Bạn đã lựa chọn mail  ").append(email).append(" để xác nhận mật khẩu của mình. ");
                  content.append("Mã xác thực OTP của bạn là:").append("\n");
                  content.append(otp).append("\n");
                  content.append("Xin vui lòng nhập chính xác mã OTP. Nếu có gì thắc mắc xin vui lòng liên hệ Email: ngochai06122002@gmail.com");
                  UserModel.sendMailToEmail(email,content.toString());
                  request.setAttribute("email",email);
                  request.getRequestDispatcher("/views/viewHome/OTP.jsp").forward(request,response);
              }
              catch (Exception e)
              {

                  e.printStackTrace();
              }
                break;
            case "/OTP":
             try{
                 String email =request.getParameter("email");
                 String Otp = request.getParameter("OTP");
                 Boolean check = UserModel.checkOtp(Otp,email);
                 if(check == true)
                 {
                     request.setAttribute("email",email);
                     request.getRequestDispatcher("/views/viewHome/ResetPass.jsp").forward(request,response);
                 }
                 else{
                     String note= "Sai OTP vui lòng nhập lại Email.";
                     request.setAttribute("mess",note);
                     request.getRequestDispatcher("/views/viewHome/ForgotPass.jsp").forward(request,response);
                 }
             }
             catch (Exception e)
             {
                 e.printStackTrace();
             }
                break;
            case "/Reset":
                try{
                    String email =request.getParameter("email");
                    String pass =request.getParameter("pass");
                    String confirm = request.getParameter("confirm");
                    User change= UserModel.findByEmail(email);
                    if(!pass.equals(confirm))
                    {
                        String mess= "Nhập lại mật khẩu không đúng.";
                        request.setAttribute("mess",mess);
                        request.setAttribute("email",email);
                        request.getRequestDispatcher("/views/viewHome/ResetPass.jsp").forward(request,response);
                    }
                    else
                    {
                        String mess= "Thay đổi thành công. Xin vui lòng đăng nhập";
                        String bcryptHashString = BCrypt.withDefaults().hashToString(12, pass.toCharArray());
                        UserModel.edit(bcryptHashString,email);
                        request.setAttribute("mess",mess);
                        request.getRequestDispatcher("/views/viewHome/ResetPass.jsp").forward(request,response);
                    }
                }
                catch (Exception e)
                {
                    e.printStackTrace();
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
    public String getToken(String code) throws ClientProtocolException, IOException {
        String response = Request.Post(GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", GOOGLE_CLIENT_ID)
                        .add("client_secret", GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", GOOGLE_GRANT_TYPE).build())
                .execute()
                .returnContent()
                .asString();

        ObjectMapper mapper = new ObjectMapper();
        JsonNode node = mapper.readTree(response).get("access_token");
        return node.textValue();
    }

    public AccountGG getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        ObjectMapper mapper = new ObjectMapper();
        AccountGG AccountGoogle = mapper.readValue(response, AccountGG.class);
        return AccountGoogle;
    }
    public static AccountFace getUserInfoFace(String accessToken) {
        FacebookClient facebookClient = new DefaultFacebookClient(accessToken, FACEBOOK_APP_SECRET, Version.LATEST);
        return facebookClient.fetchObject("me", AccountFace.class);
    }


    public String getTokenFace(final String code) throws ClientProtocolException, IOException {
        String link = String.format(FACEBOOK_LINK_GET_TOKEN, FACEBOOK_APP_ID, FACEBOOK_APP_SECRET, FACEBOOK_REDIRECT_URL, code);
        String response = Request.Get(link).execute().returnContent().asString();
        ObjectMapper mapper = new ObjectMapper();
        JsonNode node = mapper.readTree(response).get("access_token");
        return node.textValue();
    }
}
