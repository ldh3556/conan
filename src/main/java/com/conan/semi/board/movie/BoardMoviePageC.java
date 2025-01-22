package com.conan.semi.board.movie;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/BoardMoviePageC")
public class BoardMoviePageC extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    BoardMovieDAO.showAllBoardFree(request);
    int p = Integer.parseInt(request.getParameter("p"));
    BoardMovieDAO.pagingFreeBoard(p, request);

    request.setAttribute("content", "board_movie/board_movie.jsp");
    request.getRequestDispatcher("jsp/board/board.jsp").forward(request, response);


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
