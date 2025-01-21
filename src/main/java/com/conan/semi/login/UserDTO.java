package com.conan.semi.login;

public class UserDTO {
    // DTO 만들 때는 무조건 DB 보면서 순서 그대로 베끼기
private String no;
private String name;
private String birth_year;
private String birth_month;
private String birth_day;
private String gender;
private String e_mail;
private String id;
private String pw;
private String pw_check;
private String nickname;

    public UserDTO() {
        // TODO Auto-generated constructor stub
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirth_year() {
        return birth_year;
    }

    public void setBirth_year(String birth_year) {
        this.birth_year = birth_year;
    }

    public String getBirth_month() {
        return birth_month;
    }

    public void setBirth_month(String birth_month) {
        this.birth_month = birth_month;
    }

    public String getBirth_day() {
        return birth_day;
    }

    public void setBirth_day(String birth_day) {
        this.birth_day = birth_day;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getE_mail() {
        return e_mail;
    }

    public void setE_mail(String e_mail) {
        this.e_mail = e_mail;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getPw_check() {
        return pw_check;
    }

    public void setPw_check(String pw_check) {
        this.pw_check = pw_check;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }
    
    @Override
    public String toString() {
        return "UserDTO [no=" + no + ", name=" + name + ", birth_year=" + birth_year + ", birth_month=" + birth_month + ", birth_day=" + birth_day + ", gender=" + gender + ", e_mail=" + e_mail + ", id=" + id + ", pw=" + pw + ", pw_check=" + pw_check + ", nickname=" + nickname + "]";
    }
}
