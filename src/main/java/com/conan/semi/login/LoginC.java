package com.conan.semi.login;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/LoginC")
public class LoginC extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("jsp/login/login_input.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // 로그인
    LoginDAO.login(request);

    // 어디로?
    LoginDAO.loginCheck(request);

    // request.setAttribute("loginPage","index_loginOK.jsp"); 로그인체크(아이디 비번 빈칸으로 제출) 이후 보내면 안되지~
    request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
