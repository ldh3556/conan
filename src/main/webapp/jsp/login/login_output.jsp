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
    <title> LOGIN OUTPUT </title>
    <link rel="stylesheet" href="//css/login/login.css">
</head>
<body>

<h1> LOGIN OUTPUT </h1>
<div class="result-container">
    <div class="info">
        환영합니다, ${sessionScope.user.nickname} 님
    </div>
    <div class="user-container">
        <a href="/LogoutC"> 로그아웃 </a> / <a href="/MyPageC"> 마이페이지 </a>
<div class="wrapper">
    <div class="sec01_L">
        <a href="/jsp/index_lmj.jsp"><img src="/img/login/logoimg.png"></a>
    </div>
    <div class="sec01_R">
        <div class="deco_line"></div>
        <h1> LOGIN OUTPUT </h1>
        <div class="reg_text_wrapper">

            <div class="info">
                <span>ID: ${param.id}</span>
                <span>PW: ${param.pw}</span>
            </div>
            <h1 class="result-message">${result}</h1>
            <div class="input_button">
                <button class="back-btn" onclick="window.history.back();">뒤로가기</button>
                <button type="button" class="back-btn" onclick="location.href='jsp/main_HDH.jsp'">메인으로</button>
            </div>
        </div>
    </div>

</div>
<div class="footer"></div>



</body>
</html>