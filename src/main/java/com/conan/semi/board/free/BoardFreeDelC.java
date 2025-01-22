package com.conan.semi.board.free;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/BoardFreeDelC")
public class BoardFreeDelC extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BoardFreeDAO.showAllBoardFree(request);

        BoardFreeDAO.delBoardFree(request);
        response.sendRedirect("/BoardHC");

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
