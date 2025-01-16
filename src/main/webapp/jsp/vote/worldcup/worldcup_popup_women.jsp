<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>여성 캐릭터 16강</title>
    <script>
        var text = "";
        var images = [];
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
        ];

        var rounds = ["16강", "8강", "4강", "결승", "우승자"];
        var roundIndex = 0;
        var matches = rounds[roundIndex] === "16강" ? 8 : (rounds[roundIndex] === "8강" ? 4 : (rounds[roundIndex] === "4강" ? 2 : 1));
        var currentMatch = 0;
        var sImages = [];
        var winnerImage = "우승자";
        var clickCount = 0;

        names.sort(function(a, b) {
            return 0.5 - Math.random();
        });

        function showImg(matchIndex) {
            var matchStartIndex = matchIndex * 2;
            document.getElementById('image1').src = "/img/vote/worldcup/women/" + names[matchStartIndex].file;
            document.getElementById('image2').src = "/img/vote/worldcup/women/" + names[matchStartIndex + 1].file;
            document.getElementById('name1').innerText = names[matchStartIndex].name;
            document.getElementById('name2').innerText = names[matchStartIndex + 1].name;
            document.getElementById('round').innerHTML = rounds[roundIndex];
        }

        function change(n) {
            sImages[currentMatch] = names[currentMatch * 2 + n];
            currentMatch++;
            clickCount++;

            if (clickCount >= 15) {
                document.getElementById('round').innerHTML = "당신의 이상형";
            }

            if (currentMatch >= matches) {
                if (roundIndex < rounds.length - 1) {
                    roundIndex++;
                    matches = rounds[roundIndex] === "16강" ? 8 : (rounds[roundIndex] === "8강" ? 4 : (rounds[roundIndex] === "4강" ? 2 : 1));
                    currentMatch = 0;

                    if (roundIndex === rounds.length - 1) {
                        winnerImage = sImages[0];
                        document.getElementById('cal').innerHTML = "";
                        document.getElementById('winnerImage').src = "/img/vote/worldcup/women/" + winnerImage.file;
                        document.getElementById('winnerName').innerText = winnerImage.name;
                        document.getElementById('winnerContainer').style.display = 'block';
                        document.getElementById('image1').style.display = 'none';
                        document.getElementById('image2').style.display = 'none';
                        document.getElementById('hover01').style.display = 'none';
                    } else {
                        names = sImages.slice(0, matches * 2);
                        names.sort(function(a, b) {
                            return 0.5 - Math.random();
                        });
                        showImg(currentMatch);
                    }
                }
            } else {
                showImg(currentMatch);
            }
        }

        window.onload = function() {
            showImg(currentMatch);
        };
    </script>
</head>
<body>

<div class="outer-container">
    <div style="text-align: center;">
        <div class="title-container" style="border: 3pt solid green">
            <h1><span>여성 캐릭터 16강</span></h1>
            <p id="round"></p>
            <p id="cal"></p>
        </div>

        <figure class="hover01" id="hover01" style="border: 3pt solid blue">
            <div class="image-container">
                <img id="image1" onclick="change(0);" />
                <p id="name1"></p>
            </div>
            <div class="image-container">
                <img id="image2" onclick="change(1);" />
                <p id="name2"></p>
            </div>
        </figure>

        <!-- 버튼들을 위치시키기 위한 div -->
        <div class="button-container" style="border: 3pt solid black">
            <button id="restartBtn" onclick="restartGame()">다시하기</button>
            <button class="back-btn" onclick="window.history.back();">뒤로가기</button>
        </div>

        <div class="winner-container" id="winnerContainer" style="display: none;">
            <img id="winnerImage" />
            <p id="winnerName"></p>
        </div>
    </div>
</div>

<style>
    .outer-container {
        height: 100vh;
        width: 100%;
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
        border: solid 3pt red;
        position: relative;
    }

    .title-container {
        position: relative;
        text-align: center;
        left: 50%;
        transform: translateX(-50%);
        width: 1000px;
        margin-bottom: 50px;
        padding-top: 20px;
        box-shadow: 5px 10px 5px #ccc;
        border-radius: 50px;
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

    .button-container {
        position: absolute;
        bottom: 100px; /* 화면 하단에서 100px 떨어지도록 수정 */
        left: 50%;
        transform: translateX(-50%);
        display: flex;
        gap: 20px;
        z-index: 10;
    }

    .button-container button {
        padding: 15px 30px;
        font-size: 16px;
        cursor: pointer;
    }

    #restartBtn {
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
    }

    .back-btn {
        background-color: #f44336;
        color: white;
        border: none;
        border-radius: 5px;
    }
</style>

<script>
    function restartGame() {
        location.reload();
    }
</script>

</body>
</html>
