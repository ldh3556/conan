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

  <script>
    window.onload = function() {
      document.getElementsByName("name")[0].focus(); // "이름" 입력 필드에 커서를 두기
      updateDays();  // 페이지 로딩 시 일 수 업데이트
    };

    // 년, 월, 일에 맞춰 일 수를 동적으로 업데이트
    function updateDays() {
      var year = document.getElementsByName("birth_year")[0].value;
      var month = document.getElementsByName("birth_month")[0].value;
      var daySelect = document.getElementsByName("birth_day")[0];
      var daysInMonth = getDaysInMonth(year, month);

      // 기존 옵션을 삭제
      daySelect.innerHTML = '';

      // 새로운 일 수만큼 옵션 추가
      for (var i = 1; i <= daysInMonth; i++) {
        var option = document.createElement("option");
        option.value = i;
        option.text = i + "일";
        daySelect.appendChild(option);
      }
    }

    // 해당 년도, 월에 맞는 일 수 계산
    function getDaysInMonth(year, month) {
      month = parseInt(month, 10);
      year = parseInt(year, 10);
      // 월이 2월일 경우 윤년을 고려하여 29일로 설정
      if (month === 2) {
        return (year % 4 === 0 && (year % 100 !== 0 || year % 400 === 0)) ? 29 : 28;
      }
      // 4, 6, 9, 11월은 30일
      if ([4, 6, 9, 11].includes(month)) {
        return 30;
      }
      // 그 외의 월은 31일
      return 31;
    }
  </script>

  <style>
    .error {
      color: red;
      font-size: 12px;
    }
  </style>

</head>
<body>

<h1> REGISTER </h1> 회원이 되어 함께 소통해요! <hr>

<form action="AccountC_test" method="post">
  <div> 이름
    <input name="name" type="text" placeholder="이름을 입력하세요">
  </div> <br>

  <div> 생년월일
    <select name="birth_year" onchange="updateDays()">
      <option value="">년</option>
      <% int currentYear = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR); %>
      <% for (int year = 1960; year <= currentYear; year++) { %>
      <option value="<%= year %>" <%= (year == 1960) ? "selected" : "" %>><%= year %></option>
      <% } %>
    </select>

    <select name="birth_month" onchange="updateDays()">
      <option value="">월</option>
      <% for (int month = 1; month <= 12; month++) { %>
      <option value="<%= month %>" <%= (month == 1) ? "selected" : "" %>><%= month %></option>
      <% } %>
    </select>

    <select name="birth_day">
      <option value="">일</option>
    </select>
  </div> <br>

  <div> 성별
    <label><input name="gender" type="radio" value="남" checked="checked"> 남 </label>
    <label><input name="gender" type="radio" value="여"> 여 </label>
  </div> <br>

  <div> E-mail
    <input name="e_mail" type="text" placeholder="example@gmail.com">
  </div> <br>

  <div> 아이디
    <input name="id" type="text" placeholder="영문 대,소문자 6자리 이상"> <button>중복확인</button>
  </div>  <br>

  <div> 비밀번호
    <input name="pw" type="password" placeholder="영문 대,소문자 8자리 이상">
  </div>  <br>

  <div> 비밀번호 확인
    <input name="pw_check" type="password" placeholder="비밀번호를 확인해주세요">
  </div>  <br>

  <div> 닉네임
    <input name="nickname" type="text" placeholder="영문 대,소문자 6자, 한글 5자"> <button>중복확인</button>
  </div>  <br>

  <div>
    <button> REGISTER </button>
    <button type="button" class="back-btn" onclick="location.href='jsp/main_HDH.jsp'">메인으로</button>
  </div>
</form>

</body>
</html>


