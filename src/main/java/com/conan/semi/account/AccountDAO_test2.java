package com.conan.semi.account;

import com.conan.semi.DBManager;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AccountDAO_test2 {

//    // 아이디 중복 체크
//    public static boolean checkIdExists(String id) {
//        String sql = "SELECT * FROM account_table_hdh WHERE id = ?";
//        Connection con = null;
//        PreparedStatement pstmt = null;
//        ResultSet rs = null;
//        try {
//            con = DBManager.connect();
//            pstmt = con.prepareStatement(sql);
//            pstmt.setString(1, id);
//            rs = pstmt.executeQuery();
//            if (rs.next()) {
//                return rs.getInt(1) > 0; // 중복이면 true 반환
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            DBManager.close(con, pstmt, rs);
//        }
//        return false; // 아이디가 중복되지 않으면 false
//    }
//
//    // 이메일 중복 체크
//    public static boolean checkEmailExists(String e_mail) {
//        String sql = "SELECT * FROM account_table_hdh WHERE e_mail = ?";
//        Connection con = null;
//        PreparedStatement pstmt = null;
//        ResultSet rs = null;
//        try {
//            con = DBManager.connect();
//            pstmt = con.prepareStatement(sql);
//            pstmt.setString(1, e_mail);
//            rs = pstmt.executeQuery();
//            if (rs.next()) {
//                return rs.getInt(1) > 0; // 중복이면 true 반환
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            DBManager.close(con, pstmt, rs);
//        }
//        return false; // 이메일이 중복되지 않으면 false
//    }
//
//    // 닉네임 중복 체크
//    public static boolean checkNicknameExists(String nickname) {
//        String sql = "SELECT * FROM account_table_hdh WHERE nickname = ?";
//        Connection con = null;
//        PreparedStatement pstmt = null;
//        ResultSet rs = null;
//        try {
//            con = DBManager.connect();
//            pstmt = con.prepareStatement(sql);
//            pstmt.setString(1, nickname);
//            rs = pstmt.executeQuery();
//            if (rs.next()) {
//                return rs.getInt(1) > 0; // 중복이면 true 반환
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            DBManager.close(con, pstmt, rs);
//        }
//        return false; // 닉네임이 중복되지 않으면 false
//    }

    // 계정 생성
    public static void regUser(HttpServletRequest request) {
        String name = request.getParameter("name");
        String birth_year = request.getParameter("birth_year");
        String birth_month = request.getParameter("birth_month");
        String birth_day = request.getParameter("birth_day");
        String gender = request.getParameter("gender");
        String e_mail = request.getParameter("e_mail");
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String pw_check = request.getParameter("pw_check");
        String nickname = request.getParameter("nickname");

        System.out.println(name);
        System.out.println(birth_year);
        System.out.println(birth_month);
        System.out.println(birth_day);
        System.out.println(gender);
        System.out.println(e_mail);
        System.out.println(id);
        System.out.println(pw);
        System.out.println(pw_check);
        System.out.println(nickname);


//        // 중복 체크
//        boolean idExists = checkIdExists(id);
//        boolean emailExists = checkEmailExists(e_mail);  // 이메일 중복 체크
//        boolean nicknameExists = checkNicknameExists(nickname);
//
//        // 중복 체크 결과를 request 속성에 저장
//        request.setAttribute("idExists", idExists);
//        request.setAttribute("emailExists", emailExists);  // 이메일 중복 정보 저장
//        request.setAttribute("nicknameExists", nicknameExists);
//
//        // 중복되면 계정 등록을 하지 않고 JSP로 다시 보냄
//        if (idExists || emailExists || nicknameExists) {
//            return;
//        }

        // 계정 생성 SQL 실행
        String sql = "INSERT INTO account_table_hdh (name, birth_year, birth_month, birth_day, gender, e_mail, id, pw, pw_check, nickname) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, birth_year);
            pstmt.setString(3, birth_month);
            pstmt.setString(4, birth_day);
            pstmt.setString(5, gender);
            pstmt.setString(6, e_mail);
            pstmt.setString(7, id);
            pstmt.setString(8, pw);
            pstmt.setString(9, pw_check);
            pstmt.setString(10, nickname);

            if (pstmt.executeUpdate() == 1) {
                System.out.println("AccountDAO에서 회원정보 등록 성공!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, null);
        }
    }
}
