package com.conan.semi.encyclop;

import com.conan.semi.DBManager;
import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CharacterDAO {

    public static void selectCharacterList(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM characters_test_nr";

        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            // 여러 레코드를 담을 리스트 준비
            List<CharacterDTO> charList = new ArrayList<>();

            while (rs.next()) {
                CharacterDTO dto = new CharacterDTO();
                dto.setId(rs.getLong("id"));
                dto.setName(rs.getString("name"));
                dto.setAge(rs.getString("age"));
                dto.setQuote(rs.getString("quote"));
                dto.setDescription(rs.getString("description"));
                dto.setButtonImage(rs.getString("button_image"));
                dto.setMainImage(rs.getString("main_image"));

                charList.add(dto);
            }

            // JSP에서 사용하기 위해 request에 저장
            request.setAttribute("characters", charList);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, rs);
        }
    }
}
