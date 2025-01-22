package com.conan.semi.board.movie;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/MovieCommentDelC")
public class MovieCommentDelC extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.setCharacterEncoding("utf-8");
String b_no = request.getParameter("b_no");
System.out.println(b_no);
        MovieCommentDAO.deleteComment(request);
response.sendRedirect("/BoardMovieDetailC?no="+b_no);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
