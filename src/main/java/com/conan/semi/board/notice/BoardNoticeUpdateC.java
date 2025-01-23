package com.conan.semi.board.notice;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/BoardNoticeUpdateC")
public class BoardNoticeUpdateC extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        BoardNoticeDAO.detailBoardFree(request);
request.setAttribute("content", "board_notice/board_notice_update.jsp");
request.getRequestDispatcher("jsp/board/board.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        BoardNoticeDAO.updatBoardFree(request);
        response.sendRedirect("BoardNoticeC");

    }

}
