package com.conan.semi.board.anime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/AnimeCommentUpdateC")
public class AnimeCommentUpdateC extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

request.setCharacterEncoding("utf-8");

        AnimeCommentDAO.updateComment(request);

        // 성공 상태 전송
        response.setStatus(HttpServletResponse.SC_OK);
    }
}

