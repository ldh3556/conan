<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>우승곡 및 댓글</title>
<%--    <link rel="stylesheet" href="css/vote/ost/ost_result.css">--%>
    <style>
        body{
            background-image: url("/img/index/sec_bg_2.jpg");
        }
        /* css/vote/ost/ost_result.css */
        .container {
            display: flex; /* 좌우 배치를 위한 Flexbox */
            justify-content: space-between; /* 양쪽 끝으로 배치 */
            align-items: flex-start; /* 세로 정렬: 위쪽 정렬 */
            gap: 20px; /* 왼쪽과 오른쪽 사이 여백 */
            padding: 20px; /* 컨테이너 패딩 */
        }

        .song-details,
        .comment-section {
            width: 50%; /* 각각 화면의 절반 크기 */
            box-sizing: border-box; /* 패딩 포함 너비 계산 */
        }

        .song-details {
            background-color: #f9f9f9; /* 밝은 배경색 */
            padding: 20px; /* 내부 여백 */
            border: 1px solid #ddd; /* 얇은 테두리 */
            border-radius: 5px; /* 모서리 둥글게 */
        }

        .comment-section {
            background-color: #ffffff; /* 흰색 배경 */
            padding: 20px; /* 내부 여백 */
            border: 1px solid #ddd; /* 얇은 테두리 */
            border-radius: 5px; /* 모서리 둥글게 */
        }

    </style>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <!-- 왼쪽: 우승곡 정보 -->
    <div class="song-details">
        <h2>우승곡 정보</h2>

        <p><strong>곡 제목:</strong> ${songTitle}</p>
        <p> ${songDescription}</p>
    </div>

    <!-- 오른쪽: 댓글 섹션 -->
    <div class="comment-section">
        <jsp:include page="/jsp/vote/ost/ost_comment.jsp" />
    </div>
    </div>

</body>
</html>
