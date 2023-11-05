package com.example.edit.filter;


import com.example.edit.Utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "AuthSession")
public class AuthSession implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpSession session = request.getSession();
        boolean auth = (boolean) session.getAttribute("auth");
        if(auth == false)
        {
            //session.setAttribute("retUrl", request.getRequestURI());
            ServletUtils.redirect("/User/Login",request, (HttpServletResponse) res );
            return;
        }
        chain.doFilter(req,res);
    }
}
