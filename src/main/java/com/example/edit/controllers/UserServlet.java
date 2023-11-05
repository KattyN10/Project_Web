package com.example.edit.controllers;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.example.edit.Utils.ServletUtils;
import com.example.edit.beans.User;
import com.example.edit.models.UserModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

@WebServlet(name = "UserServlet", value = "/User/*")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        switch (path) {
            case "/Index":
                ServletUtils.forward("/views/ViewUser/Index.jsp",request,response);
                break;
            case "/Register":
                ServletUtils.forward("/views/ViewUser/Register.jsp",request,response);
                break;
            case "/IsAvailable":
                String username = request.getParameter("user");
                boolean isAvailable = UserModel.checkByUserName(username);

                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("utf-8");

                out.print(isAvailable);
                out.flush();
                break;
            case "/Login":
                ServletUtils.forward("/views/ViewUser/Login.jsp",request,response);
                break;
            case "/EditProfile":
                ServletUtils.forward("/views/ViewUser/EditProfile.jsp",request,response);
                break;
            case "/EditAcc":
                ServletUtils.forward("/views/ViewUser/EditAcc.jsp",request,response);
                break;
            case "/Extend":
                ServletUtils.forward("/views/ViewUser/Extend.jsp",request,response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        switch (path) {
            case "/Register":
                registerUser(request, response);
                break;
            case "/Login":
                login(request,response);
                break;
            case "/Logout":
                logout(request,response);
                break;
            case "/EditProfile":
                editUser(request,response);
                break;
            case "/EditAcc":
                editAcc(request,response);
                break;
            case "/UpdatePre":
                editPre(request,response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }
    private static java.sql.Date getCurrentDate() {
        Date today = new Date();
        return new java.sql.Date(today.getTime());
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = UserModel.findByUsername(username);
        //boolean check = UserModel.checkByUserName(username);
        if(user != null)
        {
            BCrypt.Result result = BCrypt.verifyer().verify(password.toCharArray(), user.getPassword());
            if(result.verified)
            {
                // Bật giá trị session
                HttpSession session = request.getSession();
                int Ex = user.getUserId();
                if (UserModel.checkEx(Ex) == true)
                {
                    session.setAttribute("checkEx", true);
                }
                else
                {
                    session.setAttribute("checkEx", false);
                }

                if (UserModel.checkAccPre(Ex) == true)
                {
                    session.setAttribute("checkAccPre", true);
                }
                else
                {
                    session.setAttribute("checkAccPre", false);
                }
                session.setAttribute("auth", true);
                session.setAttribute("authUser",user);;
                String url = "/Home";
                ServletUtils.redirect(url,request,response);
            }
            else
            {
                request.setAttribute("hasError",true);
                request.setAttribute("errorMessage","Username or password is incorrect");
                ServletUtils.forward("/views/ViewUser/Login.jsp",request,response);
            }
        }
        else
        {
            request.setAttribute("hasError",true);
            request.setAttribute("errorMessage","Username or password is incorrect");
            ServletUtils.forward("/views/ViewUser/Login.jsp",request,response);
        }
    }
    private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("auth",false);
        session.setAttribute("authUser",new User());
        session.setAttribute("authGg", false);
        session.removeAttribute("authUserGg");
        session.removeAttribute("checkAccPre");
        session.removeAttribute("checkEx");
        session.removeAttribute("checkEx");
        String url="/Home";
        ServletUtils.redirect(url,request,response);
    }
    private void registerUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String rawpwd = request.getParameter("pass");

        String bcryptHashString = BCrypt.withDefaults().hashToString(12, rawpwd.toCharArray());

        String strDate = request.getParameter("dateofbirth");
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate date_of_birth = LocalDate.parse(strDate, df);

        String second_name = request.getParameter("namesecond");

        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        LocalDate issue_at = LocalDate.now();
        int otpExp = (int) Math.floor(((Math.random() * 899999) + 100000));
        int expiration = 7;
        int roleId = 2;

        User user = new User(0,username,bcryptHashString,name,issue_at,expiration,roleId,second_name,date_of_birth,email,otpExp,otpExp);
        UserModel.add(user);
        ServletUtils.forward("/views/ViewUser/Register.jsp", request, response);
    }
    private void editUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String secondName = request.getParameter("secondName");
        String email = request.getParameter("email");


        String strDate = request.getParameter("birthDay");
        DateTimeFormatter df = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate date_of_birth = LocalDate.parse(strDate, df);

        HttpSession session = request.getSession();


        User edit = (User) session.getAttribute("authUser");
        if(edit.getRole_id() != 3 )
        {
            secondName = edit.getSecond_name();
        }
        BCrypt.Result result = BCrypt.verifyer().verify(edit.getPassword().toCharArray(), edit.getPassword());
        UserModel.editUser(edit.getUserId(),name,email,date_of_birth,secondName);
        session.setAttribute("auth", true);
        session.setAttribute("authUser",new User(edit.getUserId(),edit.getUsername(),edit.getPassword(),name,edit.getIssueAt(),edit.getExpiration(),edit.getRole_id(),secondName,date_of_birth,email,edit.getOtp(),edit.getOtp_exp(), edit.isPremium()));
        ServletUtils.forward("/views/ViewUser/Index.jsp", request, response);
    }
    private void editAcc(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String bcryptHashString = BCrypt.withDefaults().hashToString(12, password.toCharArray());
        HttpSession session = request.getSession();
        User edit = (User) session.getAttribute("authUser");
        UserModel.editAcc(edit.getUserId(),bcryptHashString,username);
        User a = UserModel.findById(edit.getUserId());
        session.setAttribute("auth", true);
        session.setAttribute("authUser",new User(edit.getUserId(),username,bcryptHashString,edit.getName(),edit.getIssueAt(),edit.getExpiration(),edit.getRole_id(),edit.getSecond_name(),edit.getDateOfBirth(),edit.getEmail(),edit.getOtp(),edit.getOtp_exp(),edit.isPremium()));
        ServletUtils.forward("/views/ViewUser/Index.jsp", request, response);
    }
    private void editPre(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String txt = request.getParameter("txt");
        String email = request.getParameter("email");
        User uRes = UserModel.getNameUserByEmail(email);
        String name = uRes.getName();
        StringBuilder content = new StringBuilder();
        content.append("Dear ").append(uRes.getName()).append("\n");
        content.append("Cảm ơn khách hàng đã gia hạn tài khoản của mình. Với email ").append(email).append(". Chúng tôi đã kiểm tra giao dịch. Với số tài khoản ")
                .append(txt).append("\n");
        content.append("Tài khoản của quý được gia hạn 7 ngày để từ ngày gia hạn ").append(getCurrentDate()).append("\n");
        content.append("Nếu có gì thắc mắc xin vui lòng liên hệ Email: ngochai06122002@gmail.com");
        UserModel.sendMailToEmailConfirm(email, content.toString());
        request.setAttribute("email", email);
        HttpSession session = request.getSession();
        LocalDate date = LocalDate.now();
        User edit = (User) session.getAttribute("authUser");
        UserModel.editAccPre(edit.getUserId(),date);
        int Ex = edit.getUserId();
        if (UserModel.checkEx(Ex) == true)
        {
            session.setAttribute("checkEx", true);
        }
        else
        {
            session.setAttribute("checkEx", false);
        }
        if (UserModel.checkAccPre(Ex) == true)
        {
            session.setAttribute("checkAccPre", true);
        }
        else
        {
            session.setAttribute("checkAccPre", false);
        }
        session.setAttribute("auth", true);
        session.setAttribute("authUser",new User(edit.getUserId(),edit.getUsername(),edit.getPassword(),edit.getName(),date,edit.getExpiration(),edit.getRole_id(),edit.getSecond_name(),edit.getDateOfBirth(),edit.getEmail(),edit.getOtp(),edit.getOtp_exp(),edit.isPremium()));
        ServletUtils.forward("/views/ViewUser/Index.jsp", request, response);
    }
}
