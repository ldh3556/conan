package com.conan.semi.encyclop;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.conan.semi.encyclop.CharacterDAO.*;

@WebServlet("/CharacterListC")
public class CharacterListC extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1) DAO 호출 -> request에 'characters' 속성으로 데이터 저장
        CharacterDAO.selectCharacterList(request);

        // 2) JSP로 포워딩
        request.getRequestDispatcher("/jsp/character/character.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}