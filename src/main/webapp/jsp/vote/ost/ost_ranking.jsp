<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>우승곡 목록</title>
    <style>
        .song-list {
            display: flex;
            flex-direction: column;
            margin-top: 20px;
        }
        .song-item {
            display: flex;
            justify-content: space-between;
            padding: 10px;
            border: 1px solid #ddd;
            margin-bottom: 5px;
            background-color: #f9f9f9;
        }
        .song-item:nth-child(even) {
            background-color: #f2f2f2;
        }
        .song-item .song-id, .song-item .song-title, .song-item .win-count {
            width: 30%;
        }
    </style>
</head>
<body>
<div class="song-list">
    <div class="song-item">
        <div class="song-id">순위</div>
        <div class="song-title">노래 제목</div>
        <div class="win-count">우승 횟수</div>
    </div>
</div>
<!-- result가 null이 아니고 비어있지 않으면 결과 출력 -->
<c:if test="${not empty result}">
    <div class="song-list">
        <!-- result 리스트를 반복하여 출력 -->
        <c:forEach var="song" items="${result}" varStatus="status">
            <div class="song-item">
                <div class="song-id">${status.index + 1}</div>
                <div class="song-title">${song.song_title}</div>
                <div class="win-count">${song.win_count}</div>
            </div>
        </c:forEach>
    </div>
</c:if>

<!-- 만약 result가 비어있다면 "결과가 없습니다" 출력 -->
<c:if test="${empty result}">
    <p>결과가 없습니다.</p>
</c:if>
</body>
</html>
