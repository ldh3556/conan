package com.conan.semi.cfhdh;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/Vote_worldcupC0")
public class Vote_worldcupC0 extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 이미지 경로를 세션에 저장
        String imagePath = "/img/vote/worldcup/men/";
        request.getSession().setAttribute("imagePath", imagePath);

        // 현재 라운드, 선택된 사진들을 가져옵니다.
        List<VoteDTO0> selectedPhotos = (List<VoteDTO0>) request.getSession().getAttribute("selectedPhotos");
        int round = (int) request.getSession().getAttribute("round");
        int totalSelections = (int) request.getSession().getAttribute("totalSelections");

        // 라운드가 끝나면 결과 페이지로 리다이렉트
        if (selectedPhotos == null || selectedPhotos.size() <= 1) {
            response.sendRedirect("result.jsp"); // 결과 페이지로 리다이렉트
            return;
        }

        // 사용자가 선택한 사진을 가져옵니다. (name1, name2는 선택된 후보들의 이름)
        String selectedPhoto = request.getParameter("selectedPhoto");

        // 선택된 사진에 따라 다음 라운드 준비
        if (selectedPhoto != null) {
            // 선택된 사진은 selectedPhoto와 비교해서 매칭을 업데이트합니다.
            updateRound(selectedPhotos, selectedPhoto, totalSelections);
        }

        // 라운드가 끝난 후 다음 라운드로 진행
        if (selectedPhotos.size() == 1) {
            response.sendRedirect("result.jsp"); // 마지막 1명만 남으면 결과 페이지로
        } else {
            // 다음 라운드를 위한 사진 2개를 선택해서 세션에 저장
            request.getSession().setAttribute("selectedPhotos", selectedPhotos);
            request.getSession().setAttribute("round", round + 1);
            request.getSession().setAttribute("totalSelections", totalSelections / 2);
            // 서블릿에서 selectedPhotos를 request에 속성으로 넘겨서 JSP로 전달
            request.setAttribute("selectedPhotos", selectedPhotos);
            request.getRequestDispatcher("vote_0.jsp").forward(request, response); // 투표 페이지로 포워딩
        }
    }

    // 선택된 사진을 리스트에서 제거하고, 선택된 후보를 남겨둡니다.
    private void updateRound(List<VoteDTO0> selectedPhotos, String selectedPhoto, int totalSelections) {
        // 선택된 사진을 기준으로, 선택한 항목을 리스트에서 제거
        VoteDTO0 selected = null;
        for (VoteDTO0 photo : selectedPhotos) {
            if (photo.getName().equals(selectedPhoto)) {
                selected = photo;
                break;
            }
        }

        if (selected != null) {
            selectedPhotos.remove(selected); // 선택된 사진을 리스트에서 제거
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
