package com.conan.semi.vote.ost;

import lombok.*;

@Data
//@NoArgsConstructor
//@AllArgsConstructor
public class OstDTO {
    private int song_id;
    private String song_title;
    private int win_count;

    public OstDTO(int song_id, String song_title, int win_count) {
        this.song_id = song_id;
        this.song_title = song_title;
        this.win_count = win_count;
    }

    public OstDTO() {

    }
}
