<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>눈 코 입 퀴즈</title>
    <style>
        /* 전체 컨테이너 스타일 */
        .quiz-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 60%; /* 크기를 적당히 설정 */
            margin: 20px auto;
            border: 2px solid #ccc; /* 박스 경계선 */
            padding: 15px;
            box-sizing: border-box;
        }

        /* 2번째 줄 (입) */
        .row {
            width: 100%;
            display: flex;
            justify-content: center; /* 사진을 가로로 중앙 정렬 */
        }

        .pic {
            width: 800px;
            height: 400px;
            background-image: url('/img/game/puzzle/conan_blur.png'); /* 이미지 경로 */
            background-size: cover; /* 이미지가 div 크기에 맞게 커지도록 설정 */
            background-position: center; /* 이미지가 div 중심에 맞춰지도록 설정 */
        }

        /* 결과 표시 */
        #result {
            margin-top: 20px;
            font-size: 20px;
            font-weight: bold;
        }

        /* 4지선다 버튼 스타일 */
        .answer-btn {
            margin-top: 15px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            width: 200px;
        }

        .answer-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="quiz-container">

    <!-- 2번째 줄 (입) -->
    <div class="row">
        <div class="pic"></div>
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
    // 정답 (예: "코난")
    const correctAnswer = "코난";

    // 스코어 변수
    let score = 0;

    // 4지선다 버튼 클릭 시 선택된 답을 확인하고 결과를 처리하는 함수
    function checkAnswer(selectedAnswer) {
        const result = document.getElementById("result");
        if (selectedAnswer === correctAnswer) {
            score++; // 정답을 맞히면 점수 증가
            result.textContent = "정답입니다! 코난!";
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

    // 각 4지선다 버튼에 클릭 이벤트 추가
    document.getElementById("answer1").addEventListener("click", () => checkAnswer("코난"));
    document.getElementById("answer2").addEventListener("click", () => checkAnswer("하이바라 아이"));
    document.getElementById("answer3").addEventListener("click", () => checkAnswer("오키야"));
    document.getElementById("answer4").addEventListener("click", () => checkAnswer("모리 란"));
</script>
</body>
</html>
