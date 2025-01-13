<%--
  Created by IntelliJ IDEA.
  User: hwangdonghyuk
  Date: 2025. 1. 9.
  Time: 오후 4:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<html>
<head>
  <title>회원가입</title>

  <style>
    .error {
      color: red;
      font-size: 12px;
    }
  </style>
</head>
<body>

<h1> 회원가입 페이지 </h1> 회원이 되어 함께 소통해요!<hr>

<form action="AccountC_test" method="post">
  <div> 아이디
    <input name="id" type="text">
    <%-- 아이디 중복 체크 메시지 --%>
    <c:if test="${not empty idExists}">
      <span class="error">이미 존재하는 아이디 입니다</span>
    </c:if>
  </div> <br>

  <div> 비밀번호
    <input name="pw" type="password">
  </div>  <br>

  <div> 비밀번호 확인
    <input name="pw_check" type="password">
  </div>  <br>

  <div> 이름
    <input name="name" type="text">
  </div>  <br>

  <div> 닉네임
    <input name="nickname" type="text">
    <%-- 닉네임 중복 체크 메시지 --%>
    <c:if test="${not empty nicknameExists}">
      <span class="error">이미 존재하는 닉네임 입니다</span>
    </c:if>
  </div>  <br>

  <div>
    <button> 가입하기 </button>
    <button type="button" class="back-btn" onclick="location.href=document.referrer;">뒤로가기</button>
  </div>
</form>

</body>
</html>

