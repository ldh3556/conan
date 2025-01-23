<%--
  Created by IntelliJ IDEA.
  User: 82102
  Date: 25. 1. 21.
  Time: 오전 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <title> GAME SELECT </title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"/>
    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>

    <!-- Demo styles -->
    <style>
        span.swiper-pagination-bullet{
            border: 2px solid #ffffff;
        }
        html,
        body {
            position: relative;
            height: 100%;
        }

        body {
            background: #eee;
            font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
            font-size: 14px;
            color: #000;
            margin: 0;
            padding: 0;
            background: url("/img/index/sec_bg_2.jpg");
        }

        .swiper {
            position: absolute;
            top: 150px;
            display: flex;
            justify-content: center;
            width: 100%;
        }

        .swiper-slide {
            background-position: center;
            background-size: cover;
            width: 500px;
            height: 500px;
            border-radius: 100%;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: center;
            font-size: 30pt;
            color: #001a6d;
            background: #ffffff;
            font-weight: bold;
            text-decoration: none;
            gap: 0;
            opacity: 0.5;
        }

        a.swiper-slide.swiper-slide-visible.swiper-slide-fully-visible.swiper-slide-active{
            opacity: 1;
        }

        .swiper-slide img {
            display: block;
            width: 100%;
        }

        .swiper-slide span {
            margin: 0 30px;
        }
    </style>
    <link rel="stylesheet" href="/css/index.css">
</head>

<body>
<div class="wrapper">

    <div class="header">
        <button class="menu_button">
        </button>
        <a class="conan_logo" href="/index.jsp">
            <img src="/img/index/logoimg.png">
        </a>

        <jsp:include page="${loginPage}"></jsp:include>

    </div>
    <!-- Swiper -->
    <div class="swiper mySwiper">
        <div class="swiper-wrapper">

            <a class="swiper-slide" href="/LoadingFaceGameC">
                <span>인물 맞추기</span>
            </a>
            <a class="swiper-slide" href="/balloon/">
                <span>말풍선 채워넣기</span>
            </a>
            <a class="swiper-slide" href="/jsp/game/destiny/destiny.jsp">
                <span>나의 운명의</span>
                <span style="font-size: 40pt">캐릭터</span>
            </a>
        </div>
        <div class="swiper-pagination"></div>
    </div>
</div>

<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

<!-- Initialize Swiper -->
<script>
    var swiper = new Swiper(".mySwiper", {
        effect: "coverflow",
        grabCursor: true,
        centeredSlides: true,
        slidesPerView: "auto",
        loop:true,
        coverflowEffect: {
            rotate: 50,
            stretch: 0,
            depth: 100,
            modifier: 1,
            slideShadows: true,
        },
        pagination: {
            el: ".swiper-pagination",
        },
    });
</script>
</body>

</html>

