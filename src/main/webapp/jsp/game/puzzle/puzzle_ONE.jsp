<%--
  Created by IntelliJ IDEA.
  User: hwangdonghyuk
  Date: 2025. 1. 13.
  Time: 오후 5:58
  To change this template use File | Settings | File Templates.
--%>
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
            text-align: center;
            margin-top: 20px;
        }

        /* 상단 행 (눈과 코) */
        .top-row {
            display: flex;
            justify-content: center; /* 가운데 정렬 */
            width: 100%;
            margin-bottom: 10px;
            gap: 10px; /* 이미지 간 간격을 줄 수 있습니다 */
        }

        .eye, .nose, .mouth {
            background-image: url('/img/game/puzzle/test.webp'); /* 여기에 이미지 경로 넣기 */
            background-size: cover;
            background-repeat: no-repeat;
            border: 3px solid red; /* 빨간색 테두리 추가 */
        }

        /* 왼쪽 눈 */
        .left-eye {
            width: 100px;
            height: 100px;
            background-position: -10px -30px; /* 왼쪽 눈 위치 */
        }

        /* 코 */
        .nose {
            width: 100px;
            height: 100px;
            background-position: -60px -80px; /* 코 위치 */
        }

        /* 오른쪽 눈 */
        .right-eye {
            width: 100px;
            height: 100px;
            background-position: -110px -30px; /* 오른쪽 눈 위치 */
        }

        /* 하단 행 (입) */
        .bottom-row {
            display: flex;
            justify-content: center; /* 가운데 정렬 */
            width: 100%;
            margin-top: 10px;
        }

        /* 입 */
        .mouth {
            width: 250px;
            height: 100px;
            background-position: -50px -160px; /* 입 위치 */
        }

        /* 버튼 및 결과 스타일 */
        #result {
            margin-top: 20px;
            font-size: 20px;
            font-weight: bold;
        }

        .clickable {
            cursor: pointer;
            outline: none;
        }

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
    <!-- 상단 행 (눈과 코) -->
    <div class="top-row">
        <div class="eye left-eye clickable" id="left-eye"></div>
        <div class="nose clickable" id="nose"></div>
        <div class="eye right-eye clickable" id="right-eye"></div>
    </div>

    <!-- 하단 행 (입) -->
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
