package com.conan.semi.login;

import com.conan.semi.DBManager;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class EditDAO_gpt2 {
    public static void editAccount(HttpServletRequest request) {
        String name = request.getParameter("name");
        String e_mail = request.getParameter("e_mail");
        String pw = request.getParameter("pw");
        String pw_check = request.getParameter("pw_check");
        String nickname = request.getParameter("nickname");

        // 세션에서 현재 로그인한 사용자의 이메일과 닉네임을 가져옵니다.
        String currentUserId = (String) request.getSession().getAttribute("userId");
        String currentEmail = (String) request.getSession().getAttribute("userEmail");
        String currentNickname = (String) request.getSession().getAttribute("userNickname");

        // 이메일과 닉네임이 변경된 경우에만 중복 체크
        if (!e_mail.equals(currentEmail) && !isEmailUnique(e_mail)) {
            System.out.println("이미 존재하는 이메일입니다.");
            return; // 이메일이 중복되면 수정 불가
        }

        if (!nickname.equals(currentNickname) && !isNicknameUnique(nickname)) {
            System.out.println("이미 존재하는 닉네임입니다.");
            return; // 닉네임이 중복되면 수정 불가
        }

        String sql = "UPDATE account_table_hdh SET name=?, e_mail=?, pw=?, pw_check=?, nickname=? WHERE id=?";
        try (Connection con = DBManager.connect();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, name);
            pstmt.setString(2, e_mail);
            pstmt.setString(3, pw);
            pstmt.setString(4, pw_check);
            pstmt.setString(5, nickname);
            pstmt.setString(6, currentUserId);

            if (pstmt.executeUpdate() == 1) {
                System.out.println("회원정보 수정 성공!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 이메일이 중복되지 않는지 확인하는 메서드
    private static boolean isEmailUnique(String email) {
        String sql = "SELECT COUNT(*) FROM account_table_hdh WHERE e_mail = ?";
        try (Connection con = DBManager.connect();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, email);
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next() && rs.getInt(1) == 0; // 중복이 없으면 true
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // 닉네임이 중복되지 않는지 확인하는 메서드
    private static boolean isNicknameUnique(String nickname) {
        String sql = "SELECT COUNT(*) FROM account_table_hdh WHERE nickname = ?";
        try (Connection con = DBManager.connect();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, nickname);
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next() && rs.getInt(1) == 0; // 중복이 없으면 true
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}