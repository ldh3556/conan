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
    <title> FIND PW OUTPUT </title>
</head>
<body>

<h1> FIND PW OUTPUT </h1>
<div class="result-container">
    <div class="info">
        <h1 class="result-message">
            ${result}
        </h1> <br>
    </div>
    <button class="back-btn" onclick="window.history.back();">뒤로가기</button>
</div>

</body>
</html>