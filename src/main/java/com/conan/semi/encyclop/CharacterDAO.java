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

    public List<CharacterDTO> getCharacters(String category, String sortOption) {
        // 기존 메서드 유지
        List<CharacterDTO> characterList = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DBManager.connect();
            StringBuilder sql = new StringBuilder(
                    "SELECT c.id, c.name, c.age, c.quote, c.description, c.button_image, c.main_image, cat.category_name " +
                            "FROM characters_test_nr c " +
                            "LEFT JOIN character_category_map m ON c.id = m.char_id " +
                            "LEFT JOIN categories cat ON m.category_id = cat.category_id "
            );

            if (!"all".equalsIgnoreCase(category)) {
                sql.append("WHERE cat.category_name = ? ");
            }

            if ("nameAsc".equalsIgnoreCase(sortOption)) {
                sql.append("ORDER BY c.name ASC");
            } else if ("nameDesc".equalsIgnoreCase(sortOption)) {
                sql.append("ORDER BY c.name DESC");
            } else {
                sql.append("ORDER BY c.id ASC");
            }

            pstmt = con.prepareStatement(sql.toString());

            if (!"all".equalsIgnoreCase(category)) {
                pstmt.setString(1, category);
            }

            rs = pstmt.executeQuery();

            long currentId = -1;
            CharacterDTO dto = null;
            Set<String> categories = null;

            while (rs.next()) {
                long id = rs.getLong("id");
                if (id != currentId) {
                    dto = new CharacterDTO();
                    dto.setId(id);
                    dto.setName(rs.getString("name"));
                    dto.setAge(rs.getString("age"));
                    dto.setQuote(rs.getString("quote"));
                    dto.setDescription(rs.getString("description"));
                    dto.setButtonImage(rs.getString("button_image"));
                    dto.setMainImage(rs.getString("main_image"));

                    categories = new HashSet<>();
                    String catName = rs.getString("category_name");
                    if (catName != null) {
                        categories.add(catName);
                    }
                    dto.setCategories(new ArrayList<>(categories));

                    characterList.add(dto);
                    currentId = id;
                } else {
                    String catName = rs.getString("category_name");
                    if (catName != null && !categories.contains(catName)) {
                        categories.add(catName);
                        dto.getCategories().add(catName);
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, rs);
        }

        return characterList;
    }

    public String getCategoryNameById(int categoryId) {
            String categoryName = null;
            Connection con = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                con = DBManager.connect(); // 데이터베이스 연결
                String sql = "SELECT category_name FROM categories WHERE category_id = ?"; // SQL 쿼리
                pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, categoryId); // 파라미터 바인딩
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    categoryName = rs.getString("category_name"); // 카테고리 이름 가져오기
                }
            } catch (Exception e) {
                e.printStackTrace(); // 예외 출력
            } finally {
                DBManager.close(con, pstmt, rs); // 리소스 닫기
            }

            return categoryName;
        }

    /**
     * 특정 카테고리 ID와 정렬 옵션에 따라 캐릭터 목록을 조회하는 메서드
     *
     * @param categoryId 조회할 카테고리 ID
     * @param sortOption 정렬 옵션 ('nameAsc', 'nameDesc', 등)
     * @return 필터링된 캐릭터 리스트
     */
    public List<CharacterDTO> getCharactersByCategory(int categoryId, String sortOption) {
        List<CharacterDTO> characterList = new ArrayList<>();
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = DBManager.connect();

            // SQL 쿼리 작성
            StringBuilder sql = new StringBuilder(
                    "SELECT c.id, c.name, c.age, c.quote, c.description, c.button_image, c.main_image " +
                            "FROM characters_test_nr c " +
                            "JOIN character_category_map m ON c.id = m.char_id " +
                            "WHERE m.category_id = ? "
            );

            // 정렬 옵션 추가
            if ("nameAsc".equalsIgnoreCase(sortOption)) {
                sql.append("ORDER BY c.name ASC");
            } else if ("nameDesc".equalsIgnoreCase(sortOption)) {
                sql.append("ORDER BY c.name DESC");
            } else {
                sql.append("ORDER BY c.id ASC"); // 기본 정렬: ID 순
            }

            pstmt = con.prepareStatement(sql.toString());
            pstmt.setInt(1, categoryId);

            rs = pstmt.executeQuery();

            // 결과 처리
            while (rs.next()) {
                CharacterDTO dto = new CharacterDTO();
                dto.setId(rs.getLong("id"));
                dto.setName(rs.getString("name"));
                dto.setAge(rs.getString("age"));
                dto.setQuote(rs.getString("quote"));
                dto.setDescription(rs.getString("description"));
                dto.setButtonImage(rs.getString("button_image"));
                dto.setMainImage(rs.getString("main_image"));

                characterList.add(dto);
            }

        } catch (Exception e) {
            e.printStackTrace(); // 예외 로그 출력
        } finally {
            DBManager.close(con, pstmt, rs); // 리소스 닫기
        }

        return characterList;
    }


}