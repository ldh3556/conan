package com.conan.semi.login;

import com.conan.semi.DBManager;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EditDAO {
    public static void editAccount(HttpServletRequest request) {
        String name = request.getParameter("name");
        String e_mail = request.getParameter("e_mail");
        String pw = request.getParameter("pw");
        String pw_check = request.getParameter("pw_check");
        String nickname = request.getParameter("nickname");

        Connection con = null;
        PreparedStatement pstmt = null;

        // 세션에서 UserDTO 객체 가져오기 (현재 로그인한 사용자 정보)
        UserDTO user = (UserDTO) request.getSession().getAttribute("user");
        String id = user.getId();
        String oldNickname = user.getNickname();  // 기존 닉네임

        String updateSQL = "update account_table_hdh set name=?, e_mail=?, pw=?, pw_check=?, nickname=? where id=?";

        try {
            // DB 연결
            con = DBManager.connect();
            if (con == null) {
                throw new SQLException("DB 연결 실패");
            }

            // 트랜잭션 시작
            con.setAutoCommit(false);

            // 비밀번호 검증 (pw와 pw_check가 일치하는지 확인)
            if (!pw.equals(pw_check)) {
                throw new SQLException("비밀번호가 일치하지 않습니다.");
            }

            // 1. 자식 테이블에서 nickname 수정
            String updateNicknameSQL = "update board_free_table set b_name = ? where b_name = ?";
            pstmt = con.prepareStatement(updateNicknameSQL);
            pstmt.setString(1, nickname);  // 새로운 닉네임
            pstmt.setString(2, oldNickname);  // 기존 닉네임
            pstmt.executeUpdate();

            // board_movie_table 수정
            pstmt.clearParameters();
            pstmt = con.prepareStatement("update board_movie_table set b_name = ? where b_name = ?");
            pstmt.setString(1, nickname);
            pstmt.setString(2, oldNickname);
            pstmt.executeUpdate();

            // board_notice_table 수정
            pstmt.clearParameters();
            pstmt = con.prepareStatement("update board_notice_table set b_name = ? where b_name = ?");
            pstmt.setString(1, nickname);
            pstmt.setString(2, oldNickname);
            pstmt.executeUpdate();

            // board_anime_table 수정
            pstmt.clearParameters();
            pstmt = con.prepareStatement("update board_anime_table set b_name = ? where b_name = ?");
            pstmt.setString(1, nickname);
            pstmt.setString(2, oldNickname);
            pstmt.executeUpdate();

            // 2. 부모 테이블 수정
            pstmt.clearParameters();
            pstmt = con.prepareStatement(updateSQL);
            pstmt.setString(1, name);
            pstmt.setString(2, e_mail);
            pstmt.setString(3, pw);
            pstmt.setString(4, pw_check);
            pstmt.setString(5, nickname);
            pstmt.setString(6, id);

            if (pstmt.executeUpdate() == 1) {
                System.out.println("회원정보 수정 성공!");
            }

            // 트랜잭션 커밋
            con.commit();

        } catch (Exception e) {
            try {
                // 오류 발생 시 롤백
                if (con != null) {
                    con.rollback();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                // 트랜잭션 종료 후 autoCommit을 true로 복원
                if (con != null) {
                    con.setAutoCommit(true);
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
            DBManager.close(con, pstmt, null);
        }
    }
}
