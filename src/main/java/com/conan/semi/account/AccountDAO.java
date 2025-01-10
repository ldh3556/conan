package com.conan.semi.account;

import com.conan.semi.DBManager;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AccountDAO {

    // 아이디 중복 체크
    public static boolean checkIdExists(String id) {
        String sql = "SELECT COUNT(*) FROM account_table_test WHERE id = ?";
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // 중복이면 true 반환
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, rs);
        }
        return false; // 아이디가 중복되지 않으면 false
    }

    // 닉네임 중복 체크
    public static boolean checkNicknameExists(String nickname) {
        String sql = "SELECT COUNT(*) FROM account_table_test WHERE nickname = ?";
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, nickname);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // 중복이면 true 반환
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, rs);
        }
        return false; // 닉네임이 중복되지 않으면 false
    }

    // 계정 생성
    public static void regUser(HttpServletRequest request) {
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String pw_check = request.getParameter("pw_check");
        String name = request.getParameter("name");
        String nickname = request.getParameter("nickname");

        // 아이디와 닉네임 중복 체크
        boolean idExists = checkIdExists(id);
        boolean nicknameExists = checkNicknameExists(nickname);

        // 아이디 또는 닉네임이 중복되면 중단
        if (idExists || nicknameExists) {
            request.setAttribute("idExists", idExists);
            request.setAttribute("nicknameExists", nicknameExists);
            return; // 중복되면 계정 등록을 하지 않고 JSP로 다시 보냄
        }

        // 계정 생성 SQL 실행
        String sql = "INSERT INTO account_table_test (id, pw, pw_check, name, nickname) VALUES (?, ?, ?, ?, ?)";
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pw);
            pstmt.setString(3, pw_check);
            pstmt.setString(4, name);
            pstmt.setString(5, nickname);

            if (pstmt.executeUpdate() == 1) {
                System.out.println("등록 성공");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, null);
        }
    }
}
