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
    <title> FIND_ID_TEST </title>
</head>
<body>

<h1> 아이디 찾기 </h1>
<a href="/Find_PWC"> 비밀번호 찾기 </a> <hr>

<form action="/Find_IDC" method="post">
    <div> 이름 <input name="name" type="text" placeholder="이름을 입력하세요"></div> <br>
    <div> E-mail <input name="e_mail" type="text" placeholder="example@gmail.com"> </div> <br>
    <div> <button> FIND ID </button>
    <button type="button" class="back-btn" onclick="location.href='jsp/main_test.jsp'">메인으로</button>
    </div>
</form>

</body>
</html>