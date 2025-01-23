package com.conan.semi.login;

import lombok.Data;

@Data
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
private String text;
}
