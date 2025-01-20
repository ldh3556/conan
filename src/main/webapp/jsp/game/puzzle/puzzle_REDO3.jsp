<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 인물 맞추기 퀴즈 </title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .game-container {
            text-align: center;
            background-color: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            font-size: 2rem;
            margin-bottom: 20px;
        }

        .photo-container {
            margin-bottom: 30px;
        }

        img {
            width: 300px;
            height: 300px; /* 높이를 지정하여 크기를 일정하게 유지 */
            object-fit: cover; /* 이미지가 크기에 맞게 잘리거나 비율을 맞추어 표시 */
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .options-container {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            justify-content: center;
            margin-bottom: 20px;
        }

        .option-btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 15px;
            font-size: 1rem;
            cursor: pointer;
            border-radius: 5px;
            min-width: 120px;
            text-align: center;
        }

        .option-btn:hover {
            background-color: #0056b3;
        }

        .option-btn.correct {
            background-color: #28a745;
        }

        .option-btn.wrong {
            background-color: #dc3545;
        }

        /* 버튼을 가로로 나열하기 위한 flexbox 스타일 */
        .button-container {
            display: flex;
            justify-content: center;
            gap: 20px;  /* 버튼들 간의 간격을 설정 */
            margin-top: 20px;
        }

        #retry-btn, #show-answer-btn, #next-btn {
            background-color: #17a2b8;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            flex: 1;  /* 버튼들이 고르게 크기를 가지게 함 */
        }

        #retry-btn {
            background-color: #ffc107;
        }

        #show-answer-btn {
            background-color: #28a745;
        }

        #next-btn {
            background-color: #007bff;
        }

        /* 버튼들에 hover 효과 */
        #next-btn:hover, #retry-btn:hover, #show-answer-btn:hover {
            background-color: #138496;
        }

        .game-over {
            font-size: 1.5rem;
            color: #dc3545;
            margin-top: 20px;
        }

    </style>
</head>
<body>

<div class="game-container">
    <h1> 인물 맞추기 퀴즈 </h1>
    <div class="photo-container">
        <img id="game-photo" src="" alt="사진">
    </div>
    <div class="options-container">
        <!-- 옵션 버튼들이 여기에 동적으로 추가됩니다 -->
    </div>
    <!-- 버튼들을 가로로 나열할 컨테이너 -->
    <div class="button-container">
        <button id="show-answer-btn" onclick="showAnswer()">정답 보기</button>
        <button id="next-btn" onclick="nextQuestion()">다음 문제</button>
        <button id="retry-btn" onclick="restartGame()">다시하기</button>
    </div>
    <div id="game-over-message" class="game-over" style="display: none;">
        게임이 끝났습니다!
    </div>
</div>

<script>
    const questions = [
        {
            photo: "/img/game/puzzle/agasaP.jpg", // 문제 사진
            correctPhoto: "/img/game/puzzle/agasaF.jpg",  // 정답 사진
            correctAnswer: "브라운",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"],
        },
        {
            photo: "/img/game/puzzle/akaiP.jpg",
            correctPhoto: "/img/game/puzzle/akaiF.jpg",
            correctAnswer: "이상윤",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"],
        },
        {
            photo: "/img/game/puzzle/amuroP.jpg",
            correctPhoto: "/img/game/puzzle/amuroF.jpg",
            correctAnswer: "안기준",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/ayumiP.jpg",
            correctPhoto: "/img/game/puzzle/ayumiF.jpg",
            correctAnswer: "한아름",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/camelP.jpg",
            correctPhoto: "/img/game/puzzle/camelF.jpg",
            correctAnswer: "안드레 캐멜",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/chiantiP.jpg",
            correctPhoto: "/img/game/puzzle/chiantiF.jpg",
            correctAnswer: "키안티",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/chibaP.jpg",
            correctPhoto: "/img/game/puzzle/chibaF.jpg",
            correctAnswer: "이명수",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/conanP.jpg",
            correctPhoto: "/img/game/puzzle/conanF.jpg",
            correctAnswer: "코난",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/corunP.jpg",
            correctPhoto: "/img/game/puzzle/corunF.jpg",
            correctAnswer: "코른",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/gentaP.jpg",
            correctPhoto: "/img/game/puzzle/gentaF.jpg",
            correctAnswer: "고뭉치",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/ginP.jpg",
            correctPhoto: "/img/game/puzzle/ginF.jpg",
            correctAnswer: "진",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/ginshiroP.jpg",
            correctPhoto: "/img/game/puzzle/ginshiroF.jpg",
            correctAnswer: "서원상",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/haibaraP.jpg",
            correctPhoto: "/img/game/puzzle/haibaraF.jpg",
            correctAnswer: "홍장미",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/heijiP.jpg",
            correctPhoto: "/img/game/puzzle/heijiF.jpg",
            correctAnswer: "하인성",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/jamesP.jpg",
            correctPhoto: "/img/game/puzzle/jamesF.jpg",
            correctAnswer: "제임스 블랙",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/jodieP.jpg",
            correctPhoto: "/img/game/puzzle/jodieF.jpg",
            correctAnswer: "조디 센티밀리온",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/kidP.jpg",
            correctPhoto: "/img/game/puzzle/kidF.jpg",
            correctAnswer: "고희도",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/kisakiP.jpg",
            correctPhoto: "/img/game/puzzle/kisakiF.jpg",
            correctAnswer: "노애리",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/kogoroP.jpg",
            correctPhoto: "/img/game/puzzle/kogoroF.jpg",
            correctAnswer: "유명한",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/kyogokuP.jpg",
            correctPhoto: "/img/game/puzzle/kyogokuF.jpg",
            correctAnswer: "오경구",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/matsumotoP.jpg",
            correctPhoto: "/img/game/puzzle/matsumotoF.jpg",
            correctAnswer: "박종태",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/meguroP.jpg",
            correctPhoto: "/img/game/puzzle/meguroF.jpg",
            correctAnswer: "골한석",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/mitsuhikoP.jpg",
            correctPhoto: "/img/game/puzzle/mitsuhikoF.jpg",
            correctAnswer: "박세모",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/mizunashiP.jpg",
            correctPhoto: "/img/game/puzzle/mizunashiF.jpg",
            correctAnswer: "손예나",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/nakamoriP.jpg",
            correctPhoto: "/img/game/puzzle/nakamoriF.jpg",
            correctAnswer: "임은삼",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/otakiP.jpg",
            correctPhoto: "/img/game/puzzle/otakiF.jpg",
            correctAnswer: "김대용",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/ranP.jpg",
            correctPhoto: "/img/game/puzzle/ranF.jpg",
            correctAnswer: "유미란",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/sangoP.jpg",
            correctPhoto: "/img/game/puzzle/sangoF.jpg",
            correctAnswer: "천범수",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/shinichiP.jpg",
            correctPhoto: "/img/game/puzzle/shinichiF.jpg",
            correctAnswer: "남도일",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/shiratoriP.jpg",
            correctPhoto: "/img/game/puzzle/shiratoriF.jpg",
            correctAnswer: "백동훈",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/shizukaP.jpg",
            correctPhoto: "/img/game/puzzle/shizukaF.jpg",
            correctAnswer: "윤정화",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/sonokoP.jpg",
            correctPhoto: "/img/game/puzzle/sonokoF.jpg",
            correctAnswer: "정보라",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/subaruP.jpg",
            correctPhoto: "/img/game/puzzle/subaruF.jpg",
            correctAnswer: "최수현",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/tomesanP.jpg",
            correctPhoto: "/img/game/puzzle/tomesanF.jpg",
            correctAnswer: "토메씨",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/vermouthP.jpg",
            correctPhoto: "/img/game/puzzle/vermouthF.jpg",
            correctAnswer: "베르무트",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/vodkaP.jpg",
            correctPhoto: "/img/game/puzzle/vodkaF.jpg",
            correctAnswer: "워커",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        },
        {
            photo: "/img/game/puzzle/yukikoP.jpg",
            correctPhoto: "/img/game/puzzle/yukikoF.jpg",
            correctAnswer: "이하연",
            options: ["브라운", "이상윤", "안기준", "안드레 캐멜", "이명수", "코난", "코른", "고뭉치", "진", "서원상", "하기완", "우상길", "하인성", "하평무", "제임스 블랙", "천범기", "고희도", "유명한", "오경구", "송보윤", "박종태", "골한석", "박세모", "임은삼", "김대용", "천범수", "남도일", "백동훈", "최수현", "신형선", "토메씨", "워커", "정영일", "남건", "한아름", "키안티", "홍장미", "조디 센티밀리온", "서가영", "노애리", "정나혜", "김유미", "손예나", "유미란", "오지인", "양세라", "윤정화", "정보라", "베르무트", "이하연"]
        }
    ];

    let currentQuestionIndex = -1;
    let currentQuestion = null;
    let usedQuestions = [];
    let questionsToAsk = [];

    // 문제 데이터에서 5개의 랜덤 문제를 선택
    function getRandomQuestions() {
        while (questionsToAsk.length < 5) {
            const randomIndex = Math.floor(Math.random() * questions.length);
            if (!usedQuestions.includes(randomIndex)) {
                usedQuestions.push(randomIndex);
                questionsToAsk.push(questions[randomIndex]);
            }
        }
    }

    // 첫 번째 문제를 시작하기 전에 랜덤 문제 선택
    function getRandomQuestion() {
        if (questionsToAsk.length === 0) {
            showGameOver();
            return;
        }

        currentQuestion = questionsToAsk.shift();
        document.getElementById('game-photo').src = currentQuestion.photo;

        const correctAnswer = currentQuestion.correctAnswer;
        const allOptions = [...currentQuestion.options];
        const wrongOptions = allOptions.filter(option => option !== correctAnswer);
        const selectedWrongOptions = getRandomWrongOptions(wrongOptions, 3);
        const finalOptions = [correctAnswer, ...selectedWrongOptions];
        shuffleArray(finalOptions);

        // 동적으로 버튼 생성
        const optionsContainer = document.querySelector('.options-container');
        optionsContainer.innerHTML = ''; // 이전 버튼을 제거
        finalOptions.forEach(option => {
            const button = document.createElement('button');
            button.classList.add('option-btn');
            button.textContent = option;
            button.onclick = checkAnswer;
            optionsContainer.appendChild(button);
        });

        // 버튼을 다시 활성화
        const buttons = document.querySelectorAll('.option-btn');
        buttons.forEach(button => button.disabled = false);
    }

    // 게임 종료 시 메시지 표시
    function showGameOver() {
        const gameOverMessage = document.getElementById('game-over-message');
        gameOverMessage.style.display = 'block';
    }

    // 3개의 랜덤 오답 선택
    function getRandomWrongOptions(wrongOptions, num) {
        const selected = [];
        for (let i = 0; i < num; i++) {
            const randomIndex = Math.floor(Math.random() * wrongOptions.length);
            selected.push(wrongOptions[randomIndex]);
            wrongOptions.splice(randomIndex, 1);
        }
        return selected;
    }

    // 정답 체크 함수
    function checkAnswer(event) {
        const clickedButton = event.target;
        const buttons = document.querySelectorAll('.option-btn');

        if (clickedButton.textContent === currentQuestion.correctAnswer) {
            clickedButton.classList.add('correct');
        } else {
            clickedButton.classList.add('wrong');
        }

        buttons.forEach(button => button.disabled = true);
    }

    // 다음 문제로 넘어가기
    function nextQuestion() {
        getRandomQuestion();
    }

    // 게임 초기화
    function restartGame() {
        usedQuestions = [];
        questionsToAsk = [];
        getRandomQuestions();
        getRandomQuestion();

        // 게임 오버 메시지 숨기기
        document.getElementById('game-over-message').style.display = 'none';
    }

    // 정답 보기
    function showAnswer() {
        document.getElementById('game-photo').src = currentQuestion.correctPhoto;
    }

    // 배열을 랜덤으로 섞는 함수
    function shuffleArray(array) {
        for (let i = array.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            [array[i], array[j]] = [array[j], array[i]];
        }
    }

    // 게임 초기화
    window.onload = function() {
        getRandomQuestions();
        getRandomQuestion();
    };
</script>

</body>
</html>