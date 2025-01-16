<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WORLDCUP(MEN)</title>
    <style>
        /* CSS 스타일은 동일 */
    </style>
</head>
<body>

<h1>WORLDCUP(MEN)</h1>
<div id="round-title">16강</div>

<form action="/Vote_worldcupC0" method="post">
    <div id="match-area">
        <!-- selectedPhotos 목록을 반복하여 이미지와 이름을 출력 -->
        <c:forEach var="photo" items="${selectedPhotos}">
            <div class="photo-container">
                <!-- 이미지 파일 경로와 이름 출력 -->
                <img id="image${photo.name}" class="photo"
                     src="<%= request.getSession().getAttribute("imagePath") + photo.getFile() %>"
                     alt="photo${photo.name}"
                     onclick="selectPhoto('image${photo.name}')">
                <div id="name${photo.name}" class="photo-name">${photo.name}</div>
            </div>
        </c:forEach>
    </div>

    <input type="hidden" id="selectedPhoto" name="selectedPhoto">
    <div id="final-winner" style="display:none;">
        <h2>결승 승자:</h2>
        <img id="final-image" src="<%= request.getSession().getAttribute("imagePath") + finalWinner.getFile() %>" alt="final winner">
    </div>
</form>

<script>
    function selectPhoto(imageId) {
        const selectedName = document.getElementById(imageId).alt;
        document.getElementById('selectedPhoto').value = selectedName;
        document.forms[0].submit(); // 폼 제출
    }

    window.onload = function() {
        randomMatch(); // 페이지 로드 시 매칭 시작
    };
</script>

</body>
</html>
