<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>VOTE(MAIN)</title>
</head>
<body>

<!-- 전체 콘텐츠를 감싸는 container div 추가 -->
<div class="outer-container">
    <!-- title-container -->
    <div class="title-container">
        <h2><span> 캐릭터 이상형 월드컵 16강 </span></h2>
    </div>

    <br>

    <!-- card-container -->
    <div class="card-container">
        <!-- 여성 캐릭터 카드 -->
        <div class="card">
            <div class="card text-center">
                <div class="card-body">
                    <h5 class="card-title" style="font-weight: bold;">여성 캐릭터</h5><hr>
                    <h6 class="card-subtitle mb-2 text-muted">
                        <img src="/img/vote/worldcup/woman.jpg" style="width: 180px; height: 180px;">
                    </h6>
                    <div class="btn-group">
                        <button class="btn" onclick="window.location.href='jsp/vote/worldcup/worldcup_popup_women.jsp'">
                            시작
                        </button>
                        <button class="btn" onclick="window.location.href='jsp/vote/worldcup/womrank.jsp';">
                            랭킹
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- 남성 캐릭터 카드 -->
        <div class="card">
            <div class="card text-center">
                <div class="card-body">
                    <h5 class="card-title" style="font-weight: bold;">남성 캐릭터</h5><hr>
                    <h6 class="card-subtitle mb-2 text-muted">
                        <img src="/img/vote/worldcup/man.jpg" style="width: 180px; height: 180px;">
                    </h6>
                    <div class="btn-group">
                        <button class="btn" onclick="window.location.href='jsp/vote/worldcup/worldcup_popup_men.jsp'">
                            시작
                        </button>
                        <button class="btn" onclick="window.location.href='jsp/vote/worldcup/manrank.jsp';">
                            랭킹
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

<style>
    /* 외부 컨테이너 스타일 */
    .outer-container {
        height: 100vw;
        width: 100%;
        max-width: 1200px;
        margin: 0 auto; /* 화면 중앙 정렬 */
        padding: 20px;
        border: solid 3pt red; /* 빨간색 3pt 테두리 */
        position: relative; /* 자식 요소들에 상대적인 위치 지정 */
    }

    /* title-container 스타일 */
    .title-container {
        position: absolute;
        text-align: center;
        left: 50%;
        transform: translateX(-50%);
        width: 1000px;
        height: 150px;
        border-radius: 50px;
        box-shadow: 5px 10px 5px #ccc;
    }

    h2 {
        color: black;
        opacity: 0;
        animation: fadeInLetters 2s forwards;
        display: inline-block;
        transform: translateX(-50%);
        left: 50%;
        font-size: 50px;
    }

    @keyframes fadeInLetters {
        from {
            opacity: 0;
            transform: translateX(-20px);
        }
        to {
            opacity: 1;
            transform: translateX(0);
        }
    }

    /* card-container 스타일 */
    .card-container {
        display: flex;
        justify-content: center;
        align-items: center;
        position: absolute;
        margin-top: 150px;
        width: 1000px;
        left: 50%;
        transform: translateX(-50%);
        gap: 20px;
    }

    /* card 스타일 */
    .card {
        width: 470px;
        height: 380px;
        border: 1px solid #ccc;
        text-align: center;
    }

    /* 버튼 스타일 */
    .btn {
        width: 200px;
        height: 30px;
        transition: all 0.3s ease-in-out;
        background-color: rgba(125, 58, 210, 0.15);
    }

    .btn:hover {
        transform: scale(1.1);
    }
</style>

</html>
