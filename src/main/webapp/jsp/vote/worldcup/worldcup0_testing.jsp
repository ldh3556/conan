<%--
  Created by IntelliJ IDEA.
  User: hwangdonghyuk
  Date: 2025. 1. 15.
  Time: 오전 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> WORLDCUP(MEN) </title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
        }

        h1 {
            margin-top: 50px;
        }

        #round-title {
            font-size: 24px;
            font-weight: bold;
            margin-top: 30px;
            margin-bottom: 20px;
        }

        #match-area {
            display: flex;
            justify-content: center;
            margin-top: 50px;
        }

        .photo-container {
            display: inline-block;
            text-align: center;
            margin: 10px;
        }

        .photo {
            width: 250px;
            height: 250px;
            object-fit: cover;
            border-radius: 10px;
            transition: transform 0.2s;
            cursor: pointer;
        }

        .photo:hover {
            transform: scale(1.1);
        }

        .photo-name {
            margin-top: 10px;
            font-size: 16px;
            color: #333;
        }

        #final-winner img {
            width: 300px;
            margin-top: 30px;
        }

        h2 {
            color: #333;
        }
    </style>
</head>
<body>

<h1> WORLDCUP(MEN) </h1>
<div id="round-title">16강</div>

<form action="/Vote_worldcupC" method="post">
    <div id="match-area">
        <div class="photo-container">
            <img id="image1" class="photo" src="" alt="photo1" onclick="selectPhoto('image1')">
            <div id="name1" class="photo-name"></div>
        </div>
        <div class="photo-container">
            <img id="image2" class="photo" src="" alt="photo2" onclick="selectPhoto('image2')">
            <div id="name2" class="photo-name"></div>
        </div>
    </div>

    <input type="hidden" id="selectedPhoto" name="selectedPhoto">
    <div id="final-winner" style="display:none;">
        <h2>결승 승자:</h2>
        <img id="final-image" src="" alt="final winner">
    </div>
</form>

<script>
    let selectedPhotos = <%= request.getSession().getAttribute("selectedPhotos") %>;
    let round = <%= request.getSession().getAttribute("round") %>;
    let totalSelections = <%= request.getSession().getAttribute("totalSelections") %>;

    function randomMatch() {
        if (selectedPhotos.length > 1 && totalSelections > 0) {
            const photo1 = selectedPhotos.pop();
            const photo2 = selectedPhotos.pop();

            // 사진과 이름 업데이트
            document.getElementById("image1").src = "img/vote/worldcup/men/" + photo1.file;
            document.getElementById("name1").textContent = photo1.name;
            document.getElementById("image2").src = "img/vote/worldcup/men/" + photo2.file;
            document.getElementById("name2").textContent = photo2.name;
        }
    }

    function selectPhoto(imageId) {
        const selectedImage = document.getElementById(imageId);
        const selectedName = document.getElementById(imageId === 'image1' ? 'name1' : 'name2').textContent;

        // 선택된 이미지를 hidden input에 저장
        document.getElementById('selectedPhoto').value = selectedName;

        // 폼을 제출하여 결과 전송
        document.forms[0].submit();
    }

    window.onload = function() {
        randomMatch(); // 페이지가 로드되면 첫 매칭 시작
    };
</script>

</body>
</html>
