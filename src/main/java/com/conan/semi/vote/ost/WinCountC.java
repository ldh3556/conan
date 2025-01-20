package com.conan.semi.vote.ost;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/winCountC")
public class WinCountC extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 요청 인코딩 설정 (POST 데이터가 UTF-8로 전달된다고 가정)
        request.setCharacterEncoding("UTF-8");

        // 응답 인코딩 설정
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        // 1. 우승곡 정보 처리 (POST 요청에서 받은 데이터)
        String songTitle = request.getParameter("songTitle");
        String selectedFSongPK = request.getParameter("selectedFSongPK");

        String songDescription = request.getParameter("songDescription");

        // 2. DAO 호출하여 우승 횟수 업데이트
        OstDAO.winCount(request); // 우승 횟수 업데이트

        // 3. 우승곡 정보 세션에 저장 (결과 페이지에서 사용할 수 있도록)
        request.getSession().setAttribute("selectedFSongPK", selectedFSongPK);
        request.getSession().setAttribute("songTitle", songTitle);
        request.getSession().setAttribute("songDescription", songDescription);

        // 4. DB에서 우승곡 목록 가져오기
        //OstDAO.getAllResult(request);

        // 5. 결과 페이지로 리다이렉트 (별도 컨트롤러로)
        response.sendRedirect("/regCommentC"); // 'resultController'로 리다이렉트
    }
}
