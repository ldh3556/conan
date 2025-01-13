package com.conan.semi.board.main;


import com.conan.semi.board.free.BoardFreeDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/BoardHC")
public class BoardHC extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BoardFreeDAO.showAllBoardFree(request);

        request.setAttribute("content", "board_free/board_free.jsp");
 request.getRequestDispatcher("jsp/board/board.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
