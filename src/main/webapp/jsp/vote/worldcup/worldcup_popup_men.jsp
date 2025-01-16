<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>남성 캐릭터 16강</title>
    <script>
        var text = "";
        var images = [];
        var names = [
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
            document.getElementById('image1').src = "/img/vote/worldcup/men/" + names[matchStartIndex].file;
            document.getElementById('image2').src = "/img/vote/worldcup/men/" + names[matchStartIndex + 1].file;
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
                        document.getElementById('winnerImage').src = "/img/vote/worldcup/men/" + winnerImage.file;
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
            <h1><span>남성 캐릭터 16강</span></h1>
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
