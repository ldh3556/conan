package com.conan.semi.board.anime;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/BoardAnimePageC")
public class BoardAnimePageC extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    BoardAnimeDAO.showAllBoardFree(request);
    int p = Integer.parseInt(request.getParameter("p"));
    BoardAnimeDAO.pagingFreeBoard(p, request);

    request.setAttribute("content", "board_free/board_anime.jsp");
    request.getRequestDispatcher("jsp/board/board.jsp").forward(request, response);


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
