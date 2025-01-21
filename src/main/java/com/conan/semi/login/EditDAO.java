package com.conan.semi.login;

import com.conan.semi.DBManager;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EditDAO {

    public static void editAccount(HttpServletRequest request) {
        String name = request.getParameter("name");
        String e_mail = request.getParameter("e_mail");
        String pw = request.getParameter("pw");
        String pw_check = request.getParameter("pw_check");
        String nickname = request.getParameter("nickname");

        // 세션에서 현재 로그인한 사용자의 Nickname과 이메일 가져오기
        String currentUserNickname = (String) request.getSession().getAttribute("userNickname");
        String currentUserEmail = (String) request.getSession().getAttribute("userEmail");

        System.out.println("수정된 값들:");
        System.out.println("name: " + name);
        System.out.println("e_mail: " + e_mail);
        System.out.println("pw: " + pw);
        System.out.println("pw_check: " + pw_check);
        System.out.println("nickname: " + nickname);

        // 이메일과 닉네임 중복 여부 체크 (수정하는 경우에만)
        if (!e_mail.equals(currentUserEmail) || !nickname.equals(currentUserNickname)) {
            if (isEmailOrNicknameDuplicated(e_mail, nickname, currentUserEmail, currentUserNickname)) {
                System.out.println("이메일 또는 닉네임이 이미 존재합니다.");
                return;  // 중복이 있을 경우 더 이상 진행하지 않음
            }
        }

        Connection con = null;
        PreparedStatement pstmt = null;

        // 업데이트 쿼리: 변경된 필드만 업데이트
        StringBuilder sql = new StringBuilder("UPDATE account_table_hdh SET ");
        boolean hasChanges = false;

        if (name != null && !name.isEmpty()) {
            sql.append("name = ?, ");
            hasChanges = true;
        }
        if (e_mail != null && !e_mail.isEmpty() && !e_mail.equals(currentUserEmail)) {
            sql.append("e_mail = ?, ");
            hasChanges = true;
        }
        if (pw != null && !pw.isEmpty()) {
            sql.append("pw = ?, ");
            hasChanges = true;
        }
        if (pw_check != null && !pw_check.isEmpty()) {
            sql.append("pw_check = ?, ");
            hasChanges = true;
        }
        if (nickname != null && !nickname.isEmpty() && !nickname.equals(currentUserNickname)) {
            sql.append("nickname = ?, ");
            hasChanges = true;
        }

        // 마지막에 불필요한 쉼표 제거
        if (hasChanges) {
            sql.deleteCharAt(sql.length() - 2); // 마지막 쉼표 삭제
            sql.append(" WHERE nickname = ?");
        } else {
            System.out.println("변경된 정보가 없습니다.");
            return;  // 변경된 정보가 없으면 아무 작업도 하지 않음
        }

        // 쿼리 디버깅을 위해 출력
        System.out.println("실행될 SQL 쿼리: " + sql.toString());

        try {
            if (con == null) { // con이 null일 때만 연결하라
                con = DBManager.connect();
            }

            pstmt = con.prepareStatement(sql.toString());

            // 쿼리 파라미터 설정
            int paramIndex = 1;

            if (name != null && !name.isEmpty()) {
                pstmt.setString(paramIndex++, name);
            }
            if (e_mail != null && !e_mail.isEmpty() && !e_mail.equals(currentUserEmail)) {
                pstmt.setString(paramIndex++, e_mail);
            }
            if (pw != null && !pw.isEmpty()) {
                pstmt.setString(paramIndex++, pw);
            }
            if (pw_check != null && !pw_check.isEmpty()) {
                pstmt.setString(paramIndex++, pw_check);
            }
            if (nickname != null && !nickname.isEmpty() && !nickname.equals(currentUserNickname)) {
                pstmt.setString(paramIndex++, nickname);
            }

            // 현재 로그인한 사용자의 닉네임을 WHERE 절에 전달
            pstmt.setString(paramIndex, currentUserNickname);

            // 실제로 실행되는 쿼리 실행
            int rowsUpdated = pstmt.executeUpdate();
            if (rowsUpdated == 1) {
                System.out.println("회원정보 수정 성공!");
            } else {
                System.out.println("회원정보 수정 실패. 영향을 미친 행 수: " + rowsUpdated);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, null);
        }
    }

    // 이메일과 닉네임 중복 여부 확인
    private static boolean isEmailOrNicknameDuplicated(String e_mail, String nickname, String currentUserEmail, String currentUserNickname) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        boolean isDuplicated = false;

        try {
            con = DBManager.connect();

            // 이메일 또는 닉네임이 이미 다른 사용자에 의해 사용되고 있는지 체크
            String sql = "SELECT COUNT(*) FROM account_table_hdh WHERE (e_mail = ? OR nickname = ?) AND (e_mail != ? OR nickname != ?)";

            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, e_mail);
            pstmt.setString(2, nickname);
            pstmt.setString(3, currentUserEmail);  // 현재 사용자의 이메일을 제외
            pstmt.setString(4, currentUserNickname);  // 현재 사용자의 닉네임을 제외

            rs = pstmt.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                isDuplicated = true;  // 중복이 존재하면 true 반환
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, rs);
        }

        return isDuplicated;
    }
}
