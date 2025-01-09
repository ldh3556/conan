package com.conan.semi.account;

import com.conan.semi.DBManager;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class AccountDAO {
    public static void regUser(HttpServletRequest request) {
    // 1. 값 받기 or db 세팅(no read)
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String pw_check = request.getParameter("pw_check");
    String name = request.getParameter("name");
    String nickname = request.getParameter("nickname");

    Connection con = null;
    PreparedStatement pstmt = null;
    String sql = "insert into account_table_test values(?,?,?,?,?)";
    try {
        con = DBManager.connect();
        pstmt = con.prepareStatement(sql);
        // sql 완성시키기
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
