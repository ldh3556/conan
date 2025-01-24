package com.conan.semi.login;

import com.conan.semi.DBManager;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EditDAO_trial_UNUSED {
//    public static void editAccount(HttpServletRequest request) {
//    String name = request.getParameter("name");
//    String e_mail = request.getParameter("e_mail");
//    String pw = request.getParameter("pw");
//    String pw_check = request.getParameter("pw_check");
//    String nickname = request.getParameter("nickname");
//
//    System.out.println(name);
//    System.out.println(e_mail);
//    System.out.println(pw);
//    System.out.println(pw_check);
//    System.out.println(nickname);
//
//        Connection con = null;
//        PreparedStatement pstmt = null;
//
//        // 세션에서 현재 로그인한 사용자의 ID 가져오기
//        // String id = (String) request.getSession().getAttribute("userId"); 이건 안되는거야!
//
//        String sql = "update account_table_hdh set name=?, e_mail=?, pw=?, pw_check=?, nickname=? where id=?";
//
//        try {
//            // 세션에서 UserDTO 객체 가져오기
//            UserDTO user = (UserDTO) request.getSession().getAttribute("user");
//            String id = user.getId();
//
//            if (con == null) { // con이 null일 때만 연결하라
//                con = DBManager.connect();
//            }
//            pstmt = con.prepareStatement(sql);
//            pstmt.setString(1, name);
//            pstmt.setString(2, e_mail);
//            pstmt.setString(3, pw);
//            pstmt.setString(4, pw_check);
//            pstmt.setString(5, nickname);
//            pstmt.setString(6, id);
//
//        if (pstmt.executeUpdate() == 1) {
//            System.out.println("회원정보 수정 성공!");
//        }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            DBManager.close(con, pstmt, null);
//        }
//
//    }






//    public static void editAccount(HttpServletRequest request) {
//        String name = request.getParameter("name");
//        String e_mail = request.getParameter("e_mail");
//        String pw = request.getParameter("pw");
//        String pw_check = request.getParameter("pw_check");
//        String nickname = request.getParameter("nickname");
//
//        System.out.println(name);
//        System.out.println(e_mail);
//        System.out.println(pw);
//        System.out.println(pw_check);
//        System.out.println(nickname);
//
//        Connection con = null;
//        PreparedStatement pstmt = null;
//
//        // 세션에서 UserDTO 객체 가져오기
//        UserDTO user = (UserDTO) request.getSession().getAttribute("user");
//        String id = user.getId();
//        String oldNickname = user.getNickname(); // 기존 닉네임을 가져옴
//
//        String sql = "UPDATE account_table_hdh SET name=?, e_mail=?, pw=?, pw_check=?, nickname=? WHERE id=?";
//
//        try {
//            con = DBManager.connect();
//            con.setAutoCommit(false); // 트랜잭션 시작
//
//            // 1. 자식 테이블들을 업데이트: 자식 테이블들에서 `b_name`과 `b_id` 값 변경
//            String updateBoardFree = "UPDATE board_free_table SET b_name=? WHERE b_name=?";
//            pstmt = con.prepareStatement(updateBoardFree);
//            pstmt.setString(1, nickname);
//            pstmt.setString(2, oldNickname);
//            pstmt.executeUpdate();
//
//            String updateBoardMovie = "UPDATE board_movie_table SET b_name=? WHERE b_name=?";
//            pstmt = con.prepareStatement(updateBoardMovie);
//            pstmt.setString(1, nickname);
//            pstmt.setString(2, oldNickname);
//            pstmt.executeUpdate();
//
//            String updateBoardNotice = "UPDATE board_notice_table SET b_name=? WHERE b_name=?";
//            pstmt = con.prepareStatement(updateBoardNotice);
//            pstmt.setString(1, nickname);
//            pstmt.setString(2, oldNickname);
//            pstmt.executeUpdate();
//
//            String updateBoardAnime = "UPDATE board_anime_table SET b_name=? WHERE b_name=?";
//            pstmt = con.prepareStatement(updateBoardAnime);
//            pstmt.setString(1, nickname);
//            pstmt.setString(2, oldNickname);
//            pstmt.executeUpdate();
//
//            // 2. 부모 테이블을 업데이트: `account_table_hdh`의 `id`와 `nickname` 변경
//            pstmt = con.prepareStatement(sql);
//            pstmt.setString(1, name);
//            pstmt.setString(2, e_mail);
//            pstmt.setString(3, pw);
//            pstmt.setString(4, pw_check);
//            pstmt.setString(5, nickname);
//            pstmt.setString(6, id);
//
//            if (pstmt.executeUpdate() == 1) {
//                System.out.println("회원정보 수정 성공!");
//            }
//
//            // 모든 작업이 성공적으로 완료되면 트랜잭션을 커밋
//            con.commit();
//        } catch (Exception e) {
//            try {
//                if (con != null) {
//                    con.rollback(); // 오류 발생 시 롤백
//                }
//            } catch (Exception ex) {
//                ex.printStackTrace();
//            }
//            e.printStackTrace();
//        } finally {
//            try {
//                if (con != null) {
//                    con.setAutoCommit(true); // 자동 커밋을 다시 활성화
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//            DBManager.close(con, pstmt, null);
//        }
//    }








//    public static void editAccount(HttpServletRequest request) throws SQLException {
//        String name = request.getParameter("name");
//        String e_mail = request.getParameter("e_mail");
//        String pw = request.getParameter("pw");
//        String pw_check = request.getParameter("pw_check");
//        String nickname = request.getParameter("nickname");
//
//        Connection con = null;
//        PreparedStatement pstmt = null;
//
//        // 세션에서 UserDTO 객체 가져오기
//        UserDTO user = (UserDTO) request.getSession().getAttribute("user");
//        String id = user.getId();
//        String oldNickname = user.getNickname(); // 기존 닉네임을 가져옴
//
//        String sql = "UPDATE account_table_hdh SET name=?, e_mail=?, pw=?, pw_check=?, nickname=? WHERE id=?";
//        String updateBoardAnime = "UPDATE board_anime_table SET b_name=? WHERE b_name=?";
//        String updateBoardFree = "UPDATE board_free_table SET b_name=? WHERE b_name=?";
//        String updateBoardMovie = "UPDATE board_movie_table SET b_name=? WHERE b_name=?";
//        String updateBoardNotice = "UPDATE board_notice_table SET b_name=? WHERE b_name=?";
//
//        try {
//            con = DBManager.connect();
//            con.setAutoCommit(false); // 트랜잭션 시작
//
//            // 1. 자식 테이블(게시판)의 b_name(nickname) 업데이트
//            pstmt = con.prepareStatement(updateBoardFree);
//            pstmt.setString(1, nickname);
//            pstmt.setString(2, oldNickname);
//            pstmt.executeUpdate();
//
//            pstmt = con.prepareStatement(updateBoardMovie);
//            pstmt.setString(1, nickname);
//            pstmt.setString(2, oldNickname);
//            pstmt.executeUpdate();
//
//            pstmt = con.prepareStatement(updateBoardNotice);
//            pstmt.setString(1, nickname);
//            pstmt.setString(2, oldNickname);
//            pstmt.executeUpdate();
//
//            pstmt = con.prepareStatement(updateBoardAnime);
//            pstmt.setString(1, nickname);
//            pstmt.setString(2, oldNickname);
//            pstmt.executeUpdate();
//
//            // 2. 부모 테이블 업데이트
//            pstmt = con.prepareStatement(sql);
//            pstmt.setString(1, name);
//            pstmt.setString(2, e_mail);
//            pstmt.setString(3, pw);
//            pstmt.setString(4, pw_check);
//            pstmt.setString(5, nickname);
//            pstmt.setString(6, id);
//
//            if (pstmt.executeUpdate() == 1) {
//                System.out.println("회원정보 수정 성공!");
//            }
//
//            // 커밋
//            con.commit();
//        } catch (SQLException e) {
//            if (con != null) {
//                con.rollback(); // 오류 발생 시 롤백
//            }
//            e.printStackTrace();
//            throw new SQLException("회원 정보 수정 중 오류가 발생했습니다.");
//        } finally {
//            if (con != null) {
//                con.setAutoCommit(true); // 자동 커밋을 다시 활성화
//            }
//            DBManager.close(con, pstmt, null);
//        }
//    }

















    public static void editAccount(HttpServletRequest request) {
        String name = request.getParameter("name");
        String e_mail = request.getParameter("e_mail");
        String pw = request.getParameter("pw");
        String pw_check = request.getParameter("pw_check");
        String nickname = request.getParameter("nickname");

        Connection con = null;
        PreparedStatement pstmt = null;

        // 세션에서 UserDTO 객체 가져오기 (현재 로그인한 사용자 정보)
        UserDTO user = (UserDTO) request.getSession().getAttribute("user");
        String id = user.getId();
        String oldNickname = user.getNickname();  // 기존 닉네임

        String updateSQL = "update account_table_hdh set name=?, e_mail=?, pw=?, pw_check=?, nickname=? where id=?";

        try {
            // DB 연결
            if (con == null) {
                con = DBManager.connect();
            }

            // 트랜잭션 시작
            con.setAutoCommit(false);

            // 1. 자식 테이블에서 nickname 수정
            String updateNicknameSQL = "update board_free_table set b_name = ? where b_name = ?";
            pstmt = con.prepareStatement(updateNicknameSQL);
            pstmt.setString(1, nickname);  // 새로운 닉네임
            pstmt.setString(2, oldNickname);  // 기존 닉네임
            pstmt.executeUpdate();

            pstmt.clearParameters();
            pstmt = con.prepareStatement(updateNicknameSQL);
            pstmt.setString(1, nickname);
            pstmt.setString(2, oldNickname);
            pstmt.executeUpdate();

            pstmt.clearParameters();
            pstmt = con.prepareStatement(updateNicknameSQL);
            pstmt.setString(1, nickname);
            pstmt.setString(2, oldNickname);
            pstmt.executeUpdate();

            pstmt.clearParameters();
            pstmt = con.prepareStatement(updateNicknameSQL);
            pstmt.setString(1, nickname);
            pstmt.setString(2, oldNickname);
            pstmt.executeUpdate();

            // 2. 부모 테이블 수정
            pstmt.clearParameters();
            pstmt = con.prepareStatement(updateSQL);
            pstmt.setString(1, name);
            pstmt.setString(2, e_mail);
            pstmt.setString(3, pw);
            pstmt.setString(4, pw_check);
            pstmt.setString(5, nickname);
            pstmt.setString(6, id);

            if (pstmt.executeUpdate() == 1) {
                System.out.println("회원정보 수정 성공!");
            }

            // 트랜잭션 커밋
            con.commit();

        } catch (Exception e) {
            try {
                // 오류 발생 시 롤백
                if (con != null) {
                    con.rollback();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                // 트랜잭션 종료
                if (con != null) {
                    con.setAutoCommit(true); // 자동 커밋으로 돌아감
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }
            DBManager.close(con, pstmt, null);
        }
    }





}
