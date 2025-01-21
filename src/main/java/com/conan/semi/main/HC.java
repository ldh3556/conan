package com.conan.semi.main;


import com.conan.semi.login.LoginDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/HC")
public class HC extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LoginDAO.loginCheck(request);
        request.setAttribute("loginPage","index_loginOK.jsp");
        request.getRequestDispatcher("index.jsp").forward(request, response);
        // request.getRequestDispatcher("jsp/main_HDH.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
