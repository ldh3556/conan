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
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "select * from account_table_hdh where id = ? and pw = ?";

        try {
            con = DBManager.connect();
            ps.setString(1, id);
            ps.setString(2, pw);
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if(rs.next()) {
                request.getSession().setAttribute("id", id);
                request.getSession().setAttribute("pw", pw);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, ps, rs);
        }




    }
}
