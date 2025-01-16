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

        names.sort(function(a, b) { return 0.5 - Math.random(); });

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

                    if (roundIndex === 4) {
                        saveWinnerToDB(sImages);
                    }
                }
            }
            showImg(currentMatch);
        }

        function saveWinnerToDB(images) {
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "/saveWinner", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            var params = "images=" + JSON.stringify(images);
            xhr.send(params);
        }

        window.onload = function() {
            showImg(currentMatch);
        };
    </script>
</head>
<body>
<h2 id="round"></h2>
<div>
    <div id="left">
        <img id="image1" src="" width="150" height="150">
        <p id="name1"></p>
    </div>
    <div id="right">
        <img id="image2" src="" width="150" height="150">
        <p id="name2"></p>
    </div>
</div>

<button onclick="change(0)">왼쪽 선택</button>
<button onclick="change(1)">오른쪽 선택</button>
</body>
</html>
