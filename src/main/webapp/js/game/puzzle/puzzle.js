// 정답 (예: "코난")
const correctAnswer = "코난";

// 사진의 각 부분을 클릭 가능하게 만들고, 사용자가 클릭한 부분을 확인하여 결과를 출력합니다.
const eyeLeft = document.getElementById("left-eye");
const eyeRight = document.getElementById("right-eye");
const nose = document.getElementById("nose");
const mouth = document.getElementById("mouth");

let selectedAnswer = "";

function setAnswer(answer) {
    selectedAnswer = answer;
    checkAnswer();
}

function checkAnswer() {
    const result = document.getElementById("result");
    if (selectedAnswer === correctAnswer) {
        result.textContent = "정답입니다! 코난!";
    } else {
        result.textContent = "틀렸습니다. 다시 시도해보세요!";
    }
}

// 각 div에 클릭 이벤트를 추가
eyeLeft.addEventListener("click", () => setAnswer("코난"));
eyeRight.addEventListener("click", () => setAnswer("코난"));
nose.addEventListener("click", () => setAnswer("코난"));
mouth.addEventListener("click", () => setAnswer("코난"));
