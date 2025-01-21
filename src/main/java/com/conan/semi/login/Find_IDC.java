package com.conan.semi.login;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Find_IDC")
public class Find_IDC extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.getRequestDispatcher("jsp/login/login_find_id_input.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("utf-8");
    // 아이디 찾기
    FindDAO.findID(request);

    // 어디로?
    request.getRequestDispatcher("jsp/login/login_find_id_output.jsp").forward(request, response);
    }
}
