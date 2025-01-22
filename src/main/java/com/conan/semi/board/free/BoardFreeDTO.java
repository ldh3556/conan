package com.conan.semi.board.free;

import com.google.gson.Gson;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.text.SimpleDateFormat;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class BoardFreeDTO {
    private String b_no;
    private String b_id;
    private String b_name;
    private String b_begin;
    private String b_title;
    private String b_text;
    private Date b_date;


	public String getFormattedDate() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        return sdf.format(b_date);
    }

    public String toJSONByMe() {
        Gson gson = new Gson();
        return gson.toJson(this);
    }

}


