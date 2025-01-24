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
        String text = request.getParameter("text");
        if(text.isEmpty()){
            text = "자기소개가 없습니다";
        }
        Connection con = null;
        PreparedStatement pstmt = null;

        // 세션에서 UserDTO 객체 가져오기 (현재 로그인한 사용자 정보)
        UserDTO user = (UserDTO) request.getSession().getAttribute("user");
        String id = user.getId();
        String oldNickname = user.getNickname();  // 기존 닉네임

        String updateSQL = "UPDATE account_table_hdh SET name=?, e_mail=?, pw=?, pw_check=?, nickname=?, text=? WHERE id=?";

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
            // 2. 부모 테이블 수정
            pstmt = con.prepareStatement(updateSQL);
            pstmt.setString(1, name);
            pstmt.setString(2, e_mail);
            pstmt.setString(3, pw);
            pstmt.setString(4, pw_check);
            pstmt.setString(5, nickname);
            pstmt.setString(6, text);
            pstmt.setString(7, id);

            if (pstmt.executeUpdate() == 1) {
                System.out.println("회원정보 수정 성공!");
            }

            // 트랜잭션 커밋
            con.commit();

            // 3. 세션에 수정된 정보 반영
            user.setName(name);
            user.setE_mail(e_mail);
            user.setPw(pw);
            user.setNickname(nickname);
            user.setText(text);

            // 세션에 수정된 사용자 정보 저장
            request.getSession().setAttribute("user", user);

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
