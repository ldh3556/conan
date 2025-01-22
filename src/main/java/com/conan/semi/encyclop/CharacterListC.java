package com.conan.semi.encyclop;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import static com.conan.semi.encyclop.CharacterDAO.*;

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

        // DAO를 통해 캐릭터 목록 조회
        List<CharacterDTO> characterList = characterDAO.getCharacters(category, sortOption);

        // JSP에 데이터 전달
        request.setAttribute("characterList", characterList);
        request.setAttribute("currentCategory", category);
        request.setAttribute("currentSortOption", sortOption);

        // JSP로 포워딩
        request.getRequestDispatcher("/jsp/character/character.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // POST 요청도 doGet으로 처리
        doGet(request, response);
    }
}