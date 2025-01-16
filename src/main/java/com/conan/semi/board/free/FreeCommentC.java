package com.conan.semi.board.free;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/FreeCommentsC")
public class FreeCommentC extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        FreeCommentDAO.showAllComment(request);
       // FreeCommentDAO.addComment(request);
        request.setAttribute("free_comments", "board_free_comments");
        request.getRequestDispatcher("jsp/board/board_free/board_free/board_free_detail.jsp").forward(request, response);

    }
}