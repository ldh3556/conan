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

<div id="match-area">
    <div class="photo-container">
        <img id="image1" class="photo" src="" alt="photo1">
        <div id="name1" class="photo-name"></div>
    </div>
    <div class="photo-container">
        <img id="image2" class="photo" src="" alt="photo2">
        <div id="name2" class="photo-name"></div>
    </div>
</div>

<div id="final-winner" style="display:none;">
    <h2>결승 승자:</h2>
    <img id="final-image" src="" alt="final winner">
</div>

<script>
    // 사진 목록: 각 사진의 이름과 파일명
    const allPhotos = [
        {name: "브라운", file: "agasa.png"},
        {name: "이상윤", file: "akai.png"},
        {name: "안기준", file: "amuro.png"},
        {name: "안드레 캐멜", file: "camel.png"},
        {name: "이명수", file: "chiba.png"},
        {name: "코난", file: "conan.png"},
        {name: "코른", file: "corun.png"},
        {name: "고뭉치", file: "genta.png"},
        {name: "진", file: "gin.png"},
        {name: "서원상", file: "ginshiro.png"},
        {name: "하기완", file: "hagiwara.png"},
        {name: "우상길", file: "haneda.png"},
        {name: "하인성", file: "heiji.png"},
        {name: "하평무", file: "heizo.png"},
        {name: "제임스 블랙", file: "james.png"},
        {name: "천범기", file: "jugo.png"},
        {name: "고희도", file: "kid.png"},
        {name: "유명한", file: "kogoro.png"},
        {name: "오경구", file: "kyogoku.png"},
        {name: "송보윤", file: "matsuda.png"},
        {name: "박종태", file: "matsumoto.png"},
        {name: "골한석", file: "meguro.png"},
        {name: "박세모", file: "mitsuhiko.png"},
        {name: "임은삼", file: "nakamori.png"},
        {name: "김대용", file: "otaki.png"},
        {name: "천범수", file: "sango.png"},
        {name: "남도일", file: "shinichi.png"},
        {name: "백동훈", file: "shiratori.png"},
        {name: "최수현", file: "subaru.png"},
        {name: "신형선", file: "takagi.png"},
        {name: "토메씨", file: "tomesan.png"},
        {name: "워커", file: "vodka.png"},
        {name: "정영일", file: "yamamura.png"},
        {name: "남건", file: "yusaku.png"}
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
    let round = 1; // 현재 라운드 (1: 16강, 2: 8강, 3: 4강, 4: 결승)
    let totalSelections = 8; // 첫 라운드에서 8번 선택

    // 라운드에 맞는 타이틀 변경
    function updateRoundTitle() {
        const title = document.getElementById("round-title");
        if (round === 1) {
            title.textContent = "16강";
            totalSelections = 8;
        } else if (round === 2) {
            title.textContent = "8강";
            totalSelections = 4;
        } else if (round === 3) {
            title.textContent = "4강";
            totalSelections = 2;
        } else if (round === 4) {
            title.textContent = "결승전";
            totalSelections = 1;
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
            document.getElementById("image1").src = "img/vote/worldcup/men/" + photo1.file;
            document.getElementById("image2").src = "img/vote/worldcup/men/" + photo2.file;

            console.log("image1 src: ", "img/vote/worldcup/men/" + photo1.file); // 경로 확인
            console.log("image2 src: ", "img/vote/worldcup/men/" + photo2.file); // 경로 확인

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

    // 최종 승자 출력
    function showFinalWinner(winner) {
        document.getElementById("final-winner").style.display = "block";
        document.getElementById("final-image").src = "img/vote/worldcup/men/" + winner.file;
    }

    // 페이지 로드 후 첫 매칭 시작
    window.onload = function() {
        randomMatch();
    };

    // // 초기 랜덤 매칭 시작
    // randomMatch();
</script>

</body>
</html>
