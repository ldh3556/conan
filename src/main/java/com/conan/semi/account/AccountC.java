package com.conan.semi.account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AccountC")
public class AccountC extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 어디로? (계정 생성 폼 페이지로)
        request.getRequestDispatcher("jsp/account/account.jsp").forward(request, response);
        System.out.println("AccountC(GET)에서 계정 생성 폼 페이지로!");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        // 계정 생성
        AccountDAO.regUser(request);
        System.out.println("AccountC(POST)에서 계정 생성 완료!");

        // 계정 생성 후, 성공 여부에 따라 리다이렉트
        response.sendRedirect("index.jsp");  // 성공 후 홈 페이지로 리다이렉트
        System.out.println("AccountC(POST)에서 등록 완료!");
    }
}