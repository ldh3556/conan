package com.conan.semi.login;

import com.conan.semi.DBManager;

import javax.servlet.http.HttpServletRequest;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class EditDAO_gpt {
    public static void editAccount(HttpServletRequest request) {
        // 요청 파라미터
        String name = request.getParameter("name");
        String e_mail = request.getParameter("e_mail");
        String pw = request.getParameter("pw");
        String pw_check = request.getParameter("pw_check");
        String nickname = request.getParameter("nickname");

        // 세션에서 현재 로그인한 사용자의 ID 가져오기
        String currentUserId = (String) request.getSession().getAttribute("userId");

        // 디버깅용 출력
        System.out.println(name);
        System.out.println(e_mail);
        System.out.println(pw);
        System.out.println(pw_check);
        System.out.println(nickname);

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        // 닉네임 중복 체크 쿼리
        String checkNicknameSql = "select * from account_table_hdh where nickname = ? and id != ?";

        try {
            // DB 연결
            if (con == null) { // con이 null일 때만 연결
                con = DBManager.connect();
            }

            // 닉네임 중복 체크
            pstmt = con.prepareStatement(checkNicknameSql);
            pstmt.setString(1, nickname);   // 수정하려는 닉네임
            pstmt.setString(2, currentUserId); // 세션에서 가져온 현재 사용자의 ID

            rs = pstmt.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                // 닉네임이 다른 사용자에게 이미 존재하는 경우
                System.out.println("이미 사용 중인 닉네임입니다. 다른 닉네임을 입력하세요.");
                return; // 닉네임 중복 시 더 이상 진행하지 않음
            }

            // 닉네임 중복이 없으면 회원 정보 수정
            String updateSql = "UPDATE account_table_hdh SET name=?, e_mail=?, pw=?, pw_check=?, nickname=? WHERE id=?";
            pstmt = con.prepareStatement(updateSql);
            pstmt.setString(1, name);
            pstmt.setString(2, e_mail);
            pstmt.setString(3, pw);
            pstmt.setString(4, pw_check);
            pstmt.setString(5, nickname);
            pstmt.setString(6, currentUserId); // 세션에서 가져온 현재 사용자의 ID로 수정

            if (pstmt.executeUpdate() == 1) {
                System.out.println("회원정보 수정 성공!");
            } else {
                System.out.println("회원정보 수정 실패!");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, pstmt, rs); // ResultSet도 닫기
        }
    }
}
