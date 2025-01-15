<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>여성 캐릭터 16강</title>
    <script>
        // 게임 진행을 위한 변수 설정
        var text = "";
        var images = []; // 이미지 데이터들을 담을 곳
        var names = [
            {name: "한아름", file: "ayumi.png"},
            {name: "키안티", file: "chianti.png"},
            {name: "홍장미", file: "haibara.png"},
            {name: "조디 센티밀리온", file: "jodie.png"},
            {name: "서가영", file: "kazuha.png"},
            {name: "노애리", file: "kisaki.png"},
            {name: "정나혜", file: "miike.png"},
            {name: "김유미", file: "miyamoto.png"},
            {name: "손예나", file: "mizunashi.png"},
            {name: "유미란", file: "ran.png"},
            {name: "오지인", file: "sato.png"},
            {name: "양세라", file: "sera.png"},
            {name: "윤정화", file: "shizuka.png"},
            {name: "정보라", file: "sonoko.png"},
            {name: "베르무트", file: "vermouth.png"},
            {name: "이하연", file: "yukiko.png"}
        ]; // 각 이미지에 해당하는 이름들

        var rounds = ["16강", "8강", "4강", "결승", "우승자"]; // 라운드별 이미지 수
        var roundIndex = 0; // 현재 라운드 인덱스
        var matches = rounds[roundIndex] === "16강" ? 8 : (rounds[roundIndex] === "8강" ? 4 : (rounds[roundIndex] === "4강" ? 2 : 1)); // 현재 라운드의 경기 수
        var currentMatch = 0; // 현재 진행 중인 경기
        var sImages = []; // 선택한 이미지 저장 배열
        var winnerImage = "우승자"; // 우승자 이미지
        var clickCount = 0; // 클릭 횟수를 세는 변수

        // 이미지를 랜덤으로 섞기
        names.sort(function(a, b) {
            return 0.5 - Math.random();
        });

        // 이미지와 라운드 표시
        function showImg(matchIndex) {
            var matchStartIndex = matchIndex * 2;
            document.getElementById('image1').src = "/img/vote/worldcup/women/" + names[matchStartIndex].file;
            document.getElementById('image2').src = "/img/vote/worldcup/women/" + names[matchStartIndex + 1].file;
            document.getElementById('name1').innerText = names[matchStartIndex].name;
            document.getElementById('name2').innerText = names[matchStartIndex + 1].name;
            document.getElementById('round').innerHTML = rounds[roundIndex];
        }

        // 선택된 이미지를 저장하고, 다음 라운드로 넘어가는 함수
        function change(n) {
            sImages[currentMatch] = names[currentMatch * 2 + n]; // 선택한 이미지 저장
            currentMatch++; // 경기 진행
            clickCount++; // 클릭 횟수 증가

            // 15번 클릭 후 "당신의 이상형" 표시
            if (clickCount >= 15) {
                document.getElementById('round').innerHTML = "당신의 이상형";
            }

            // 경기가 종료되면 라운드 전환
            if (currentMatch >= matches) {
                if (roundIndex < rounds.length - 1) {
                    roundIndex++;  // 다음 라운드로 진행
                    matches = rounds[roundIndex] === "16강" ? 8 : (rounds[roundIndex] === "8강" ? 4 : (rounds[roundIndex] === "4강" ? 2 : 1));  // 라운드별 경기 수
                    currentMatch = 0;  // 경기 번호 초기화

                    // 우승자가 결정되면
                    if (roundIndex === rounds.length - 1) {
                        winnerImage = sImages[0]; // 첫 번째 선택된 이미지를 우승자로 설정
                        document.getElementById('cal').innerHTML = "";
                        document.getElementById('winnerImage').src = "/img/vote/worldcup/women/" + winnerImage.file;
                        document.getElementById('winnerName').innerText = winnerImage.name; // 우승자 이름 표시
                        document.getElementById('winnerContainer').style.display = 'block';
                        document.getElementById('image1').style.display = 'none'; // 결승에서 첫 번째 이미지만 보이도록 처리
                        document.getElementById('image2').style.display = 'none'; // 두 번째 이미지는 숨김
                        document.getElementById('hover01').style.display = 'none'; // 'hover01' 숨김
                    } else {
                        // 다음 라운드의 이미지를 선택된 이미지로 업데이트하고 섞기
                        names = sImages.slice(0, matches * 2);
                        names.sort(function(a, b) {
                            return 0.5 - Math.random();  // 이미지 랜덤 정렬
                        });
                        showImg(currentMatch);  // 새 이미지를 표시
                    }
                }
            } else {
                showImg(currentMatch);  // 아직 경기 진행 중
            }
        }

        // 페이지 로드 시 첫 번째 이미지를 자동으로 표시
        window.onload = function() {
            showImg(currentMatch); // 첫 번째 경기 이미지 로드
        };
    </script>
</head>
<body>
<div style="text-align: center;">
    <!-- 타이틀 -->
    <div class="title-container">
        <h1><span>여성 캐릭터 16강</span></h1>
        <p id="round"></p>
        <p id="cal"></p>
    </div>
    <br>

    <!-- 이미지 클릭 시 이미지 표시 -->
    <figure class="hover01" id="hover01">
        <div class="image-container">
            <img id="image1" onclick="change(0);" />
            <p id="name1"></p> <!-- 이미지 밑에 이름 표시 -->
        </div>
        <div class="image-container">
            <img id="image2" onclick="change(1);" />
            <p id="name2"></p> <!-- 이미지 밑에 이름 표시 -->
        </div>
    </figure>

    <!-- 우승자 표시 -->
    <div class="winner-container" id="winnerContainer" style="display: none;">
        <img id="winnerImage" />
        <p id="winnerName"></p> <!-- 우승자의 이름 표시 -->
    </div>
</div>

<!-- 버튼들을 항상 고정된 위치에 배치 -->
<div class="button-container">
    <button id="restartBtn" onclick="restartGame()">다시하기</button>
    <button class="back-btn" onclick="window.history.back();">뒤로가기</button>
</div>

<style>
    .title-container {
        position: relative;
        text-align: center;
        left: 50%;
        transform: translateX(-50%);
        width: 1000px;
        height: auto;
        border-radius: 50px;
        box-shadow: 5px 10px 5px #ccc;
        margin-bottom: 50px;
        padding-top: 20px;
    }

    .image-container {
        display: inline-block;
        margin-right: 20px;
    }

    img {
        width: 490px;
        height: 490px;
        cursor: pointer;
        margin-top: 10px;
    }

    .winner-container {
        position: relative;
        text-align: center;
        left: 50%;
        transform: translateX(-50%);
        width: 490px;
        height: 490px;
        top: 10px;
        display: none;
    }

    #winnerImage {
        margin-top: 10px;
    }

    #winnerName {
        font-size: 18px;
        font-weight: bold;
        margin-top: 10px;
    }

    p {
        font-size: 18px;
        font-weight: bold;
        margin-top: 5px;
    }

    /* 고정된 버튼 위치 */
    .button-container {
        position: fixed;
        bottom: 20px;
        left: 50%;
        transform: translateX(-50%);
        display: flex;
        gap: 20px;
        z-index: 10;
    }

    .button-container button {
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
    }

    #restartBtn {
        padding: 10px 20px;
        font-size: 18px;
        cursor: pointer;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
    }

    .back-btn {
        padding: 10px 20px;
        font-size: 18px;
        cursor: pointer;
        background-color: #f44336;
        color: white;
        border: none;
        border-radius: 5px;
    }
</style>

<script>
    // 게임 다시 시작하는 함수
    function restartGame() {
        location.reload(); // 페이지를 새로고침하여 게임을 처음부터 다시 시작
    }
</script>

</body>
</html>
