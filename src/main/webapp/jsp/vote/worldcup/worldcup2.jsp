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
    <title> WORLDCUP </title>
    <style>
        /* 기본 스타일 */
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
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
            height: 250px; /* 사진 크기 고정 */
            object-fit: cover; /* 사진 비율 맞추기 */
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

<div id="match-area">
    <div id="match-1">
        <div class="photo-container">
            <img id="image1" class="photo" src="" alt="photo1">
            <div id="name1" class="photo-name"></div>
        </div>
        <div class="photo-container">
            <img id="image2" class="photo" src="" alt="photo2">
            <div id="name2" class="photo-name"></div>
        </div>
    </div>
</div>

<div id="final-winner" style="display:none;">
    <h2>결승 승자:</h2>
    <img id="final-image" src="" alt="final winner">
</div>

<script>
    // 사진 이름 목록 (예시로 20개 이상의 사진)
    let allPhotos = [
        {name: "photo1", file: "photo1.webp"},
        {name: "photo2", file: "photo2.webp"},
        {name: "photo3", file: "photo3.webp"},
        {name: "photo4", file: "photo4.webp"},
        {name: "photo5", file: "photo5.webp"},
        {name: "photo6", file: "photo6.webp"},
        {name: "photo7", file: "photo7.webp"},
        {name: "photo8", file: "photo8.webp"},
        {name: "photo9", file: "photo9.webp"},
        {name: "photo10", file: "photo10.webp"},
        {name: "photo11", file: "photo11.webp"},
        {name: "photo12", file: "photo12.webp"},
        {name: "photo13", file: "photo13.webp"},
        {name: "photo14", file: "photo14.webp"},
        {name: "photo15", file: "photo15.webp"},
        {name: "photo16", file: "photo16.webp"}
    ];

    // 배열을 랜덤으로 섞는 함수 (Fisher-Yates 알고리즘)
    function shuffle(array) {
        for (let i = array.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            [array[i], array[j]] = [array[j], array[i]]; // 두 요소를 교환
        }
    }

    // 16개 랜덤 사진을 선택하는 함수
    function selectRandomPhotos() {
        shuffle(allPhotos); // 모든 사진 섞기
        return allPhotos.slice(0, 16); // 앞의 16개 사진 선택
    }

    let selectedPhotos = selectRandomPhotos(); // 16개의 랜덤 사진
    let roundPhotos = selectedPhotos; // 현재 라운드에 사용할 사진들
    let winners = []; // 승자 목록

    // 첫 번째 매칭을 랜덤으로 선택해서 표시
    function randomMatch() {
        if (roundPhotos.length > 1) {
            shuffle(roundPhotos); // 현재 라운드에서 사진 섞기

            // 두 개의 사진을 매칭
            let photo1 = roundPhotos.pop();
            let photo2 = roundPhotos.pop();

            // 이미지 태그에 이미지 할당
            document.getElementById("image1").src = "human_picture/" + photo1.file;
            document.getElementById("image2").src = "human_picture/" + photo2.file;

            // 이름 할당
            document.getElementById("name1").textContent = photo1.name;
            document.getElementById("name2").textContent = photo2.name;

            // 선택된 사진을 저장
            document.getElementById("image1").onclick = () => selectPhoto(photo1);
            document.getElementById("image2").onclick = () => selectPhoto(photo2);
        } else {
            // 최종 승자 출력
            showFinalWinner(winners[0]);
        }
    }

    // 사진을 선택하고 승자 리스트에 추가
    function selectPhoto(photo) {
        winners.push(photo);

        // 선택된 이미지를 다음 라운드로 보내기
        if (winners.length === roundPhotos.length / 2) {
            // 라운드가 끝나면 자동으로 다음 라운드 진행
            roundPhotos = winners; // 승자들을 다음 라운드로 설정
            winners = [];
            randomMatch(); // 다음 라운드 시작
        } else {
            randomMatch(); // 계속 진행
        }
    }

    // 최종 승자 출력
    function showFinalWinner(winner) {
        document.getElementById("final-winner").style.display = "block";
        document.getElementById("final-image").src = "human_picture/" + winner.file;
    }

    // 초기 랜덤 매칭 시작
    randomMatch();
</script>

</body>
</html>
