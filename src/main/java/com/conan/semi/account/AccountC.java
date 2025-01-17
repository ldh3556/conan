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
        // 어디로?
        request.getRequestDispatcher("jsp/account/account.jsp").forward(request, response);
        System.out.println("AccountC_test(GET)에서 등록 완료!");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        // 계정 생성
        AccountDAO.regUser(request);
        System.out.println("AccountC(POST)에서 등록 완료!");
        // 어디로?
        request.getRequestDispatcher("jsp/main_HDH.jsp").forward(request, response);
    }
}
