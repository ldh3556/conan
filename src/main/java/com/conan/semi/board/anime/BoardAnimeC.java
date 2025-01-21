package com.conan.semi.board.anime;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/BoardAnimeC")
public class BoardAnimeC extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
        BoardAnimeDAO.showAllBoardFree(request);
        BoardAnimeDAO.pagingFreeBoard(1, request);
request.setAttribute("content", "board_anime.jsp");
request.getRequestDispatcher("jsp/board/board_anime/board_anime.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
