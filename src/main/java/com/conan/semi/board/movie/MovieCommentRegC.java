package com.conan.semi.board.movie;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/MovieCommentRegC")
public class MovieCommentRegC extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String b_no = request.getParameter("no");
        request.setCharacterEncoding("utf-8");
        MovieCommentDAO.addComment(request);
       response.sendRedirect("BoardMovieDetailC?no=" + b_no);

         }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      MovieCommentDAO.addComment(request);
        MovieCommentDAO.showAllComment(request);
        request.setAttribute("content", "board_movie/board_movie_detail.jsp");
        request.getRequestDispatcher("jsp/board/board.jsp").forward(request, response);

    }
}

