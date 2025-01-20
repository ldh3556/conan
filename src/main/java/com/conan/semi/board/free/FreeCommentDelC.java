package com.conan.semi.board.free;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/FreeCommentDelC")
public class FreeCommentDelC extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("utf-8");
String b_no = request.getParameter("b_no");
System.out.println(b_no);
        FreeCommentDAO.deletecomment(request);
response.sendRedirect("/BoardFreeDetailC?no="+b_no);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
