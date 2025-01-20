<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>우승곡 및 댓글</title>
    <link rel="stylesheet" href="css/vote/ost/ost_result.css">
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
</head>
<body>
<div class="container">
    <!-- 왼쪽: 우승곡 정보 -->
    <div class="song-details">
        <h2>우승곡 정보</h2>

        <p><strong>곡 제목:</strong> ${songTitle}</p>
        <p><strong>곡 설명:</strong> ${songDescription}</p>
    </div>



    <!-- 오른쪽: 댓글 섹션 -->
    <div class="comment-section">--%>
        <jsp:include page="/jsp/vote/ost/ost_comment.jsp" />
    </div>
    </div>

</body>
</html>
