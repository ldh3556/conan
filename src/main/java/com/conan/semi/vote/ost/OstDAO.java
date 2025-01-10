package com.conan.semi.vote.ost;

import com.conan.semi.DBManager;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class OstDAO {
    public static void getName(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "select * from bracket_test order by DBMS_RANDOM.RANDOM\n" +
                "FETCH FIRST 8 ROWS ONLY";
        try {
            con = DBManager.connect();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            OstDTO song = null;
            ArrayList<OstDTO> songs = new ArrayList<OstDTO>();
            while (rs.next()) {
                song = new OstDTO(rs.getInt(1),rs.getString(2),rs.getInt(3));
                songs.add(song);
            }

            request.setAttribute("songs", songs);

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.close(con, ps, rs);
        }
    }
}
