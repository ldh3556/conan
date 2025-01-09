package com.conan.semi.board.main;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/BoardHC")
public class BoardHC {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 request.setAttribute("content", "board_free.jsp");
 request.getRequestDispatcher("board.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}