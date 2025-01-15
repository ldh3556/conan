<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이상형 월드컵</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f0f0f0;
        }
        .container {
            text-align: center;
            width: 80%;
        }
        .round {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .photo {
            width: 45%;
            cursor: pointer;
        }
        .photo img {
            width: 100%;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .round-title {
            font-size: 2rem;
            margin-bottom: 20px;
        }
        .photo-name {
            margin-top: 10px;
            font-size: 1.2rem;
        }
        #final-result {
            display: none;
            font-size: 2rem;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container">
    <div id="round-title" class="round-title">16강</div>
    <div id="round" class="round">
        <div class="photo" onclick="selectPhoto(0)">
            <img id="photo0" src="" alt="Photo 1">
            <div id="name0" class="photo-name"></div>
        </div>
        <div class="photo" onclick="selectPhoto(1)">
            <img id="photo1" src="" alt="Photo 2">
            <div id="name1" class="photo-name"></div>
        </div>
    </div>
    <div id="round2" class="round" style="display: none;">
        <div class="photo" onclick="selectPhoto(2)">
            <img id="photo2" src="" alt="Photo 3">
            <div id="name2" class="photo-name"></div>
        </div>
        <div class="photo" onclick="selectPhoto(3)">
            <img id="photo3" src="" alt="Photo 4">
            <div id="name3" class="photo-name"></div>
        </div>
    </div>
    <div id="round3" class="round" style="display: none;">
        <div class="photo" onclick="selectPhoto(4)">
            <img id="photo4" src="" alt="Photo 5">
            <div id="name4" class="photo-name"></div>
        </div>
        <div class="photo" onclick="selectPhoto(5)">
            <img id="photo5" src="" alt="Photo 6">
            <div id="name5" class="photo-name"></div>
        </div>
    </div>
    <div id="round4" class="round" style="display: none;">
        <div class="photo" onclick="selectPhoto(6)">
            <img id="photo6" src="" alt="Photo 7">
            <div id="name6" class="photo-name"></div>
        </div>
        <div class="photo" onclick="selectPhoto(7)">
            <img id="photo7" src="" alt="Photo 8">
            <div id="name7" class="photo-name"></div>
        </div>
    </div>
    <div id="round5" class="round" style="display: none;">
        <div class="photo" onclick="selectPhoto(8)">
            <img id="photo8" src="" alt="Photo 9">
            <div id="name8" class="photo-name"></div>
        </div>
        <div class="photo" onclick="selectPhoto(9)">
            <img id="photo9" src="" alt="Photo 10">
            <div id="name9" class="photo-name"></div>
        </div>
    </div>
    <div id="round6" class="round" style="display: none;">
        <div class="photo" onclick="selectPhoto(10)">
            <img id="photo10" src="" alt="Photo 11">
            <div id="name10" class="photo-name"></div>
        </div>
        <div class="photo" onclick="selectPhoto(11)">
            <img id="photo11" src="" alt="Photo 12">
            <div id="name11" class="photo-name"></div>
        </div>
    </div>
    <div id="round7" class="round" style="display: none;">
        <div class="photo" onclick="selectPhoto(12)">
            <img id="photo12" src="" alt="Photo 13">
            <div id="name12" class="photo-name"></div>
        </div>
        <div class="photo" onclick="selectPhoto(13)">
            <img id="photo13" src="" alt="Photo 14">
            <div id="name13" class="photo-name"></div>
        </div>
    </div>
    <div id="round8" class="round" style="display: none;">
        <div class="photo" onclick="selectPhoto(14)">
            <img id="photo14" src="" alt="Photo 15">
            <div id="name14" class="photo-name"></div>
        </div>
        <div class="photo" onclick="selectPhoto(15)">
            <img id="photo15" src="" alt="Photo 16">
            <div id="name15" class="photo-name"></div>
        </div>
    </div>
    <div id="final-result">
        <div>결승 사진:</div>
        <div id="final-photo"></div>
    </div>
</div>

<script>
    // 인물 사진과 이름 데이터 (서버에서 JSP로 전달된 데이터)
    var photos = [
        <%
            // JSP에서 배열을 동적으로 출력
            String[][] photoData = {
                {"브라운", "agasa.png"},
                {"이상윤", "akai.png"},
                {"안기준", "amuro.png"},
                {"안드레 캐멜", "camel.png"},
                {"이명수", "chiba.png"},
                {"코난", "conan.png"},
                {"코른", "corun.png"},
                {"고뭉치", "genta.png"},
                {"진", "gin.png"},
                {"서원상", "ginshiro.png"},
                {"하기완", "hagiwara.png"},
                {"우상길", "haneda.png"},
                {"하인성", "heiji.png"},
                {"하평무", "heizo.png"},
                {"제임스 블랙", "james.png"},
                {"천범기", "jugo.png"},
                {"고희도", "kid.png"},
                {"유명한", "kogoro.png"},
                {"오경구", "kyogoku.png"},
                {"송보윤", "matsuda.png"},
                {"박종태", "matsumoto.png"},
                {"골한석", "meguro.png"},
                {"박세모", "mitsuhiko.png"},
                {"임은삼", "nakamori.png"},
                {"김대용", "otaki.png"},
                {"천범수", "sango.png"},
                {"남도일", "shinichi.png"},
                {"백동훈", "shiratori.png"},
                {"최수현", "subaru.png"},
                {"신형선", "takagi.png"},
                {"토메씨", "tomesan.png"},
                {"워커", "vodka.png"},
                {"정영일", "yamamura.png"},
                {"남건", "yusaku.png"}
            };

            // 배열 데이터를 JSP에서 출력하기
            for (int i = 0; i < photoData.length; i++) {
                out.print("{ name: '" + photoData[i][0] + "', file: '" + photoData[i][1] + "' }");
                if (i < photoData.length - 1) {
                    out.print(", ");
                }
            }
        %>
    ];

    let selectedPhotos = [];
    let currentRound = 1;

    // 랜덤으로 사진을 섞는 함수
    function shuffle(array) {
        for (let i = array.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            [array[i], array[j]] = [array[j], array[i]];
        }
    }

    // 16강 사진 랜덤으로 설정
    function initGame() {
        shuffle(photos);
        for (let i = 0; i < 16; i++) {
            document.getElementById(`photo${i}`).src = `img/vote/worldcup/men/${photos[i].file}`;
            document.getElementById(`name${i}`).innerText = photos[i].name;
        }
    }

    // 선택된 사진 처리
    function selectPhoto(photoIndex) {
        selectedPhotos.push(photos[photoIndex]);
        if (selectedPhotos.length < 8) {
            if (selectedPhotos.length === 2) {
                document.getElementById('round-title').innerText = "8강";
                document.getElementById('round').style.display = "none";
                document.getElementById('round2').style.display = "flex";
            } else if (selectedPhotos.length === 4) {
                document.getElementById('round-title').innerText = "4강";
                document.getElementById('round2').style.display = "none";
                document.getElementById('round3').style.display = "flex";
            } else if (selectedPhotos.length === 6) {
                document.getElementById('round-title').innerText = "4강";
                document.getElementById('round3').style.display = "none";
                document.getElementById('round4').style.display = "flex";
            } else if (selectedPhotos.length === 8) {
                document.getElementById('round-title').innerText = "결승전";
                document.getElementById('round4').style.display = "none";
                document.getElementById('round5').style.display = "flex";
            }
        } else if (selectedPhotos.length === 16) {
            document.getElementById('final-result').style.display = "block";
            document.getElementById('final-photo').innerHTML = `<img src="img/vote/worldcup/men/${selectedPhotos[0].file}" alt="Final Photo">`;
        }
    }

    // 게임 초기화
    initGame();
</script>
</body>
</html>
