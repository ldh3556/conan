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

        try {
            String b_no = request.getParameter("no");
            String sql = "SELECT * FROM board_free_comment WHERE b_no = ? ORDER BY c_date DESC";
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);

            if (b_no == null || b_no.isEmpty()) {
                throw new IllegalArgumentException("게시글 번호(no)가 유효하지 않습니다.");
            }

            pstmt.setString(1, b_no); // executeQuery 전에 파라미터 설정
            rs = pstmt.executeQuery();

            freeComments = new ArrayList<>();
            while (rs.next()) {
                FreeCommentDTO freeComment = new FreeCommentDTO();
                freeComment.setC_no(rs.getString(1)); // 컬럼 이름으로 접근
                freeComment.setB_no(rs.getString(2));
                freeComment.setC_writer(rs.getString(3));
                freeComment.setC_content(rs.getString(4));
                freeComment.setC_date(rs.getDate(5));
                freeComments.add(freeComment);
            }

            request.setAttribute("comments", "/jsp/board/board_free/board_free_comments.jsp");
            request.setAttribute("content", "board_free/board_free_detail.jsp");
            request.setAttribute("freeComments", freeComments);
            // request에 댓글 리스트 저장
  //          request.setAttribute("freeComments", freeComments);
System.out.println(freeComments);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, rs);
        }
    }


    public static void addComment(HttpServletRequest request) {
 con = null;
        PreparedStatement pstmt = null;


        try {
            String b_no = request.getParameter("no");
            String c_writer = request.getParameter("c_writer");
            String c_content = request.getParameter("c_content");
            String sql = "insert into board_free_comment (b_no, c_writer, c_content, c_date) VALUES (?, ?, ?, CURRENT_TIMESTAMP)";

con = DBManager.connect();
pstmt = con.prepareStatement(sql);

pstmt.setString(1, b_no);
pstmt.setString(2, c_writer);
pstmt.setString(3, c_content);

pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DBManager.close(con, pstmt, null);
        }

    }

    public static void updateComment(String cNo, String cContent) {
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DBManager.connect();
            String sql = "UPDATE free_comments SET c_content = ? WHERE c_no = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, c_content);
            pstmt.setString(2, c_no);

            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, null);
        }
    }
}
