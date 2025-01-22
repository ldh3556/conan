package com.conan.semi.encyclop;
import com.conan.semi.DBManager;
import javax.servlet.http.HttpServletRequest;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class CharacterDAO {

    public static void CharacterDAO(HttpServletRequest request) {
    }

    /**
     * 카테고리와 정렬 옵션에 따라 캐릭터 목록을 조회하는 메서드
     *
     * @param category   조회할 카테고리 이름 ('all'일 경우 모든 카테고리 포함)
     * @param sortOption 정렬 옵션 ('nameAsc', 'nameDesc', 등)
     * @return 필터링 및 정렬된 캐릭터 리스트
     */
    public List<CharacterDTO> getCharacters(String category, String sortOption) {
        List<CharacterDTO> characterList = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DBManager.connect();

            // 기본 SQL: 캐릭터와 카테고리를 JOIN
            StringBuilder sql = new StringBuilder(
                    "SELECT c.id, c.name, c.age, c.quote, c.description, c.button_image, c.main_image, cat.category_name " +
                            "FROM characters_test_nr c " +
                            "LEFT JOIN character_category_map m ON c.id = m.char_id " +
                            "LEFT JOIN categories cat ON m.category_id = cat.category_id "
            );

            // WHERE 절 추가
            if (!"all".equalsIgnoreCase(category)) {
                sql.append("WHERE cat.category_name = ? ");
            }

            // 정렬 옵션 추가
            if ("nameAsc".equalsIgnoreCase(sortOption)) {
                sql.append("ORDER BY c.name ASC");
            } else if ("nameDesc".equalsIgnoreCase(sortOption)) {
                sql.append("ORDER BY c.name DESC");
            } else {
                // 기본 정렬 (예: id ASC)
                sql.append("ORDER BY c.id ASC");
            }

            pstmt = con.prepareStatement(sql.toString());

            // 파라미터 바인딩
            if (!"all".equalsIgnoreCase(category)) {
                pstmt.setString(1, category);
            }

            rs = pstmt.executeQuery();

            // 캐릭터 ID를 기준으로 중복을 제거하고 카테고리 목록을 추가
            long currentId = -1;
            CharacterDTO dto = null;
            Set<String> categories = null;

            while (rs.next()) {
                long id = rs.getLong("id");
                if (id != currentId) {
                    // 새로운 캐릭터
                    dto = new CharacterDTO();
                    dto.setId(id);
                    dto.setName(rs.getString("name"));
                    dto.setAge(rs.getString("age"));
                    dto.setQuote(rs.getString("quote"));
                    dto.setDescription(rs.getString("description"));
                    dto.setButtonImage(rs.getString("button_image"));
                    dto.setMainImage(rs.getString("main_image"));

                    // 카테고리 목록 초기화
                    categories = new HashSet<>();
                    String catName = rs.getString("category_name");
                    if (catName != null) {
                        categories.add(catName);
                    }
                    dto.setCategories(new ArrayList<>(categories));

                    characterList.add(dto);
                    currentId = id;
                } else {
                    // 동일 캐릭터의 추가 카테고리
                    String catName = rs.getString("category_name");
                    if (catName != null && !categories.contains(catName)) {
                        categories.add(catName);
                        dto.getCategories().add(catName);
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            // 예외 처리: 필요에 따라 사용자 정의 예외를 던지거나 로그를 기록
        } finally {
            DBManager.close(con, pstmt, rs);
        }

        return characterList;
    }
}
