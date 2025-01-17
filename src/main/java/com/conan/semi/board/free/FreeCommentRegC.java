package com.conan.semi.board.free;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/FreeCommentRegC")
public class FreeCommentRegC extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String b_no = request.getParameter("no");
        request.setCharacterEncoding("utf-8");
        FreeCommentDAO.addComment(request);
       response.sendRedirect("BoardFreeDetailC?no=" + b_no);

         }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      FreeCommentDAO.addComment(request);
        FreeCommentDAO.showAllComment(request);
        request.setAttribute("content", "board_free/board_free_detail.jsp");
        request.getRequestDispatcher("jsp/board/board.jsp").forward(request, response);

    }
}

