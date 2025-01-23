<%--
  Created by IntelliJ IDEA.
  User: hwangdonghyuk
  Date: 2025. 1. 20.
  Time: 오후 5:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> 회원정보 수정 </title>

  <style>
    .error {
      font-size: 12px;
    }

    .error-red {
      color: red;
      font-size: 12px;
    }

    .error-green {
      color: green;
      font-size: 12px;
    }
  </style>

</head>
<body>

<h1> 회원정보 수정 </h1>
<hr>

<form action="MyPage_Edit_Account" method="post">
  <div> 이름
    ${sessionScope.user.name}
  </div>
  <br>

  <div> E-mail
    ${sessionScope.user.e_mail}
  </div>
  <br>

  <div> 비밀번호
    ${sessionScope.user.pw}
  </div>
  <br>

  <div> 비밀번호 확인
    <input name="pw_check" type="password" placeholder="비밀번호를 확인해주세요" oninput="validatePasswordMatch()">
    <span id="password-match-message"></span><br>
  </div>
  <br>

  <div> 닉네임
    <input name="nickname" type="text" placeholder="영문 대,소문자, 한글, 숫자 포함 가능, 3자 이상" id="nickname-input">
    <button type="button" onclick="checkNickname()">중복확인</button>
    <span id="nickname-error" class="error" style="color: red"></span> <!-- 중복 확인 결과 표시 -->
  </div>
  <br>

  <div id="register-error" class="error"></div> <!-- 아이디 또는 닉네임 중복 시 나타날 오류 메시지 -->

  <div>
    <button type="submit"> 수정완료 </button>
  </div>
</form>




</body>
</html>
