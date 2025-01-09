package com.conan.semi.account;

import com.conan.semi.login.LoginDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AccountC")
public class AccountC extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // 계정 생성
    AccountDAO.regUser(request);

    // 어디로? => 로그인 페이지로
    request.getRequestDispatcher("login.html").forward(request, response);
    }

}
