<%--
  Created by IntelliJ IDEA.
  User: kimsuhyeon
  Date: 2025. 1. 8.
  Time: 오후 5:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
        crossorigin="anonymous"></script>
<script type="text/javascript" src="js/vote/board/board.js"></script>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/board/board.css">
    <link rel="stylesheet" href="/css/index.css">
</head>
<body>
<div class="board_wrapper">
    <div class="header">

        </button>
        <a class="conan_logo" href="/index.jsp">
            <img src="/img/index/logoimg.png">
        </a>
        <jsp:include page="${loginPage}"></jsp:include>
    </div>
    <div class="board_wrap">
        <div class="board_title">

            <a href="BoardHC"><h1>Community</h1></a>

            <div class="board_menu">
                <div><a href="BoardNoticeC">공지사항</a></div>
                <div><a href="BoardFreeC">자유게시판</a></div>
                <div><a href="BoardAnimeC">애니&만화 후기게시판</a></div>
                <div><a href="BoardMovieC">영화 후기게시판</a></div>
            </div>
        </div>

        <div class="content_board">
            <jsp:include page="${content }"/>
        </div>
    </div>
</div>
</body>
</html>
