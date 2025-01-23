package com.conan.semi.board.free;

import com.conan.semi.DBManager;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardFreeDAO {
    static ArrayList<BoardFreeDTO> boards = null;
    private static Connection con = null;

    public static void showAllBoardFree(HttpServletRequest request) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "select * from board_free_table ORDER BY b_date desc";

        try {
            System.out.println("connect --");
            con = DBManager.connect();
            System.out.printf("con done");
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            boards = new ArrayList<BoardFreeDTO>();
            BoardFreeDTO board = null;
            while (rs.next()) {
                board = new BoardFreeDTO();
                board.setB_no(rs.getString(1));
                board.setB_id(rs.getString(2));
                board.setB_name(rs.getString(3));
                board.setB_begin(rs.getString(4));
                board.setB_title(rs.getString(5));
                board.setB_img(rs.getString(6));
                board.setB_text(rs.getString(7));
                board.setB_date(rs.getDate(8));

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
            String sql = "select * from board_free_table where b_no=?";
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
                board.setB_img(rs.getString(6));
                board.setB_text(rs.getString(7));
                board.setB_date(rs.getDate(8));

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
        String path = request.getServletContext().getRealPath("/jsp/board/board_free/board_free_img");
        con = null;
        PreparedStatement pstmt = null;
try {
    MultipartRequest mr = new MultipartRequest(request, path, 1024 * 1024 * 20, "utf-8",
            new DefaultFileRenamePolicy());
    String sql = "insert into board_free_table values(board_free_table_seq.nextval, ?,?,?,?,?,?, sysdate)";
    request.setCharacterEncoding("utf-8");
    String id = mr.getParameter("id");
    String name = mr.getParameter("name");
    String begin = mr.getParameter("begin");
    String title = mr.getParameter("title");
    String img = mr.getOriginalFileName("img");
    String text = mr.getParameter("text");
    con = DBManager.connect();
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, id);
    pstmt.setString(2, name);
    pstmt.setString(3, begin);
    pstmt.setString(4, title);
    pstmt.setString(5, img);
    pstmt.setString(6, text);

    System.out.println(id);
    System.out.println(name);
    System.out.println(begin);
    System.out.println(title);
    System.out.println(img);
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

    public static void delBoardFree(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "delete from board_free_table where b_no=?";
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

    public static void updatBoardFree(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "Update board_free_table set b_begin=?, b_title = ?, b_img = ?, b_text = ? where b_no = ?";
        String no = request.getParameter("no");
        String begin = request.getParameter("begin");
        String title = request.getParameter("title");
        String img = request.getParameter("img");
        String text = request.getParameter("text");
        try{
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, begin);
            pstmt.setString(2, title);
            pstmt.setString(3, img);
            pstmt.setString(4, text);
            pstmt.setString(5, no);
            if (pstmt.executeUpdate() > 0) {
                System.out.println("업뎃성공");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            DBManager.close(con, pstmt, null);
        }
    }

    public static void pagingFreeBoard(int pageNum, HttpServletRequest request) {
        request.setAttribute("curPageNum", pageNum);

        if (boards.isEmpty()) {
            request.setAttribute("boards", new ArrayList<>()); // 빈 리스트 전달
            request.setAttribute("pageCount", 1); // 페이지 수를 최소 1로 설정
            request.setAttribute("curPageNum", 1); // 현재 페이지를 1로 설정
            return;
        }
    System.out.println(pageNum);
        int total = boards.size();
        System.out.println(total);
    int count = 5;
        System.out.println(count);
    int pageCount = (int) Math.ceil((double)total / count);
    try {
        System.out.println(pageCount);
    } catch (Exception e) {
        e.printStackTrace();
    }
//    request.setAttribute("pageCount", pageCount);
    request.setAttribute("pageCount", pageCount);
    int start = total - (count * (pageNum - 1));
    int end = (pageNum == pageCount) ? -1 : start - (count + 1);

    ArrayList<BoardFreeDTO> items = new ArrayList<BoardFreeDTO>();

    for (int i = start-1 ; i > end; i--) {
    items.add(boards.get(i));
    }

    request.setAttribute("boards", items);
    }

    public static void searchBoardFree(HttpServletRequest request, HttpServletResponse response) {
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from board_free_table where b_title like '%'||?||'%'";

    try {
        con = DBManager.connect();
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, request.getParameter("boardTitle"));
        rs = pstmt.executeQuery();
        ArrayList<String> boards = new ArrayList<String>();

        BoardFreeDTO b = null;
        while (rs.next()) {
            b = new BoardFreeDTO();
            b.setB_no(rs.getString(1));
            b.setB_id(rs.getString(2));
            b.setB_name(rs.getString(3));
            b.setB_begin(rs.getString(4));
            b.setB_title(rs.getString(5));
            b.setB_text(rs.getString(6));
            b.setB_date(rs.getDate(7));
            boards.add(b.toJSONByMe());
        }
        System.out.println(boards);
        System.out.println(boards.size());

        response.setContentType("application/json;charset=utf-8");
        response.getWriter().print(boards);

    } catch (Exception e) {
        e.printStackTrace();
    }finally {
        DBManager.close(con, pstmt, rs);
    }
    }
}
