package com.conan.semi.login;

import com.conan.semi.DBManager;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FindDAO {
    public static void findID(HttpServletRequest request) {
        String name = request.getParameter("name");
        String e_mail = request.getParameter("e_mail");

        // 입력 값이 없을 경우 처리
        if (name == null || name.trim().isEmpty() || e_mail == null || e_mail.trim().isEmpty()) {
            request.setAttribute("result", "아이디와 이메일을 모두 입력해 주세요.");
            return;  // 더 이상 진행하지 않고 종료
        }

        System.out.println(name + " & " + e_mail);

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select * from account_table_hdh where e_mail = ?";

        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, e_mail);

            // db tbl 과 비교
            rs = pstmt.executeQuery();

            String msg = null;
            if (rs.next()) {
                String dbName = rs.getString(2);
                String dbE_mail = rs.getString(7);
                String dbId = rs.getString(8);
                if (e_mail.equals(dbE_mail) && name.equals(dbName)) {
                    msg = "'" + dbName + "'" + " 님의 아이디는 [ " + dbId + " ] 입니다.";
                } else {
                    msg = "이름 입력 오류입니다.";
                }
            } else {
                msg = "계정이 존재하지 않습니다.";
            }
            request.setAttribute("result", msg);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, rs);
        }
    }

    public static void findPW(HttpServletRequest request) {
//        String id = request.getParameter("id");
//        String e_mail = request.getParameter("e_mail");
//
//        System.out.println(id + "&" + e_mail);

//        Connection con = null;
//        PreparedStatement pstmt = null;
//        ResultSet rs = null;
//
//        String sql = "select * from account_table_hdh where id = ?";
//
//        try {
//            con = DBManager.connect();
//            pstmt = con.prepareStatement(sql);
//            pstmt.setString(1, id);
//
//            // db tbl 과 비교
//            rs = pstmt.executeQuery();
//
//            String msg = null;
//            if (rs.next()) {
//                String dbName = rs.getString(1);
//                String dbId = rs.getString(7);
//                String dbPw = rs.getString(8);
//                if (id.equals(dbId)) {
//                    msg = "'" + dbName + "'" + " 님의 비밀번호는 [ " + dbPw + " ] 입니다.";
//                } else {
//                    msg = "입력 오류입니다.";
//                }
//            } else {
//                msg = "계정이 존재하지 않습니다.";
//            }
//            request.setAttribute("result", msg);
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            DBManager.close(con, pstmt, rs);
//        }
//    }

        // 입력 받은 정보
        String id = request.getParameter("id").trim();
        String birth_year = request.getParameter("birth_year").trim();
        String birth_month = request.getParameter("birth_month").trim();
        String birth_day = request.getParameter("birth_day").trim();
        String gender = request.getParameter("gender").trim();
        String e_mail = request.getParameter("e_mail").trim();

        // 필수 입력 값 체크
        if (id == null || id.isEmpty() || birth_year.isEmpty() || birth_month.isEmpty() || birth_day.isEmpty() || gender.isEmpty() || e_mail.isEmpty()) {
            request.setAttribute("result", "정보를 모두 입력해 주세요.");
            return;
        }

        System.out.println("입력 값: " + id + " " + birth_year + "-" + birth_month + "-" + birth_day + " " + gender + " " + e_mail);

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // SQL 쿼리 (날짜 형식 맞추기)
        String sql = "SELECT * FROM account_table_hdh WHERE id = ? AND TO_DATE(birth_year || '-' || birth_month || '-' || birth_day, 'yyyy-mm-dd') = TO_DATE(?, 'yyyy-mm-dd') AND gender = ? AND e_mail = ?";

        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, birth_year + "-" + birth_month + "-" + birth_day);
            pstmt.setString(3, gender);
            pstmt.setString(4, e_mail);

            rs = pstmt.executeQuery();

            String msg = null;
            if (rs.next()) {
                String dbId = rs.getString("id");
                String dbPw = rs.getString("pw");

                // 비밀번호가 일치하면 보여주기
                if (id.equals(dbId)) {
                    msg = "'" + dbId + "'" + " 님의 비밀번호는 [ " + dbPw + " ] 입니다.";
                } else {
                    msg = "입력하신 정보에 해당하는 계정이 없습니다.";
                }
            } else {
                msg = "입력하신 정보에 해당하는 계정이 없습니다.";
            }

            request.setAttribute("result", msg);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("result", "서버 오류가 발생했습니다. 잠시 후 다시 시도해 주세요.");
        } finally {
            DBManager.close(con, pstmt, rs);
        }
    }
}