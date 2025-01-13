package com.conan.semi.login;

import javax.servlet.http.HttpServletRequest;

public class LoginDAO_test {
    public static void login(HttpServletRequest request) {
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    System.out.println(id);
    System.out.println(pw);

    }
}
