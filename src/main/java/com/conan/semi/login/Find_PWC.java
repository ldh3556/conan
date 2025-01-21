package com.conan.semi.login;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Find_PWC")
public class Find_PWC extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.getRequestDispatcher("jsp/login/login_find_pw_input.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    // 비밀번호 찾기
    FindDAO.findPW(request);

    // 어디로?
    request.getRequestDispatcher("jsp/login/login_find_pw_output.jsp").forward(request, response);
    }
}
