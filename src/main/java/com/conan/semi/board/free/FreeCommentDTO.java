package com.conan.semi.board.free;
import java.util.Date;

public class FreeCommentDTO {
    private String c_no;
    private String b_no; // 게시글 번호
    private String c_writer;
    private String c_content;
    private Date c_date;

    public FreeCommentDTO() {}

    public FreeCommentDTO(String c_no, String b_no, String c_writer, String c_content, Date c_date) {
        this.c_no = c_no;
        this.b_no = b_no;
        this.c_writer = c_writer;
        this.c_content = c_content;
        this.c_date = c_date;
    }

    public String getC_no() { return c_no; }
    public void setC_no(String c_no) { this.c_no = c_no; }

    public String getB_no() { return b_no; }
    public void setB_no(String b_no) { this.b_no = b_no; }

    public String getC_writer() { return c_writer; }
    public void setC_writer(String c_writer) { this.c_writer = c_writer; }

    public String getC_content() { return c_content; }
    public void setC_content(String c_content) { this.c_content = c_content; }

    public Date getC_date() { return c_date; }
    public void setC_date(Date c_date) { this.c_date = c_date; }

    @Override
    public String toString() {
        return "FreeCommentDTO{" +
                "c_no='" + c_no + '\'' +
                ", b_no='" + b_no + '\'' +
                ", c_writer='" + c_writer + '\'' +
                ", c_content='" + c_content + '\'' +
                ", c_date=" + c_date +
                '}';
    }
}
