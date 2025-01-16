package com.conan.semi.vote;

import com.conan.semi.DBManager;

import javax.servlet.http.HttpServletRequest;
import java.sql.*;

public class RankDAO {
    public static void manrank(HttpServletRequest request) {
        String name = request.getParameter("name");
        String file = request.getParameter("file");

        // 우승자 정보 저장 SQL 실행
        Connection con = null;
        PreparedStatement pstmt = null;

        String insertSQL = "insert into winner_table_hdh (name, file) values (?, ?)";
        try {
            con = DBManager.connect();  // DB 연결
            pstmt = con.prepareStatement(insertSQL);
            pstmt.setString(1, name);
            pstmt.setString(2, file);

            // 우승자 정보 삽입
            pstmt.executeUpdate();

            // 랭킹 업데이트
            updateRank(con);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, null);
        }

        // 우승자 정보 조회 (랭킹 1위)
        String winnerName = "";
        String winnerImageURL = "";

        try {
            con = DBManager.connect(); // DB 연결
            String selectSQL = "select * from winner_table_hdh order by rank limit 1";  // 1위 우승자 조회
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(selectSQL);

            if (rs.next()) {
                winnerName = rs.getString("name");
                winnerImageURL = "/img/vote/worldcup/men/" + rs.getString("file");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, null, null);  // 적절히 연결 종료
        }

        // 결과를 반환하기 전에 request에 값을 설정해서 전달
        request.setAttribute("winnerName", winnerName);
        request.setAttribute("winnerImageURL", winnerImageURL);
    }

    // 랭킹을 업데이트하는 메소드
    private static void updateRank(Connection con) throws SQLException {
        // rank 값을 업데이트하는 SQL 쿼리 (가장 최근 우승자부터 순위를 매김)
        String rankUpdateSQL = "SET @rank := 0";
        Statement stmt = con.createStatement();
        stmt.execute(rankUpdateSQL);

        String updateRankSQL = "update winner_table_hdh set rank = (@rank := @rank + 1) order by id desc";
        stmt.executeUpdate(updateRankSQL);
    }
}
