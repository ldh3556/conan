package com.conan.semi.vote.ost;

import com.conan.semi.DBManager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class OstDAO {
    public static void getName(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "select * from bracket_test order by DBMS_RANDOM.RANDOM FETCH FIRST 8 ROWS ONLY";
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

    public static void winCount(HttpServletRequest request) {

        String songTitle = request.getParameter("songTitle");
        Connection con = null;
        PreparedStatement ps = null;
        String sql = "update bracket_test set win_count=win_count+1 where song_title=?";
        System.out.println(songTitle);
        try {
            con = DBManager.connect();
            ps = con.prepareStatement(sql);
            ps.setString(1, songTitle);

            if (ps.executeUpdate() == 1) {
                System.out.println("업데이트 성공~");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.close(con, ps, null);
        }


    }





}
