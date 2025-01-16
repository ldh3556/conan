<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>

<!-- 타이틀 -->
<div class="title-container">
    <h2><span><%= request.getParameter("gender") %> 캐릭터 랭킹</span></h2>
</div>

<br>

<!-- 카드 컨테이너 -->
<div class="card-container">
    <div class="card">
        <div class="card text-center">
            <div class="card-body">
                <h5 class="card-title" style="font-weight: bold;">1등</h5><hr>
                <h6 class="card-subtitle mb-2 text-muted">
                    <img src="우승자 사진.jpg" style="width: 180px; height: 180px;">
                </h6>
                <h5>우승자 이름</h5>
                <h5>우승 비율</h5>
            </div>
        </div>
    </div>

    <!-- 다른 순위들 -->
</div>
</body>

<style>
    .title-container{
        position: absolute;
        text-align: center;
        left: 50%;
        transform: translateX(-50%);
        width: 1000px;
        height: 150px;
        /*background: skyblue;*/
        border-radius: 50px;
        box-shadow: 5px 10px 5px #ccc;
    }

    h2 {
        color: black;
        opacity: 0;
        animation: fadeInLetters 2s forwards;
        display: inline-block;transform: translateX(-50%);
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

    h2 span {
        display: inline-block;
        opacity: 0;
        animation: fadeInLetter 0.5s forwards;
    }

    @keyframes fadeInLetter {
        from {
            opacity: 0;
            transform: translateY(-20px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
    .card-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
        position: absolute;
        margin-top: 150px;
        width: 1000px;
        left: 50%;
        transform: translateX(-50%);
        gap: 20px;
    }

    .card {
        width: 270px;
        height: 380px;
        border: 1px solid #ccc;
        text-align: center;
        margin-bottom: 20px;
    }

</style>
</html>