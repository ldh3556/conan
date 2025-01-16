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
        // 우승곡에 해당하는 정보를 songDetails에서 찾기
        String songTitle = request.getParameter("songTitle");
        String songDescription = request.getParameter("songDescription");
        // 필요한 추가 정보가 있다면 여기에 저장
        request.setAttribute("songTitle", songTitle);
        request.setAttribute("songDescription", songDescription);
        // DAO로 우승곡 정보 전달하여 우승 횟수 업데이트
        OstDAO.winCount(request);
        request.getRequestDispatcher("jsp/vote/ost/ost_result.jsp").forward(request, response);
        response.sendRedirect("jsp/vote/ost/ost_result.jsp");
    }
}
