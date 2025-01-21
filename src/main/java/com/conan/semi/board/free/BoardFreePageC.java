package com.conan.semi.board.free;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/BoardFreePageC")
public class BoardFreePageC extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    BoardFreeDAO.showAllBoardFree(request);
    int p = Integer.parseInt(request.getParameter("p"));
    BoardFreeDAO.pagingFreeBoard(p, request);

    request.setAttribute("content", "board_free/board_free.jsp");
    request.getRequestDispatcher("jsp/board/board.jsp").forward(request, response);


    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
