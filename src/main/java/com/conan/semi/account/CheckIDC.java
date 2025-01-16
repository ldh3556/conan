package com.conan.semi.account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/CheckIDC")
public class CheckIDC extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 무슨 일? -> 아이디 중복확인
        String result = AccountDAO.checkIdExists(request);

        // 응답을 텍스트 형식으로 클라이언트에게 반환
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");

        // 결과를 응답으로 전송
        response.getWriter().write(result);
        System.out.println("CheckIDC(GET)에서 중복 확인 완료: " + result);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
