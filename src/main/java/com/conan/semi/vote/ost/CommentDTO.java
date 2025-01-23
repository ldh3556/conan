package com.conan.semi.vote.ost;

import com.google.gson.Gson;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

//@Data
public class CommentDTO {
    private int ost_vote_comment_pk;
    private String ost_login_nickname_fk;
    private int user_pick;
    private String comment_text;
    private Date comment_date;
    private String song_title;

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
    public int getUser_pick() {
        return user_pick;
    }
    public void setUser_pick(int user_pick) {
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
    public String getSong_title() {
        return song_title;
    }
    public void setSong_title(String song_title) {
        this.song_title = song_title;
    }


    public String toJSON(){
        Gson gson = new Gson();
        return gson.toJson(this);
    }
}
