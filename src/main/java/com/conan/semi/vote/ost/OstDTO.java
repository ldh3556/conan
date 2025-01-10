package com.conan.semi.vote.ost;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OstDTO {
    int song_id;
    String song_title;
    int win_count;


}
