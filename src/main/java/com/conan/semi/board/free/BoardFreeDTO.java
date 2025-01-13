package com.conan.semi.board.free;

import java.util.Date;

public class BoardFreeDTO {
    private String b_no;
    private String b_id;
    private String b_name;
    private String b_begin;
    private String b_title;
    private String b_text;
    private Date b_date;

    public BoardFreeDTO() {
    }

    public BoardFreeDTO(String b_no, String b_id, String b_name, String b_title, String b_text, Date b_date) {
        this.b_no = b_no;
        this.b_id = b_id;
        this.b_name = b_name;
        this.b_begin = b_begin;
        this.b_title = b_title;
        this.b_text = b_text;
        this.b_date = b_date;
    }

    public String getB_no() {
        return b_no;
    }

    public void setB_no(String b_no) {
        this.b_no = b_no;
    }

    public String getB_id() {
        return b_id;
    }

    public void setB_id(String b_id) {
        this.b_id = b_id;
    }

    public String getB_name() {
        return b_name;
    }

    public void setB_name(String b_name) {
        this.b_name = b_name;
    }
public String getB_begin() {
        return b_begin;
}
public void setB_begin(String b_begin) {
        this.b_begin = b_begin;
}
    public String getB_title() {
        return b_title;
    }

    public void setB_title(String b_title) {
        this.b_title = b_title;
    }

    public String getB_text() {
        return b_text;
    }

    public void setB_text(String b_text) {
        this.b_text = b_text;
    }

    public Date getB_date() {
        return b_date;
    }

    public void setB_date(Date b_date) {
        this.b_date = b_date;
    }

    @Override
    public String toString() {
        return "BoardFreeDTO{" +
                "b_no='" + b_no + '\'' +
                ", b_id='" + b_id + '\'' +
                ", b_name='" + b_name + '\'' +
                ", b_begin='" + b_begin + '\'' +
                ", b_title='" + b_title + '\'' +
                ", b_text='" + b_text + '\'' +
                ", b_date=" + b_date +
                '}';
    }
}

