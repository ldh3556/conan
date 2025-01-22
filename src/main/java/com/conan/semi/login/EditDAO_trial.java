package com.conan.semi.login;

import com.conan.semi.DBManager;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class EditDAO_trial {
    public static void editAccount(HttpServletRequest request) {
    String name = request.getParameter("name");
    String e_mail = request.getParameter("e_mail");
    String pw = request.getParameter("pw");
    String pw_check = request.getParameter("pw_check");
    String nickname = request.getParameter("nickname");

    System.out.println(name);
    System.out.println(e_mail);
    System.out.println(pw);
    System.out.println(pw_check);
    System.out.println(nickname);

        Connection con = null;
        PreparedStatement pstmt = null;

        // 세션에서 현재 로그인한 사용자의 ID 가져오기
        // String id = (String) request.getSession().getAttribute("userId"); 이건 안되는거야!

        String sql = "update account_table_hdh set name=?, e_mail=?, pw=?, pw_check=?, nickname=? where id=?";

        try {
            // 세션에서 UserDTO 객체 가져오기
            UserDTO user = (UserDTO) request.getSession().getAttribute("user");
            String id = user.getId();

            if (con == null) { // con이 null일 때만 연결하라
                con = DBManager.connect();
            }
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, e_mail);
            pstmt.setString(3, pw);
            pstmt.setString(4, pw_check);
            pstmt.setString(5, nickname);
            pstmt.setString(6, id);

        if (pstmt.executeUpdate() == 1) {
            System.out.println("회원정보 수정 성공!");
        }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, null);
        }

    }
}
