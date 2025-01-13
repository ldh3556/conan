<%--
  Created by IntelliJ IDEA.
  User: hwangdonghyuk
  Date: 2025. 1. 13.
  Time: 오후 5:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>눈 코 입 퀴즈</title>
  <link rel="stylesheet" href="css/game/puzzle/puzzle.css">
</head>
<body>

<div class="quiz-container">
  <div class="top-row">
    <div class="eye left-eye" id="left-eye"></div>
    <div class="nose" id="nose"></div>
    <div class="eye right-eye" id="right-eye"></div>
  </div>
  <div class="bottom-row">
    <div class="mouth" id="mouth"></div>
  </div>
</div>
<div id="result"></div>

<script src="js/game/puzzle/puzzle.js"></script>

</body>
</html>
