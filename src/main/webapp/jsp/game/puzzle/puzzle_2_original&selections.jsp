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

    </style>
</head>
<body>
<div class="quiz-container">
    <!-- 인물의 부분별 사진 -->
    <div class="row">
        <img id="left-eye" src="" alt="왼쪽 눈">
        <img id="nose" src="" alt="코">
        <img id="right-eye" src="" alt="오른쪽 눈">
    </div>
    <div class="row">
        <img id="mouth" src="" alt="입">
    </div>

    <div class="button-container">
        <!-- 4지선다 버튼 -->
        <form id="quizForm" method="post" action="quiz.jsp">
            <button type="submit" name="answer" value="0" class="quiz-button" id="btn0"><%= request.getAttribute("option1") %></button>
            <button type="submit" name="answer" value="1" class="quiz-button" id="btn1"><%= request.getAttribute("option2") %></button>
            <button type="submit" name="answer" value="2" class="quiz-button" id="btn2"><%= request.getAttribute("option3") %></button>
            <button type="submit" name="answer" value="3" class="quiz-button" id="btn3"><%= request.getAttribute("option4") %></button>
        </form>
    </div>

    <!-- 정답 확인 버튼 -->
    <button id="check-answer">정답 확인</button>
    <button id="next-question">다음 문제</button>
</div>

<!-- 정답을 맞히면 보이는 완전한 얼굴 -->
<div id="full-face" class="full-face">
    <img src="" alt="정답 얼굴">
</div>

<script>
    const images = [
        {
            leftEye: '/img/game/puzzle/1L.jpg',
            nose: '/img/game/puzzle/1N.jpg',
            rightEye: '/img/game/puzzle/1R.jpg',
            mouth: '/img/game/puzzle/1M.jpg',
            fullFace: '/img/game/puzzle/1F.jpg',
        },
        {
            leftEye: '/img/game/puzzle/2L.jpg',
            nose: '/img/game/puzzle/2N.jpg',
            rightEye: '/img/game/puzzle/2R.jpg',
            mouth: '/img/game/puzzle/2M.jpg',
            fullFace: '/img/game/puzzle/2F.jpg'
        },
        {
            leftEye: '/img/game/puzzle/3L.jpg',
            nose: '/img/game/puzzle/3N.jpg',
            rightEye: '/img/game/puzzle/3R.jpg',
            mouth: '/img/game/puzzle/3M.jpg',
            fullFace: '/img/game/puzzle/3F.jpg',
        },
        {
            leftEye: '/img/game/puzzle/4L.jpg',
            nose: '/img/game/puzzle/4N.jpg',
            rightEye: '/img/game/puzzle/4R.jpg',
            mouth: '/img/game/puzzle/4M.jpg',
            fullFace: '/img/game/puzzle/4F.jpg'
        },
        {
            leftEye: '/img/game/puzzle/5L.jpg',
            nose: '/img/game/puzzle/5N.jpg',
            rightEye: '/img/game/puzzle/5R.jpg',
            mouth: '/img/game/puzzle/5M.jpg',
            fullFace: '/img/game/puzzle/5F.jpg',
        },
        {
            leftEye: '/img/game/puzzle/6L.jpg',
            nose: '/img/game/puzzle/6N.jpg',
            rightEye: '/img/game/puzzle/6R.jpg',
            mouth: '/img/game/puzzle/6M.jpg',
            fullFace: '/img/game/puzzle/6F.jpg',
        },
        {
            leftEye: '/img/game/puzzle/7L.jpg',
            nose: '/img/game/puzzle/7N.jpg',
            rightEye: '/img/game/puzzle/7R.jpg',
            mouth: '/img/game/puzzle/7M.jpg',
            fullFace: '/img/game/puzzle/7F.jpg',
        },
        {
            leftEye: '/img/game/puzzle/8L.jpg',
            nose: '/img/game/puzzle/8N.jpg',
            rightEye: '/img/game/puzzle/8R.jpg',
            mouth: '/img/game/puzzle/8M.jpg',
            fullFace: '/img/game/puzzle/8F.jpg',
        },
        {
            leftEye: '/img/game/puzzle/9L.jpg',
            nose: '/img/game/puzzle/9N.jpg',
            rightEye: '/img/game/puzzle/9R.jpg',
            mouth: '/img/game/puzzle/9M.jpg',
            fullFace: '/img/game/puzzle/9F.jpg',
        },
        {
            leftEye: '/img/game/puzzle/10L.jpg',
            nose: '/img/game/puzzle/10N.jpg',
            rightEye: '/img/game/puzzle/10R.jpg',
            mouth: '/img/game/puzzle/10M.jpg',
            fullFace: '/img/game/puzzle/10F.jpg',
        }
    ];

    let selectedImages = [];
    let currentQuestionIndex = 0;
    let questionCount = 0; // 문제 진행 횟수

    // 문제를 랜덤으로 선택하는 함수
    function loadRandomQuestion() {
        if (selectedImages.length === 0) {
            // 5명 랜덤 선택
            selectedImages = images.sort(() => 0.5 - Math.random()).slice(0, 5);
            currentQuestionIndex = 0; // 게임이 시작되면 첫 번째 문제부터
        }

        const person = selectedImages[currentQuestionIndex];

        // 각 이미지 요소에 src 값 설정
        document.getElementById('left-eye').src = person.leftEye;
        document.getElementById('nose').src = person.nose;
        document.getElementById('right-eye').src = person.rightEye;
        document.getElementById('mouth').src = person.mouth;

        // 정답 이미지 설정
        document.getElementById('full-face').style.display = 'none';
        document.getElementById('full-face').querySelector('img').src = person.fullFace;
    }

    // 정답을 맞혔는지 확인하는 함수
    function checkAnswer() {
        document.getElementById('full-face').style.display = 'block';
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
        loadRandomQuestion();
        document.getElementById('next-question').textContent = '다음 문제'; // '다음 문제' 버튼으로 텍스트 변경
        document.getElementById('next-question').removeEventListener('click', resetGame);
        document.getElementById('next-question').addEventListener('click', nextQuestion);
    }

    // 페이지가 로드될 때 첫 번째 문제를 로드
    window.onload = loadRandomQuestion;

    // 버튼에 이벤트 리스너 추가
    document.getElementById('check-answer').addEventListener('click', checkAnswer);
    document.getElementById('next-question').addEventListener('click', nextQuestion);
</script>
</body>
</html>
