<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>남성 캐릭터 16강</title>
    <script>
        // 게임 진행을 위한 변수 설정
        var text = "";
        var images = []; // 이미지 데이터들을 담을 곳
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
        ]; // 각 이미지에 해당하는 이름들

        var rounds = ["16강", "8강", "4강", "결승", "우승자"]; // 라운드별 이미지 수
        var roundIndex = 0; // 현재 라운드 인덱스
        var matches = rounds[roundIndex] === "16강" ? 8 : (rounds[roundIndex] === "8강" ? 4 : (rounds[roundIndex] === "4강" ? 2 : 1)); // 현재 라운드의 경기 수
        var currentMatch = 0; // 현재 진행 중인 경기
        var sImages = []; // 선택한 이미지 저장 배열
        var winnerImage = "우승자"; // 우승자 이미지

        // 이미지를 랜덤으로 섞기
        names.sort(function(a, b) {
            return 0.5 - Math.random();
        });

        // 이미지와 라운드 표시
        function showImg(matchIndex) {
            var matchStartIndex = matchIndex * 2;
            document.getElementById('image1').src = "/img/vote/worldcup/men/" + names[matchStartIndex].file;
            document.getElementById('image2').src = "/img/vote/worldcup/men/" + names[matchStartIndex + 1].file;
            document.getElementById('name1').innerText = names[matchStartIndex].name;
            document.getElementById('name2').innerText = names[matchStartIndex + 1].name;
            document.getElementById('round').innerHTML = rounds[roundIndex];
        }

        // 선택된 이미지를 저장하고, 다음 라운드로 넘어가는 함수
        function change(n) {
            sImages[currentMatch] = names[currentMatch * 2 + n]; // 선택한 이미지 저장
            currentMatch++; // 경기 진행

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
                        document.getElementById('winnerImage').src = "/img/vote/worldcup/men/" + winnerImage.file;
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
                } else {
                    // 모든 라운드가 끝나면 "당신의 이상형" 표시
                    document.getElementById('cal').innerHTML = "당신의 이상형";
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
        <h1><span>남성 캐릭터 16강</span></h1>
        <p id="round"></p>
        <p id="cal"></p>
    </div>
    <br>

    <!-- 이미지 클릭 시 효과음 재생 + 이미지 표시 -->
    <figure class="hover01" id="hover01">
        <div class="image-container">
            <img id="image1" onclick="change(0); play();" />
            <p id="name1"></p> <!-- 이미지 밑에 이름 표시 -->
        </div>
        <div class="image-container">
            <img id="image2" onclick="change(1); play();" />
            <p id="name2"></p> <!-- 이미지 밑에 이름 표시 -->
        </div>
    </figure>

    <!-- 우승자 표시 -->
    <div class="winner-container" id="winnerContainer" style="display: none;">
        <p class="winner-text">당신의 이상형</p>
        <img id="winnerImage" />
        <p id="winnerName"></p> <!-- 우승자의 이름 표시 -->
    </div>
</div>
</body>

<style>
    .title-container {
        position: relative;  /* 절대 위치를 사용하지 않도록 수정 */
        text-align: center;
        left: 50%;
        transform: translateX(-50%);
        width: 1000px;
        height: 120px;
        /*background: skyblue;*/
        border-radius: 50px;
        box-shadow: 5px 10px 5px #ccc;
        margin-bottom: 50px;
        padding-top: 20px; /* 제목과 글자를 조금 더 아래로 내리기 */
    }

    .image-container {
        display: inline-block;  /* 이미지들이 가로로 배치되도록 함 */
        margin-right: 20px;  /* 이미지들 사이에 간격 추가 */
    }

    img {
        width: 490px;  /* 500px에서 10px을 뺀 크기 */
        height: 490px;  /* 비율 맞추기 위해 동일하게 크기 설정 */
        cursor: pointer;
        margin-top: 10px;
    }

    .winner-container {
        position: relative;
        text-align: center;
        left: 50%;
        transform: translateX(-50%);
        width: 490px; /* 이미지 크기와 맞춤 */
        height: 490px; /* 이미지 크기와 맞춤 */
        top: 10px; /* 이미지 위치를 맞추기 위한 간격 */
        display: none;
    }

    .winner-text {
        font-size: 24px;
        font-weight: bold;
        color: black;
        margin-top: 25px;
    }

    #winnerImage {
        margin-top: 10px; /* 이미지를 좀 더 아래로 */
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
</style>
</html>
