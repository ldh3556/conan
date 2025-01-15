package com.conan.semi.vote.ost;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OstDTO {
    private int song_id;
    private String song_title;
    private int win_count;

}
