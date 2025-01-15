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

        .photo {
            width: 250px;
            margin: 10px;
            cursor: pointer;
            border-radius: 10px;
            transition: transform 0.2s;
        }

        .photo:hover {
            transform: scale(1.1);
        }

        h2 {
            color: #333;
        }

        #final-winner img {
            width: 300px;
            margin-top: 30px;
        }

        .round-title {
            font-size: 24px;
            margin: 20px;
        }
    </style>
</head>
<body>

<h2 class="round-title" id="round-title">16강</h2>

<div id="match-area">
    <div id="match-1">
        <img id="image1" class="photo" src="" alt="photo1">
        <img id="image2" class="photo" src="" alt="photo2">
    </div>
</div>

<div id="final-winner" style="display:none;">
    <h2>결승 승자:</h2>
    <img id="final-image" src="" alt="final winner">
</div>

<script>
    // 사진 목록 (예시로 30개 이상의 사진)
    let allPhotos = [
        {file: "photo1.webp", name: "사진 1"}, {file: "photo2.webp", name: "사진 2"},
        {file: "photo3.webp", name: "사진 3"}, {file: "photo4.webp", name: "사진 4"},
        {file: "photo5.webp", name: "사진 5"}, {file: "photo6.webp", name: "사진 6"},
        {file: "photo7.webp", name: "사진 7"}, {file: "photo8.webp", name: "사진 8"},
        {file: "photo9.webp", name: "사진 9"}, {file: "photo10.webp", name: "사진 10"},
        {file: "photo11.webp", name: "사진 11"}, {file: "photo12.webp", name: "사진 12"},
        {file: "photo13.webp", name: "사진 13"}, {file: "photo14.webp", name: "사진 14"},
        {file: "photo15.webp", name: "사진 15"}, {file: "photo16.webp", name: "사진 16"}
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
    let round = 1; // 현재 라운드
    let totalSelections = 8; // 각 라운드에서 선택할 횟수

    // 라운드 제목 업데이트
    function updateRoundTitle() {
        const roundTitle = document.getElementById("round-title");
        if (round === 1) {
            roundTitle.textContent = "16강";
        } else if (round === 2) {
            roundTitle.textContent = "8강";
        } else if (round === 3) {
            roundTitle.textContent = "4강";
        } else if (round === 4) {
            roundTitle.textContent = "결승전";
        }
    }

    // 첫 번째 매칭을 랜덤으로 선택해서 표시
    function randomMatch() {
        if (roundPhotos.length > 1 && winners.length < totalSelections) {
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
        } else if (winners.length === totalSelections) {
            if (round === 4) {
                // 결승에서 승자 표시
                showFinalWinner(winners[0]);
            } else {
                // 라운드가 끝나면 진행
                roundPhotos = winners; // 승자들을 다음 라운드로 설정
                winners = [];
                round++;
                updateRoundTitle();
                randomMatch(); // 다음 라운드 시작
            }
        }
    }

    // 사진을 선택하고 승자 리스트에 추가
    function selectPhoto(photo) {
        winners.push(photo);

        // 선택된 이미지를 다음 라운드로 보내기
        randomMatch(); // 계속 진행
    }

    // 최종 승자 출력 (단일 사진만 표시)
    function showFinalWinner(winner) {
        document.getElementById("final-winner").style.display = "block";
        document.getElementById("final-image").src = "human_picture/" + winner.file;
    }

    // 초기 랜덤 매칭 시작
    randomMatch();
</script>

</body>
</html>

