<%--
  Created by IntelliJ IDEA.
  User: hwangdonghyuk
  Date: 2025. 1. 15.
  Time: 오전 9:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> WORLDCUP </title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: Arial, sans-serif;
        background-color: #f7f7f7;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        flex-direction: column;
    }

    .container {
        text-align: center;
    }

    #round-title {
        font-size: 30px;
        margin-bottom: 20px;
    }

    #matchup {
        display: flex;
        justify-content: space-around;
        margin-bottom: 20px;
    }

    .photo {
        width: 200px;
        height: 300px;
        cursor: pointer;
        transition: transform 0.3s;
    }

    .photo img {
        width: 100%;
        height: 80%;
        object-fit: cover;
    }

    .photo p {
        font-size: 16px;
        margin-top: 10px;
    }

    #next-round {
        padding: 10px 20px;
        font-size: 18px;
        cursor: pointer;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        margin-top: 20px;
    }

    #next-round:disabled {
        background-color: #cccccc;
    }

    #final-winner {
        font-size: 50px;
        margin-top: 30px;
        font-weight: bold;
    }

    .photo:hover {
        transform: scale(1.05);
    }

    .photo:active {
        transform: scale(1.1);
    }
</style>
</head>
<body>

<div class="container">
    <div id="round-title">16강</div>
    <div id="matchup">
        <div class="photo" id="photo1">
            <img src="" alt="Photo 1" id="image1">
            <p id="name1"></p>
        </div>
        <div class="photo" id="photo2">
            <img src="" alt="Photo 2" id="image2">
            <p id="name2"></p>
        </div>
    </div>
    <button id="next-round" disabled>다음 라운드</button>
    <div id="final-winner"></div>
</div>

<script>
    // 사진 데이터 (30장)
    const photos = [
        { src: 'photo1.jpg', name: '이름1' },
        { src: 'photo2.jpg', name: '이름2' },
        { src: 'photo3.jpg', name: '이름3' },
        { src: 'photo4.jpg', name: '이름4' },
        { src: 'photo5.jpg', name: '이름5' },
        { src: 'photo6.jpg', name: '이름6' },
        { src: 'photo7.jpg', name: '이름7' },
        { src: 'photo8.jpg', name: '이름8' },
        { src: 'photo9.jpg', name: '이름9' },
        { src: 'photo10.jpg', name: '이름10' },
        { src: 'photo11.jpg', name: '이름11' },
        { src: 'photo12.jpg', name: '이름12' },
        { src: 'photo13.jpg', name: '이름13' },
        { src: 'photo14.jpg', name: '이름14' },
        { src: 'photo15.jpg', name: '이름15' },
        { src: 'photo16.jpg', name: '이름16' },
        { src: 'photo17.jpg', name: '이름17' },
        { src: 'photo18.jpg', name: '이름18' },
        { src: 'photo19.jpg', name: '이름19' },
        { src: 'photo20.jpg', name: '이름20' },
        { src: 'photo21.jpg', name: '이름21' },
        { src: 'photo22.jpg', name: '이름22' },
        { src: 'photo23.jpg', name: '이름23' },
        { src: 'photo24.jpg', name: '이름24' },
        { src: 'photo25.jpg', name: '이름25' },
        { src: 'photo26.jpg', name: '이름26' },
        { src: 'photo27.jpg', name: '이름27' },
        { src: 'photo28.jpg', name: '이름28' },
        { src: 'photo29.jpg', name: '이름29' },
        { src: 'photo30.jpg', name: '이름30' },
    ];

    let selectedPhotos = []; // 선택된 사진들
    let currentRound = 16; // 16강부터 시작

    // 라운드에 맞게 랜덤으로 2개씩 선택
    function getRandomMatchup() {
        const randomIndexes = [];
        while (randomIndexes.length < 2) {
            const randomIndex = Math.floor(Math.random() * photos.length);
            if (!randomIndexes.includes(randomIndex)) {
                randomIndexes.push(randomIndex);
            }
        }
        return [photos[randomIndexes[0]], photos[randomIndexes[1]]];
    }

    // 사진을 화면에 표시
    function displayMatchup() {
        const [photo1, photo2] = getRandomMatchup();

        document.getElementById('image1').src = photo1.src;
        document.getElementById('name1').innerText = photo1.name;
        document.getElementById('image2').src = photo2.src;
        document.getElementById('name2').innerText = photo2.name;
    }

    // 선택된 사진을 저장
    function selectPhoto(selectedPhoto) {
        selectedPhotos.push(selectedPhoto);
        if (selectedPhotos.length === currentRound / 2) {
            document.getElementById('next-round').disabled = false;
        }
    }

    // 라운드 진행
    document.getElementById('next-round').addEventListener('click', () => {
        if (currentRound > 1) {
            currentRound /= 2; // 라운드 절반으로
            selectedPhotos = []; // 선택된 사진 초기화
            document.getElementById('next-round').disabled = true; // 버튼 비활성화
            document.getElementById('round-title').innerText = `${currentRound}강`;

            // 선택된 사진들로 다시 설정
            photos.length = 0;
            photos.push(...selectedPhotos);
            displayMatchup();
        } else {
            // 결승전 진행
            document.getElementById('round-title').innerText = '결승전';
            const winner = selectedPhotos[0];
            document.getElementById('image1').src = winner.src;
            document.getElementById('name1').innerText = winner.name;
            document.getElementById('next-round').style.display = 'none'; // 결승 끝나면 버튼 숨기기
            document.getElementById('final-winner').innerText = `${winner.name} 승리!`;
        }
    });

    // 사진 선택 이벤트
    document.getElementById('photo1').addEventListener('click', () => selectPhoto(photos[0]));
    document.getElementById('photo2').addEventListener('click', () => selectPhoto(photos[1]));

    // 초기 게임 시작
    displayMatchup();
</script>

</body>
</html>
