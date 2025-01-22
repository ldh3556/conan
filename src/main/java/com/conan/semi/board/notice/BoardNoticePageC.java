package com.conan.semi.board.notice;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/BoardNoticePageC")
public class BoardNoticePageC extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    BoardNoticeDAO.showAllBoardFree(request);
    int p = Integer.parseInt(request.getParameter("p"));
    BoardNoticeDAO.pagingFreeBoard(p, request);

    request.setAttribute("content", "board_notice/board_notice.jsp");
    request.getRequestDispatcher("jsp/board/board.jsp").forward(request, response);


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
