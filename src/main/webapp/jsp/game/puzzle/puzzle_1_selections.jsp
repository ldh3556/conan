<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>눈 코 입 퀴즈</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        .quiz-container {
            width: 80%;
            margin: 0 auto;
        }

        .row {
            display: flex;
            justify-content: center;
            margin: 5px 0;
        }

        img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            margin: 0 2px;
        }

        #mouth {
            width: 310px;  /* 입 이미지 가로 길이를 넓혀서 길게 만듦 */
            height: 100px;   /* 세로 길이는 자동으로 비율에 맞게 설정 */
        }

        .full-face {
            display: none;
            margin-top: 20px;
            text-align: center;  /* 이미지가 중앙에 위치하도록 */
        }

        #full-face img {
            width: 300px;  /* 모든 이미지의 크기를 동일하게 설정 */
            height: 300px; /* 고정된 높이로 설정 */
            object-fit: cover; /* 이미지 비율을 유지하면서 크기 맞추기 */
            border-radius: 10px; /* 모서리 둥글게 */
        }

        button {
            margin: 20px;
            padding: 10px;
            font-size: 16px;
            cursor: pointer;
        }

        .answer-btn {
            margin: 10px;
            padding: 10px;
            font-size: 16px;
            cursor: pointer;
        }

        .top-row, .bottom-row {
            display: flex;
            justify-content: center;
            margin: 10px 0;
        }

        .eye, .nose, .mouth {
            width: 100px;
            height: 100px;
            background-color: #ccc;
            margin: 0 5px;
            border-radius: 50%;
        }

        .nose {
            background-color: #ff6347;  /* 코 색 */
        }

        .clickable {
            cursor: pointer;
        }

    </style>
</head>
<body>
<div class="quiz-container">
    <!-- 인물의 부분별 사진 -->
    <div class="top-row">
        <div class="eye left-eye clickable" id="left-eye"></div>
        <div class="nose clickable" id="nose"></div>
        <div class="eye right-eye clickable" id="right-eye"></div>
    </div>
    <div class="bottom-row">
        <div class="mouth clickable" id="mouth"></div>
    </div>

    <!-- 4지선다 버튼 -->
    <div>
        <button class="answer-btn" id="answer1">코난</button>
        <button class="answer-btn" id="answer2">하이바라 아이</button>
        <button class="answer-btn" id="answer3">오키야</button>
        <button class="answer-btn" id="answer4">모리 란</button>
    </div>
</div>

<!-- 결과 표시 -->
<div id="result"></div>

<script>
    const images = [
        {
            leftEye: '/img/game/puzzle/1L.jpg',
            nose: '/img/game/puzzle/1N.jpg',
            rightEye: '/img/game/puzzle/1R.jpg',
            mouth: '/img/game/puzzle/1M.jpg',
            fullFace: '/img/game/puzzle/1F.jpg',
            correctAnswer: "코난",
            options: ["코난", "하이바라 아이", "오키야", "모리 란"]
        },
        {
            leftEye: '/img/game/puzzle/2L.jpg',
            nose: '/img/game/puzzle/2N.jpg',
            rightEye: '/img/game/puzzle/2R.jpg',
            mouth: '/img/game/puzzle/2M.jpg',
            fullFace: '/img/game/puzzle/2F.jpg',
            correctAnswer: "하이바라 아이",
            options: ["코난", "하이바라 아이", "오키야", "모리 란"]
        },
        {
            leftEye: '/img/game/puzzle/3L.jpg',
            nose: '/img/game/puzzle/3N.jpg',
            rightEye: '/img/game/puzzle/3R.jpg',
            mouth: '/img/game/puzzle/3M.jpg',
            fullFace: '/img/game/puzzle/3F.jpg',
            correctAnswer: "오키야",
            options: ["코난", "하이바라 아이", "오키야", "모리 란"]
        },
        {
            leftEye: '/img/game/puzzle/4L.jpg',
            nose: '/img/game/puzzle/4N.jpg',
            rightEye: '/img/game/puzzle/4R.jpg',
            mouth: '/img/game/puzzle/4M.jpg',
            fullFace: '/img/game/puzzle/4F.jpg',
            correctAnswer: "모리 란",
            options: ["코난", "하이바라 아이", "오키야", "모리 란"]
        }
    ];

    let selectedImages = [];
    let currentQuestionIndex = 0;
    let questionCount = 0; // 문제 진행 횟수
    let score = 0;

    // 문제를 랜덤으로 선택하는 함수
    function loadRandomQuestion() {
        if (selectedImages.length === 0) {
            // 4문제만 선택
            selectedImages = images.slice(0, 4);
            currentQuestionIndex = 0; // 게임이 시작되면 첫 번째 문제부터
        }

        const person = selectedImages[currentQuestionIndex];

        // 각 이미지 요소에 src 값 설정
        document.getElementById('left-eye').style.backgroundImage = `url(${person.leftEye})`;
        document.getElementById('nose').style.backgroundImage = `url(${person.nose})`;
        document.getElementById('right-eye').style.backgroundImage = `url(${person.rightEye})`;
        document.getElementById('mouth').style.backgroundImage = `url(${person.mouth})`;

        // 4지선다형 버튼 설정
        const options = person.options;
        document.getElementById('answer1').textContent = options[0];
        document.getElementById('answer2').textContent = options[1];
        document.getElementById('answer3').textContent = options[2];
        document.getElementById('answer4').textContent = options[3];
    }

    // 정답을 맞혔는지 확인하는 함수
    function checkAnswer(selectedAnswer) {
        const person = selectedImages[currentQuestionIndex];
        const result = document.getElementById("result");

        if (selectedAnswer === person.correctAnswer) {
            score++; // 정답을 맞히면 점수 증가
            result.textContent = "정답입니다!";
        } else {
            result.textContent = "틀렸습니다. 다시 시도해보세요!";
        }

        displayScore(); // 점수 표시 함수 호출
    }

    // 점수 표시 함수
    function displayScore() {
        const result = document.getElementById("result");
        result.textContent += ` (현재 점수: ${score})`;
    }

    // 다음 문제로 넘어가는 함수
    function nextQuestion() {
        currentQuestionIndex++;
        questionCount++;

        if (questionCount < 4) { // 4번까지는 "다음 문제" 계속
            loadRandomQuestion(); // 다음 문제를 로드
        } else {
            // 게임이 끝났을 때 '다음 문제' 버튼을 '다시하기' 버튼으로 변경
            document.getElementById('next-question').textContent = '다시하기';
            document.getElementById('next-question').removeEventListener('click', nextQuestion);
            document.getElementById('next-question').addEventListener('click', resetGame);
        }
    }

    // 게임을 다시 시작하는 함수
    function resetGame() {
        selectedImages = [];
        questionCount = 0;
        score = 0;
        loadRandomQuestion();
        document.getElementById('next-question').textContent = '다음 문제'; // '다음 문제' 버튼으로 텍스트 변경
        document.getElementById('next-question').removeEventListener('click', resetGame);
        document.getElementById('next-question').addEventListener('click', nextQuestion);
    }

    // 페이지가 로드될 때 첫 번째 문제를 로드
    window.onload = loadRandomQuestion;

    // 각 4지선다 버튼에 클릭 이벤트 추가
    document.getElementById("answer1").addEventListener("click", () => checkAnswer("코난"));
    document.getElementById("answer2").addEventListener("click", () => checkAnswer("하이바라 아이"));
    document.getElementById("answer3").addEventListener("click", () => checkAnswer("오키야"));
    document.getElementById("answer4").addEventListener("click", () => checkAnswer("모리 란"));
</script>
</body>
</html>
