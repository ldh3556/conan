package com.conan.semi.board.anime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AnimeCommentRegC")
public class AnimeCommentRegC extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String b_no = request.getParameter("no");
        request.setCharacterEncoding("utf-8");
        AnimeCommentDAO.addComment(request);
       response.sendRedirect("BoardAnimeDetailC?no=" + b_no);

         }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      AnimeCommentDAO.addComment(request);
        AnimeCommentDAO.showAllComment(request);
        request.setAttribute("content", "board_anime/board_anime_detail.jsp");
        request.getRequestDispatcher("jsp/board/board.jsp").forward(request, response);

    }
}

