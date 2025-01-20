package com.conan.semi.vote.ost;

import lombok.*;

//@Data
//@NoArgsConstructor
//@AllArgsConstructor
public class OstDTO {
    private int song_id;
    private String song_title;
    private int win_count;

    public OstDTO() {

    }

    public OstDTO(int song_id, String song_title, int win_count) {
        this.song_id = song_id;
        this.song_title = song_title;
        this.win_count = win_count;

    }

    public String getSong_title() {
        return song_title;
    }
    public void setSong_title(String song_title) {
        this.song_title = song_title;
    }
    public int getWin_count() {
        return win_count;
    }
    public void setWin_count(int win_count) {
        this.win_count = win_count;
    }
    public int getSong_id() {
        return song_id;
    }
    public void setSong_id(int song_id) {
        this.song_id = song_id;
    }

}
