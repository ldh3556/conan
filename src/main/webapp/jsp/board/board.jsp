<%--
  Created by IntelliJ IDEA.
  User: kimsuhyeon
  Date: 2025. 1. 8.
  Time: 오후 5:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/vote/board/board.js"></script>
<head>
    <title>Title</title>
</head>
<body>
<div class="board-container">
  <div class="board-title"><a href="BoardHC"><h1>게시판</h1></a></div>
  <hr>
  <div class="board-menu">
    <div> <a href="BoardNoticeC">공지</a></div>
    <div> <a href="BoardFreeC">자유 게시판</a></div>
    <div> <a href="BoardAnimeC">애니&만화 후기 게시판</a></div>
    <div> <a href="BoardMovieC">영화 후기 게시판</a></div>
</div>
  <hr>
<div class="content">
  <jsp:include page="${content }" />
</div>
</div>
</body>
</html>
