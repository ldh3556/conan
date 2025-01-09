<%--
  Created by IntelliJ IDEA.
  User: kimsuhyeon
  Date: 2025. 1. 8.
  Time: 오후 5:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="board-container">
  <div class="board-title">Notice Page</div>
  <div class="board-menu">
    <div> <a href="BoardNoticeC">공지</a></div>
    <div> <a href="BoardFreeC">자유 게시판</a></div>
    <div> <a href="BoardMangaC">만화 후기 게시판</a></div>
    <div> <a href="">애니 후기 게시판</a></div>
    <div> <a href="">영화 후기 게시판</a></div>
</div>
<div class="content">
  <jsp:include page="${content }" />
</div>






</div>
</body>
</html>
