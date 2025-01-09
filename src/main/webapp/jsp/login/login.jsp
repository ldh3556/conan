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
    <title>Title</title>
</head>
<body>

<h1> 로그인 페이지 </h1>

<form action="LoginC" method="post">
  <div> 아이디 <input name="id" type="text"> </div> <br>
  <div> 비밀번호 <input name="pw" type="password"> </div> <br>
  <div> <button> 로그인 </button> </div> <br>
</form>
<div> <a href="jsp/account/account.jsp"> 회원가입 </a> </div>

</body>
</html>
