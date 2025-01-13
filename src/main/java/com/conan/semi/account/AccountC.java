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
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 무슨 일? -> 계정 생성
        AccountDAO.regUser(request);

        // 아이디나 닉네임이 중복된 경우, JSP로 포워딩하여 오류 메시지 표시
        if (request.getAttribute("idExists") != null || request.getAttribute("nicknameExists") != null) {
            request.getRequestDispatcher("jsp/account/account.jsp").forward(request, response);
        } else {
            // 계정이 성공적으로 생성되었을 때
            response.sendRedirect("jsp/login/login.jsp");  // 예: 로그인 페이지로 리디렉션
        }
    }
}
