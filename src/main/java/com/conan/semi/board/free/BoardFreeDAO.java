package com.conan.semi.board.free;

import com.conan.semi.DBManager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardFreeDAO {
    private static Connection con = null;

    public static void showAllBoardFree(HttpServletRequest request) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "select * from board_table_test";
        try {
            System.out.println("connect --");
            con = DBManager.connect();
            System.out.printf("con done");
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            ArrayList<BoardFreeDTO> boards = new ArrayList<BoardFreeDTO>();
            BoardFreeDTO board = null;
            while (rs.next()) {
                board = new BoardFreeDTO();
               board.setB_no(rs.getString(1));
               board.setB_id(rs.getString(2));
               board.setB_name(rs.getString(3));
               board.setB_title(rs.getString(4));
               board.setB_text(rs.getString(5));
               board.setB_date(rs.getDate(6));

                boards.add(board);
            }
            request.setAttribute("boards", boards);
            System.out.println(boards);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {

        }
        DBManager.close(con, pstmt, rs);


    }

    public static void detailBoardFree(HttpServletRequest request) {
    }
}
