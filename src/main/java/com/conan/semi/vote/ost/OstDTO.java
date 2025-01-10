package com.conan.semi.vote.ost;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


public class OstDTO {
    int song_id;
    String song_title;
    int win_count;

    public OstDTO() {
    }

    public int getSong_id() {
        return song_id;
    }

    public void setSong_id(int song_id) {
        this.song_id = song_id;
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

    public OstDTO(int song_id, String song_title, int win_count) {
        this.song_id = song_id;
        this.song_title = song_title;
        this.win_count = win_count;
    }
}
