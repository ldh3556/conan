package com.conan.semi.login;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/MyPage_Edit_AccountC")
public class MyPage_Edit_AccountC extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
//        // 어디로? -> 회원정보 수정할 [정보 입력 페이지]로 이동
        request.getRequestDispatcher("jsp/login/login_edit_account_input.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        // 회원정보 수정
        EditDAO.editAccount(request);

        // 어디로?
        request.getRequestDispatcher("jsp/login/login_myPage.jsp").forward(request, response);
    }
}
