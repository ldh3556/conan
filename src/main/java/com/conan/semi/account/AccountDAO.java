package com.conan.semi.account;

import com.conan.semi.DBManager;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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

        System.out.println(name);
        System.out.println(birth_year);
        System.out.println(birth_month);
        System.out.println(birth_day);
        System.out.println(gender);
        System.out.println(e_mail);
        System.out.println(id);
        System.out.println(pw);
        System.out.println(pw_check);
        System.out.println(nickname);

        // 계정 생성 SQL 실행
        Connection con = null;
        PreparedStatement pstmt = null;
        String sql = "insert into account_table_hdh (name, birth_year, birth_month, birth_day, gender, e_mail, id, pw, pw_check, nickname) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

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

            if (pstmt.executeUpdate() == 1) {
                System.out.println("AccountDAO에서 회원정보 등록 성공!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, null);
        }
    }

    // [아이디 중복확인]
    public static String checkIdExists(HttpServletRequest request) {
        String id = request.getParameter("id");
        String result = "available";  // 기본값은 "사용 가능"으로 설정

        System.out.println(id + " checkIdExists 함수 돌입!");

        // 아이디 중복확인 SQL 실행
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
                String dbID = rs.getString(7);
                if (id.equals(dbID)) {
                    result = "exists";  // 아이디가 이미 존재하면 "exists" 반환
                    System.out.println("아이디가 DB에 존재합니다");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            result = "error";  // 오류 발생 시 "error" 반환
        } finally {
            DBManager.close(con, pstmt, rs);
        }

        return result;  // 결과 반환
    }

    // [닉네임 중복확인]
    public static String checkNicknameExists(HttpServletRequest request) {
        String nickname = request.getParameter("nickname");
        String result = "available";  // 기본값은 "사용 가능"으로 설정

        System.out.println("닉네임 확인 요청: " + nickname);  // 전달된 닉네임 값 확인

        // 닉네임 중복확인 SQL 실행
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "select * from account_table_hdh where nickname = ?";

        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, nickname);

            // 쿼리 실행
            rs = pstmt.executeQuery();

            if (rs.next()) {
                String dbNickname = rs.getString("nickname");
                System.out.println("DB에서 찾은 닉네임: " + dbNickname);  // DB에서 찾은 닉네임 출력

                // 입력된 닉네임과 DB에서 찾은 닉네임이 일치하는지 확인
                if (nickname.equals(dbNickname)) {
                    result = "exists";  // 닉네임이 이미 존재하면 "exists" 반환
                    System.out.println("닉네임이 DB에 존재합니다.");
                }
            } else {
                System.out.println("닉네임이 DB에 존재합니다.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            result = "error";  // 오류 발생 시 "error" 반환
        } finally {
            DBManager.close(con, pstmt, rs);
        }

        return result;  // 결과 반환
    }



}