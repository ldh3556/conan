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
</head>
<body>

<h1> LOGIN OUTPUT </h1>
<div class="result-container">
    <div class="info">
        ID: ${param.id} <br>
        PW: ${param.pw}
    </div>
    <hr>
    <h1 class="result-message">${result}</h1>
    <button class="back-btn" onclick="window.history.back();">뒤로가기</button>
</div>

</body>
</html>