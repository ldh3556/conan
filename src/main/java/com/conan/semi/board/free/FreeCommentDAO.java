package com.conan.semi.board.free;

import com.conan.semi.DBManager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class FreeCommentDAO {
   public static ArrayList<FreeCommentDTO> freeComments = null;
private static Connection con = null;

    public static void showAllComment(HttpServletRequest request) {
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from board_free_comment where b_no = ? ORDER BY c_date DESC";
    try {
        con = DBManager.connect();
        pstmt = con.prepareStatement(sql);
        rs = pstmt.executeQuery();
        pstmt.setString(1, request.getParameter("b_no"));
        freeComments = new ArrayList<FreeCommentDTO>();
        FreeCommentDTO freeComment = null;
        while (rs.next()) {
            freeComment = new FreeCommentDTO();

            freeComment.setC_no(rs.getString(1));
            freeComment.setB_no(rs.getString(2));
            freeComment.setC_writer(rs.getString(3));
            freeComment.setC_content(rs.getString(4));
            freeComment.setC_date(rs.getDate(5));
            freeComments.add(freeComment);
        }
        request.setAttribute("freeComment", freeComment);
        request.setAttribute("freeComments", freeComments);
        System.out.println(freeComment);
        System.out.println(freeComments);

    }catch (Exception e){
        e.printStackTrace();
    }finally {
        DBManager.close(con, pstmt, rs);
    }
    }


    public static void addComment(HttpServletRequest request) {

    }
}
