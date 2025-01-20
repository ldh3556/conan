<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>버튼 클릭 카운트</title>
    <button id="next-btn" onclick="count()">+</button>
    <div id="result">0</div>
</head>
<body>

<script>
    // 클릭 횟수를 추적하는 변수
    let clickCount = 0;

    function count() {
        // 클릭 횟수가 4번 이상이면 더 이상 클릭되지 않도록
        if (clickCount >= 4) {
            return;  // 함수 종료
        }

        // 결과를 표시할 element
        const resultElement = document.getElementById('result');

        // 현재 화면에 표시된 값
        let number = resultElement.innerText;

        // 더하기
        number = parseInt(number) + 1;

        // 결과 출력
        resultElement.innerText = number;

        // 클릭 횟수 증가
        handleClick();
    }

    function handleClick() {
        // 클릭 횟수를 증가시킴
        clickCount++;
    }
</script>

</body>
</html>
