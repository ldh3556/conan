package com.conan.semi.board.free;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/BoardFreeDetailC")
public class BoardFreeDetailC extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 BoardFreeDAO.detailBoardFree(request);
 FreeCommentDAO.showAllComment(request);

 request.getRequestDispatcher("jsp/board/board.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
