package com.conan.semi.account;

import com.conan.semi.DBManager;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class AccountDAO_test {
    public static void regUser(HttpServletRequest request) {
        String name = request.getParameter("name");
        String birth = request.getParameter("birth");
        String gender = request.getParameter("gender");
        String e_mail = request.getParameter("e_mail");
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String pw_check = request.getParameter("pw_check");
        String nickname = request.getParameter("nickname");

        System.out.println(id);
        System.out.println(pw);
        System.out.println(pw_check);
        System.out.println(name);
        System.out.println(nickname);

        // 계정 생성 SQL 실행
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "insert into account_table_test values (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, birth);
            pstmt.setString(3, gender);
            pstmt.setString(4, e_mail);
            pstmt.setString(5, id);
            pstmt.setString(6, pw);
            pstmt.setString(7, pw_check);
            pstmt.setString(8, nickname);

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
