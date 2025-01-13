package com.conan.semi.account;

import com.conan.semi.DBManager;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class AccountDAO_test3 {

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

    public static void checkIdExists(HttpServletRequest request) {


    }
}
