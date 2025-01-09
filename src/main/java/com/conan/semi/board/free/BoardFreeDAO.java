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
    public static void showAllBoardFree(HttpServletRequest request){
               PreparedStatement pstmt = null;
               ResultSet rs = null;
               String sql = "select * from board_free";
               try {
    con = DBManager.getConnect();
    pstmt = con.prepareStatement(sql);
    rs = pstmt.executeQuery();
    boards = new ArrayList<BoardFreeDTO>();
    BoardFreeDTO board = null;
    while (rs.next()) {
        board = new BoardFreeDTO();
        board.setId(rs.getString("id"));
        board.setName(rs.getString("name"));
        board.setDescription(rs.getString("description"));

        boards.add(board);
    }
    request.setAttribute("boards", boards);
    system.out.printIn(boards);
               } catch (Exception e){
                   e.printStackTrace();
               } finally {

               }DBManager.close(con, pstmt, rs);


    }
}
