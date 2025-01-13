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
        AccountDAO_test3.checkIdExists(request);
        System.out.println("CheckIDC(GET)에서 등록 완료!");
        // 어디로?
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
