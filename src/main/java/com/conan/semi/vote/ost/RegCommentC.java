package com.conan.semi.vote.ost;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/regCommentC")
public class RegCommentC extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("jsp/vote/ost/ost_result.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 요청 인코딩 설정 (POST 데이터가 UTF-8로 전달된다고 가정)
        request.setCharacterEncoding("UTF-8");

        // 댓글 내용 받기
        String commentText = request.getParameter("comment");

        // 댓글 등록 처리 (DAO 메서드 호출)
        OstDAO.registComments(request);  // 댓글 등록

        // JSON 형식의 응답을 전송 (클라이언트에서 success 콜백 처리)
        response.setContentType("application/json;charset=UTF-8");
//        PrintWriter out = response.getWriter();
//        out.print("{\"status\": \"success\"}");
//        out.flush();
    }
}