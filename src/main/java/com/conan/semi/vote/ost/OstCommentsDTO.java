package com.conan.semi.vote.ost;

import java.util.Date;

public class OstCommentsDTO {
    private int ost_vote_comment_pk;
    private String ost_login_nickname_fk;
    private String user_pick;
    private String comment_text;
    private Date comment_date;

    public OstCommentsDTO() {

    }

    public OstCommentsDTO(int ost_vote_comment_pk, String ost_login_nickname_fk, String user_pick, String comment_text, Date comment_date){
        super();
        this.ost_vote_comment_pk = ost_vote_comment_pk;
        this.ost_login_nickname_fk = ost_login_nickname_fk;
        this.user_pick = user_pick;
        this.comment_text = comment_text;
        this.comment_date = comment_date;
    }

    public int getOst_vote_comment_pk() {
        return ost_vote_comment_pk;
    }
    public void setOst_vote_comment_pk(int ost_vote_comment_pk) {
        this.ost_vote_comment_pk = ost_vote_comment_pk;
    }
    public String getOst_login_nickname_fk() {
        return ost_login_nickname_fk;
    }
    public void setOst_login_nickname_fk(String ost_login_nickname_fk) {
        this.ost_login_nickname_fk = ost_login_nickname_fk;
    }
    public String getUser_pick() {
        return user_pick;
    }
    public void setUser_pick(String user_pick) {
        this.user_pick = user_pick;
    }
    public String getComment_text() {
        return comment_text;
    }
    public void setComment_text(String comment_text) {
        this.comment_text = comment_text;
    }
    public Date getComment_date() {
        return comment_date;
    }
    public void setComment_date(Date comment_date) {
        this.comment_date = comment_date;
    }


}
