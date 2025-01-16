package com.conan.semi.vote;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Rank_manC")
public class Rank_manC extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 우승자 정보 저장
        RankDAO.manrank(request);

        // JSON 응답 반환
        response.setContentType("application/json");
        response.getWriter().write("{\"status\":\"success\", \"winnerName\":\"" + request.getAttribute("winnerName") + "\", \"winnerImageURL\":\"" + request.getAttribute("winnerImageURL") + "\"}");
    }
}