package com.conan.semi.board.anime;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.text.SimpleDateFormat;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class AnimeCommentDTO {
    private String c_no;
    private String b_no; // 게시글 번호
    private String c_writer;
    private String c_content;
    private Date c_date;

    public String getFormattedDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        return sdf.format(c_date);
    }
}
