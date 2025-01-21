package com.conan.semi.vote.ost;

import com.google.gson.Gson;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

//@Data
@Getter
@Setter
public class CommentDTO {
    private int ost_vote_comment_pk;
    private String ost_login_nickname_fk;
    private int user_pick;
    private String comment_text;
    private Date comment_date;
    private String song_title;

    public String toJSON(){
        Gson gson = new Gson();
        return gson.toJson(this);
    }
}
