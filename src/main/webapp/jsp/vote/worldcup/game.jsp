<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
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
                    <img src="img/ww01.jpg" style="width: 180px; height: 180px;">
                </h6>
                <h5>여기에 이름</h5>
                <h5>여기에 픽</h5>
            </div>
        </div>
    </div>

    <!-- 다른 순위들 -->
</div>
</body>

<style>
    .title-container {
        position: absolute;
        text-align: center;
        left: 50%;
        transform: translateX(-50%);
        width: 1000px;
        height: 120px;
        background: skyblue;
        border-radius: 50px;
        box-shadow: 5px 10px 5px #ccc;
    }

    img {
        width: 500px;
        height: 500px;
        cursor: pointer;
        margin-top: 110px;
    }

    .winner-container {
        position: absolute;
        text-align: center;
        left: 50%;
        transform: translateX(-50%);
        width: 500px;
        height: 500px;
        top: 100px;
        display: none; /* 초기에는 숨겨둠 */
    }

    .winner-text {
        font-size: 24px;
        font-weight: bold;
        color: black;
        margin-top: 25px;
    }
    #winnerImage {
        margin-top: 5px;
    }

    /* 호버 효과
    .hover01 img {
      -webkit-transform: scale(1);
      transform: scale(1);
      -webkit-transition: .5s ease-in-out;
      transition: .5s ease-in-out;
    }

    .hover01 img:hover {
      -webkit-transform: scale(1.3);
      transform: scale(1.3);
    }*/
</style>

</html>