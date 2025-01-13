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
                board.setB_begin(rs.getString(4));
                board.setB_title(rs.getString(5));
                board.setB_text(rs.getString(6));
                board.setB_date(rs.getDate(7));

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
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            String no = request.getParameter("no");
            String sql = "select * from board_table_test where b_no=?";
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, no);
            rs = pstmt.executeQuery();
            BoardFreeDTO board = null;
            if (rs.next()) {
                board = new BoardFreeDTO();
                board.setB_no(rs.getString(1));
                board.setB_id(rs.getString(2));
                board.setB_name(rs.getString(3));
                board.setB_begin(rs.getString(4));
                board.setB_title(rs.getString(5));
                board.setB_text(rs.getString(6));
                board.setB_date(rs.getDate(7));

                request.setAttribute("board", board);
            }
            System.out.println(board);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, rs);
        }
    }


    public static void addBoardFree(HttpServletRequest request) {
        con = null;
        PreparedStatement pstmt = null;
        String sql = "insert into board_table_test values(board_table_test_seq.nextval, ?,?,?,?,?, sysdate)";
try {
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String begin = request.getParameter("begin");
    String title = request.getParameter("title");
    String text = request.getParameter("text");
    con = DBManager.connect();
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, id);
    pstmt.setString(2, name);
    pstmt.setString(3, begin);
    pstmt.setString(4, title);
    pstmt.setString(5, text);

    System.out.println(id);
    System.out.println(name);
    System.out.println(begin);
    System.out.println(title);
    System.out.println(text);

    if (pstmt.executeUpdate() > 0) {
        System.out.println("업뎃성공");
    }

}catch (Exception e) {
    e.printStackTrace();
}finally {
    DBManager.close(con, pstmt, null);
}


    }

    public static void DelBoardFree(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "delete from board_table_test where b_no=?";
        String no = request.getParameter("no");
        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, no);

            if (pstmt.executeUpdate() > 0) {
                System.out.println("삭제성공");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, null);
        }

    }

    public static void UpdatBoardFree(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "Update Board_table_test set b_begin=?, b_title = ?,b_text = ? where b_no = ?";
        String no = request.getParameter("no");
        String begin = request.getParameter("begin");
        String title = request.getParameter("title");
        String text = request.getParameter("text");
        try{
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, begin);
            pstmt.setString(2, title);
            pstmt.setString(3, text);
            pstmt.setString(4, no);
            if (pstmt.executeUpdate() > 0) {
                System.out.println("업뎃성공");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.close(con, pstmt, null);
        }
    }
}
