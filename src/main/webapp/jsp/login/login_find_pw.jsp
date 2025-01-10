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
    <title> FIND_PW_TEST </title>
</head>
<body>

<h1> 비밀번호 찾기 </h1>
<a href="/Find_IDC"> 아이디 찾기 </a> <hr>

<form action="/Find_PWC" method="post">
    <div> ID <input name="id" type="text" placeholder="ID를 입력하세요"></div> <br>
    <div> 생년월일 <input name="birth" type="date"> </div> <br>
    <div> 성별 <label><input name="gender" type="radio" value="남" checked="checked"> 남 </label> <label><input name="gender" type="radio" value="여"> 여 </label> </div> <br>
    <div> E-mail <input name="e_mail" type="text" placeholder="example@gmail.com"> </div> <br>
    <div> <button> FIND PW </button>
    <button type="button" class="back-btn" onclick="location.href=document.referrer;">뒤로가기</button>
    </div>
</form>

</body>
</html>