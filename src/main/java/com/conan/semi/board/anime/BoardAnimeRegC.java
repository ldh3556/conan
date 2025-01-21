package com.conan.semi.board.anime;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/BoardAnimeRegC")
public class BoardAnimeRegC extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

request.setAttribute("content", "board_free/board_anime_reg.jsp");
request.getRequestDispatcher("jsp/board/board.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BoardAnimeDAO.addBoardFree(request);
        response.sendRedirect("BoardAnimeC");
    }

}
