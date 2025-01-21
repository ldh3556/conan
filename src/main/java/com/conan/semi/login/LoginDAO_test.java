package com.conan.semi.login;

import com.conan.semi.DBManager;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDAO_test {
    public static void login(HttpServletRequest request) {
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    System.out.println(id);
    System.out.println(pw);

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select * from account_table_hdh where id = ?";

        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);

            // db tbl 과 비교
            rs = pstmt.executeQuery();

            String msg = null;
            if (rs.next()) {
                String dbPw = rs.getString(8);
                if (pw.equals(dbPw)) {
                    msg = "로그인 성공";
                } else {
                    msg = "비밀번호 오류";
                }
            } else {
                msg = "존재하지 않는 id";
            }
            request.setAttribute("result", msg);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, rs);
        }
    }

}
