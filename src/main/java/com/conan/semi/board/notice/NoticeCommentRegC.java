package com.conan.semi.board.notice;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/NoticeCommentRegC")
public class NoticeCommentRegC extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String b_no = request.getParameter("no");
        request.setCharacterEncoding("utf-8");
        NoticeCommentDAO.addComment(request);
       response.sendRedirect("BoardNoticeDetailC?no=" + b_no);

         }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      NoticeCommentDAO.addComment(request);
        NoticeCommentDAO.showAllComment(request);
        request.setAttribute("content", "board_notice/board_notice_detail.jsp");
        request.getRequestDispatcher("jsp/board/board.jsp").forward(request, response);

    }
}

