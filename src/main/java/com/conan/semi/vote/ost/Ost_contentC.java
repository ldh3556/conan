package com.conan.semi.vote.ost;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ost_contentC")
public class Ost_contentC extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        OstDAO.loginJudge(request);
//        OstDAO.getBracket(request);
//        request.getRequestDispatcher("/jsp/vote/ost/ost_content.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. 로그인 정보 가져오기
        String insertedId = request.getParameter("id");
        String insertedPw = request.getParameter("pw");
        // 2. 로그인 처리
        String result = OstDAO.loginJudge(request, insertedId, insertedPw);  // 로그인 확인
        // 대진표 DB 불러오기
        OstDAO.getBracket(request);

        // 3. 로그인 결과에 따른 처리
        if ("로그인 성공".equals(result)) {
            // 4. 로그인 성공 시 세션에 사용자 정보 저장
            request.getSession().setAttribute("userId", insertedId);  // 세션에 사용자 정보 저장
            request.getSession().setAttribute("userPw", insertedPw);
            // 5. 로그인 성공 후 다음 페이지로 이동
            request.getRequestDispatcher("jsp/vote/ost/ost_content.jsp").forward(request, response);
        } else {
            // 6. 로그인 실패 시 다시 로그인 페이지로 리다이렉트
            response.sendRedirect("jsp/vote/ost/ost_main.jsp");  // 로그인 페이지로 리다이렉트
        }
    }

}
