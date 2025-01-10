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
</head>
<body>

<h1> LOGIN </h1>
아직 아이디가 없으신가요?  | <a href="/AccountC_test"> 회원가입 </a> <br>
<a href="/Find_IDC"> 아이디 찾기 </a> | <a href="/Find_PWC"> 비밀번호 찾기 </a> <hr>

<form action="LoginC_test" method="post">
    <div> ID <input name="id" type="text" placeholder="ID를 입력하세요"></div> <br>
    <div> PW <input name="pw" type="password" placeholder="PW를 입력하세요"> </div> <br>
    <div> <button> LOGIN </button>
    <button type="button" class="back-btn" onclick="location.href=document.referrer;">뒤로가기</button>
    </div>
</form>

</body>
</html>