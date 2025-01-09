<%--
  Created by IntelliJ IDEA.
  User: hwangdonghyuk
  Date: 2025. 1. 9.
  Time: 오후 4:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1> 회원가입 페이지 </h1>
회원이 되어 함께 소통해요!<br><br><br>

<form action="AccountC" method="post">
  <div> 아이디 <input name="id" type="text"></div> <br>
  <div> 비밀번호 <input name="pw" type="password"></div>  <br>
  <div> 비밀번호 확인 <input name="pw_check" type="password"></div>  <br>
  <div> 이름 <input name="name" type="text"></div>  <br>
  <div> 닉네임 <input name="nickname" type="text"></div>  <br>
  <div><button> 가입하기 </button> <button type="button" class="back-btn" onclick="location.href='jsp/login/login.jsp';">뒤로가기</button></div>
</form>

</body>
</html>
