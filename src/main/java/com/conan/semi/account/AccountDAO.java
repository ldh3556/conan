package com.conan.semi.account;

import com.conan.semi.DBManager;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDAO {


    // 계정 생성
    public static void regUser(HttpServletRequest request) {
        String name = request.getParameter("name");
        String birth_year = request.getParameter("birth_year");
        String birth_month = request.getParameter("birth_month");
        String birth_day = request.getParameter("birth_day");
        String gender = request.getParameter("gender");
        String e_mail = request.getParameter("e_mail");
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String pw_check = request.getParameter("pw_check");
        String nickname = request.getParameter("nickname");

        // 비밀번호 확인
        if (!pw.equals(pw_check)) {
            System.out.println("비밀번호 불일치");
            return;  // 비밀번호 불일치 시 종료
        }

        // 중복 확인 (아이디, 이메일, 닉네임)
        String idCheck = checkIdExists(request);
        String emailCheck = checkEmailExists(request);
        String nicknameCheck = checkNicknameExists(request);

        if ("exists".equals(idCheck) || "exists".equals(emailCheck) || "exists".equals(nicknameCheck)) {
            System.out.println("아이디, 이메일 또는 닉네임이 이미 존재합니다.");
            return;  // 중복된 값이 있으면 종료
        }

        // 계정 생성 SQL 실행
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "insert into account_table_hdh (no, name, birth_year, birth_month, birth_day, gender, e_mail, id, pw, pw_check, nickname) "
                + "values (account_table_hdh_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, birth_year);
            pstmt.setString(3, birth_month);
            pstmt.setString(4, birth_day);
            pstmt.setString(5, gender);
            pstmt.setString(6, e_mail);
            pstmt.setString(7, id);
            pstmt.setString(8, pw);
            pstmt.setString(9, pw_check);
            pstmt.setString(10, nickname);

            // executeUpdate는 결과를 반환하지 않음. 실행 성공 시 1을 반환
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected == 1) {
                System.out.println("회원정보 등록 성공!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, null); // rs가 없으므로 null 전달
        }
    }

    // 아이디 중복 확인
    public static String checkIdExists(HttpServletRequest request) {
        String id = request.getParameter("id");
        String result = "available";  // 기본값은 "사용 가능"으로 설정

        System.out.println(id + " checkIdExists 함수 돌입!");

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "select * from account_table_hdh where id = ?";


        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();


            if (rs.next()) {
                result = "exists";  // 아이디가 이미 존재하면 "exists" 반환
                System.out.println("아이디가 DB에 존재합니다");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            result = "error";  // 오류 발생 시 "error" 반환
        } finally {
            DBManager.close(con, pstmt, rs);
        }

        return result;  // 결과 반환
    }

    // 이메일 중복 확인
    public static String checkEmailExists(HttpServletRequest request) {
        String e_mail = request.getParameter("e_mail");
        String result = "available";  // 기본값은 "사용 가능"으로 설정

        System.out.println("이메일 확인 요청: " + e_mail);

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "select * from account_table_hdh where e_mail = ?";

        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, e_mail);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                result = "exists";  // 이메일이 이미 존재하면 "exists" 반환
                System.out.println("이메일이 DB에 존재합니다.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            result = "error";  // 오류 발생 시 "error" 반환
        } finally {
            DBManager.close(con, pstmt, rs);
        }

        return result;  // 결과 반환
    }

    // 닉네임 중복 확인
    public static String checkNicknameExists(HttpServletRequest request) {
        String nickname = request.getParameter("nickname");
        String result = "available";  // 기본값은 "사용 가능"으로 설정

        System.out.println("닉네임 확인 요청: " + nickname);

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "select * from account_table_hdh where nickname = ?";

        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, nickname);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                result = "exists";  // 닉네임이 이미 존재하면 "exists" 반환
                System.out.println("닉네임이 DB에 존재합니다.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            result = "error";  // 오류 발생 시 "error" 반환
        } finally {
            DBManager.close(con, pstmt, rs);
        }

        return result;  // 결과 반환

    }
}
