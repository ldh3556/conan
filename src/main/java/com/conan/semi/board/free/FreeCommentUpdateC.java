package com.conan.semi.board.free;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;


@WebServlet("/FreeCommentUpdateC")
public class FreeCommentUpdateC extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

request.setCharacterEncoding("utf-8");

        FreeCommentDAO.updateComment(request);

        // 성공 상태 전송
        response.setStatus(HttpServletResponse.SC_OK);
    }
}

