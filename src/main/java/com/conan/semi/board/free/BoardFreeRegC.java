package com.conan.semi.board.free;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/BoardFreeRegC")
public class BoardFreeRegC extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

request.setAttribute("content", "board_free/board_free_reg.jsp");
request.getRequestDispatcher("jsp/board/board.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BoardFreeDAO.addBoardFree(request);
        response.sendRedirect("BoardFreeC");
    }

}
