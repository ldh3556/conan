<%--
  Created by IntelliJ IDEA.
  User: hwangdonghyuk
  Date: 2025. 1. 9.
  Time: 오후 4:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> LOGIN_TEST </title>
    <link rel="stylesheet" href="/css/login/login.css">
</head>
<body>
<div class="wrapper">
    <div class="sec01_L">
        <a href="/jsp/index_lmj.jsp"><img src="//img/login/logoimg.png"></a>
    </div>
    <div class="sec01_R">
        <div class="deco_line"></div>
        <h1> LOGIN </h1>
        <div class="reg_text_wrapper">
            <div class="to_reg">
                <span>아직 아이디가 없으신가요?</span>
                <a href="/AccountC"> 회원가입 </a> <br>
            </div>
            <div class="to_find">
                <a href="/Find_IDC"> 아이디 찾기 </a>
                <a href="/Find_PWC"> 비밀번호 찾기 </a>
            </div>
        </div>

        <div class="login_input_box">
            <form action="LoginC" method="post">
                <div id="input_id"> <span>ID</span> <input name="id" type="text" placeholder="ID를 입력하세요"></div>
                <div id="input_pw"> <span>PW</span> <input name="pw" type="password" placeholder="PW를 입력하세요"></div>
                <div class="input_button">
                    <button> LOGIN</button>
                    <button type="button" class="back-btn" onclick="location.href='index.jsp'">메인으로</button>
                </div>
            </form>
        </div>
    </div>

</div>
<div class="footer">
    <a>이용약관</a>
    <a>개인정보 처리방침</a>
    <a>About us</a>
</div>
</body>
</html>