package com.conan.semi.vote.ost;

import com.conan.semi.DBManager;
import com.conan.semi.login.UserDTO;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class OstDAO {
    //private static final Log log = LogFactory.getLog(OstDAO.class);

    public static void getBracket(HttpServletRequest req, HttpServletResponse resp) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "select * from bracket_test order by DBMS_RANDOM.RANDOM FETCH FIRST 8 ROWS ONLY";
        try {
                // 세션에서 UserDTO 객체 가져오기
                UserDTO user = (UserDTO) req.getSession().getAttribute("user");
                if (user == null) {
                    resp.getWriter().println(0); // 비로그인 상태
                    return;
                }
            con = DBManager.connect();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            req.setAttribute("id", user.getId());
            req.setAttribute("pw", user.getPw());
            req.setAttribute("nickname", user.getNickname());
            OstDTO song = null;
            ArrayList<OstDTO> songs = new ArrayList<OstDTO>();
            while (rs.next()) {
                int a = rs.getInt(1);
                String b = rs.getString(2);
                int c = rs.getInt(3);
                System.out.println(a);
                System.out.println(b);
                System.out.println(c);
                song = new OstDTO(a, b, c);
                songs.add(song);
            }

            req.setAttribute("songs", songs);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, ps, rs);
        }
    }

    public static void winCount(HttpServletRequest request) {
        String songTitle = request.getParameter("songTitle");

        // songTitle이 null인 경우 처리
        if (songTitle == null || songTitle.isEmpty()) {
            System.out.println("곡 제목이 전달되지 않았습니다.");
            return;
        }

        Connection con = null;
        PreparedStatement ps = null;
        String sql = "update bracket_test set win_count=win_count+1 where song_title=?";
        System.out.println(songTitle);
        try {
            con = DBManager.connect();
            ps = con.prepareStatement(sql);
            ps.setString(1, songTitle);

            if (ps.executeUpdate() == 1) {
                System.out.println("업데이트 성공~");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, ps, null);
        }
    }

    public static void getAllResult(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "select * from bracket_test order by win_count desc";
        try {
            request.setCharacterEncoding("utf-8");
            con = DBManager.connect();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            OstDTO song = null;
            ArrayList<OstDTO> result = new ArrayList<OstDTO>();
            while (rs.next()) {
                int a = rs.getInt(1);
                String b = rs.getString(2);
                int c = rs.getInt(3);
                System.out.println(a);
                System.out.println(b);
                System.out.println(c);
                song = new OstDTO(a, b, c);
                result.add(song);
            }
            System.out.println(result);
            request.setAttribute("result", result);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, ps, rs);
        }
    }

    public static String loginJudge(HttpServletRequest request, String insertedId, String insertedPw) {
        insertedId = request.getParameter("id");
        insertedPw = request.getParameter("pw");
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "select * from account_table_hdh where id = ?";
        String judge = "";

        try {
            con = DBManager.connect();
            ps = con.prepareStatement(sql);
            ps.setString(1, insertedId);
            rs = ps.executeQuery();
            if (rs.next()) {
                //System.out.println("결과 존재: " + rs.getString("ost_login_id"));
                String dbPw = rs.getString("pw");
                String nickName = rs.getString("nickname");  // 닉네임 가져오기
                //System.out.println("닉네임: " + nickName);  // 닉네임이 정상적으로 출력되는지 확인
                //int ost_login_pk = rs.getInt("ost_login_pk");
                if (insertedPw.equals(dbPw)) {
                    judge = "로그인 성공";
                    request.getSession().setAttribute("nickname", nickName);  // 세션에 닉네임 저장
                    //request.getSession().setAttribute("ost_login_pk", ost_login_pk);
                } else {
                    judge = "비밀번호 오류";
                }
            } else {
                judge = "존재하지 않는 회원";
            }
            request.setAttribute("result", judge);
            System.out.println(judge);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, ps, rs);
        }
        return judge;
    }


    public static void getAllComment(HttpServletRequest req, HttpServletResponse resp) {
        resp.setContentType("application/json;charset=utf-8");
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "select ovc.*, bt.song_title from ost_vote_comments ovc, bracket_test bt" +
                " where ovc.USER_PICK = bt.song_id" +
                " order by ovc.comment_date desc";
        try {
            con = DBManager.connect();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            ArrayList<String> comments = new ArrayList<>();
            CommentDTO commentDTO = null;
            while (rs.next()) {
                commentDTO = new CommentDTO();
                commentDTO.setOst_login_nickname_fk(rs.getString("ost_login_nickname_fk"));
                commentDTO.setComment_text(rs.getString("comment_text"));
                commentDTO.setUser_pick(rs.getInt("user_pick"));
                commentDTO.setComment_date(rs.getDate("comment_date"));
                commentDTO.setSong_title(rs.getString("song_title"));
                comments.add(commentDTO.toJSON());
            }
            System.out.println(comments);
            resp.setContentType("application/json;charset=utf-8");
            resp.getWriter().println(comments);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBManager.close(con, ps, rs);
        }


    }

    public static void insertComment(HttpServletRequest req, HttpServletResponse resp) {

            resp.setContentType("application/json;charset=utf-8");

            Connection con = null;
            PreparedStatement ps = null;

            try {
                // 세션에서 UserDTO 객체 가져오기
                UserDTO user = (UserDTO) req.getSession().getAttribute("user");
                if (user == null) {
                    resp.getWriter().println(0); // 비로그인 상태
                    return;
                }

            String text = req.getParameter("text");
            String pk = req.getParameter("pk");
            String nickname = user.getNickname(); // 닉네임 가져오기

            String sql = "insert into ost_vote_comments (ost_login_nickname_fk, user_pick, comment_text) values (?, ?, ?)";
            con = DBManager.connect();
            ps = con.prepareStatement(sql);
            ps.setString(1, nickname);
            ps.setString(2, pk);
            ps.setString(3, text);
            if (ps.executeUpdate() == 1) {
                resp.getWriter().println(1);
            }else{
                resp.getWriter().println(0);
            }
            }catch (Exception e) {
                e.printStackTrace();
            }finally {
                DBManager.close(con, ps, null);
            }








    }
}