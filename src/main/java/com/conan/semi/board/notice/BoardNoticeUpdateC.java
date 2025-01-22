package com.conan.semi.board.anime;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/BoardAnimeUpdateC")
public class BoardAnimeUpdateC extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        BoardAnimeDAO.detailBoardFree(request);
request.setAttribute("content", "board_anime/board_anime_update.jsp");
request.getRequestDispatcher("jsp/board/board.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        BoardAnimeDAO.updatBoardFree(request);
        response.sendRedirect("BoardAnimeC");

    }

}
