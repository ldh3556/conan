package com.conan.semi.login;

import com.conan.semi.DBManager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDAO {
    public static void login(HttpServletRequest request) {
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String nickname = request.getParameter("nickname");

    System.out.println(id);
    System.out.println(pw);
    System.out.println(nickname);

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
                String dbNo = rs.getString(1);
                String dbName = rs.getString(2);
                String dbBirth_year = rs.getString(3);
                String dbBirth_month = rs.getString(4);
                String dbBirth_day = rs.getString(5);
                String dbGender = rs.getString(6);
                String dbE_mail = rs.getString(7);
                String dbId = rs.getString(8);
                String dbPw = rs.getString(9);
                String dbPw_check = rs.getString(10);
                String dbNickname = rs.getString(11);
                if (pw.equals(dbPw)) {
                    msg = "로그인 성공";
                    // 세션 생성(1명의 회원 정보 요소 11개 전부 담기)
                    HttpSession session = request.getSession();
                    UserDTO user = new UserDTO();
                    user.setNo(rs.getString(1));
                    user.setName(rs.getString(2));
                    user.setBirth_year(rs.getString(3));
                    user.setBirth_month(rs.getString(4));
                    user.setBirth_day(rs.getString(5));
                    user.setGender(rs.getString(6));
                    user.setE_mail(rs.getString(7));
                    user.setId(rs.getString(8));
                    user.setPw(rs.getString(9));
                    user.setPw_check(rs.getString(10));
                    user.setNickname(rs.getString(11));
                    // user.setPw(dbPw);
                    session.setAttribute("user", user);
                    session.setMaxInactiveInterval(1000);
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
