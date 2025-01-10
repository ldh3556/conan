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
  <title>회원가입</title>

  <style>
    .error {
      color: red;
      font-size: 12px;
    }
  </style>

  <script>
    window.onload = function() {
      document.getElementsByName("name")[0].focus(); // "이름" 입력 필드에 커서를 두기
    };
  </script>

</head>
<body>

<h1> REGISTER </h1> 회원이 되어 함께 소통해요! <hr>

<form action="AccountC_test" method="post">
  <div> 이름
    <input name="name" type="text">
  </div> <br>

  <div> 생년월일
    <input name="birth" type="text">
  </div> <br>

  <div> 성별
    <label><input name="gender" type="radio" value="남" checked="checked"> 남 </label> <label><input name="gender" type="radio" value="여"> 여 </label>
  </div> <br>

  <div> E-mail
    <input name="e_mail" type="text" placeholder="example@gmail.com">
  </div> <br>

  <div> 아이디
    <input name="id" type="text" placeholder="영문 대,소문자 6자리 이상">
  </div>  <br>

  <div> 비밀번호
    <input name="pw" type="password" placeholder="영문 대,소문자 8자리 이상">
  </div>  <br>

  <div> 비밀번호 확인
    <input name="pw_check" type="password">
  </div>  <br>

  <div> 닉네임
    <input name="nickname" type="text" placeholder="영문 대,소문자 6자, 한글 5자">
  </div>  <br>

  <div>
    <button> REGISTER </button>
    <button type="button" class="back-btn" onclick="location.href=document.referrer;">뒤로가기</button>
  </div>
</form>

</body>
</html>

