package com.conan.semi.encyclop;
import com.conan.semi.login.LoginDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/CharacterListC")
public class CharacterListC extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CharacterDAO characterDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        characterDAO = new CharacterDAO(); // DAO 인스턴스 생성
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 파라미터 추출
        String category = request.getParameter("category");
        String sortOption = request.getParameter("sortOption");

        // 기본값 설정
        if (category == null || category.isEmpty()) {
            category = "all"; // '전체'를 의미
        }
        if (sortOption == null) {
            sortOption = "";
        }

        // 선택된 카테고리 이름과 캐릭터 목록 조회
        String currentCategoryName;
        List<CharacterDTO> characterList;

        if ("all".equals(category)) {
            currentCategoryName = "모든 캐릭터";
            characterList = characterDAO.getCharacters("all", sortOption); // 모든 캐릭터 조회
        } else {
            int categoryId;
            try {
                categoryId = Integer.parseInt(category); // 카테고리 ID를 정수로 변환
            } catch (NumberFormatException e) {
                throw new ServletException("Invalid category ID format", e);
            }

            currentCategoryName = characterDAO.getCategoryNameById(categoryId); // 카테고리 이름 조회
            if (currentCategoryName == null) {
                throw new ServletException("Category not found for ID: " + categoryId);
            }
            characterList = characterDAO.getCharactersByCategory(categoryId, sortOption); // 카테고리별 캐릭터 조회
        }

        // JSP에 데이터 전달
        request.setAttribute("characterList", characterList);
        request.setAttribute("currentCategory", category);
        request.setAttribute("currentCategoryName", currentCategoryName);
        request.setAttribute("currentSortOption", sortOption);

        // JSP로 포워딩
        LoginDAO.loginCheck2(request);
        request.getRequestDispatcher("/jsp/encyclop/character.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // POST 요청도 doGet으로 처리
        doGet(request, response);
    }
}

