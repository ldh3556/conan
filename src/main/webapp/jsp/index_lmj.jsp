<%--
  Created by IntelliJ IDEA.
  User: hwangdonghyuk
  Date: 2025. 1. 9.
  Time: 오후 4:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> MAIN_HDH </title>
</head>
<link rel="stylesheet" href="../css/index.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css">
<body>
<div class="wrapper">

    <div class="header">
        <button class="menu_button">
        </button>
        <div class="conan_logo">
            <img src="../img/index/logoimg.png">
        </div>
        <div class="account_wrapper">
            <div class="login_text_wrapper">
                <span>로그인</span> 해주세요.
                <div class="login_text">
                    <a href="/LoginC" id="login_text_id"> 로그인 </a>
                    <a href="/AccountC" id="login_text_reg"> 회원가입 </a>
                </div>
            </div>
            <a href="/LoginC" id="account_icon"></a>
        </div>
    </div>
    <div class="index_Sec01">
        <div class="index_Sec01_L">ame/loading/game_lo
            <a class="playlogo_wrapper" href="game/loading/loading.jsp">
                <img src="../img/index/conandex_customicon.png" class="conan_attr_logo">
                <span id="play">PLAY</span>
            </a>
        </div>
        <div class="index_Sec01_R">
            <a class="votelogo_wrapper">
                <img src="../img/index/conandex_customicon.png" class="conan_attr_logo">
                <span id="vote">VOTE</span>
            </a>
        </div>
    </div>
    <div class="index_Sec02">
        <div class="index_Sec02_L">
            <div class="Sec02_Text_Animation">
            <h1 class="textStyle">나의 최애캐는</h1>
            <div class="textAniBox">
                <h2 class="textStyle textAni1">코난</h2>
                <h2 class="textStyle textAni2">미란이</h2>
                <h2 class="textStyle textAni3">괴도키드</h2>
                <h2 class="textStyle textAni4">하인성</h2>
                <h2 class="textStyle textAni5">유명한</h2>
            </div>
            <h1 class="textStyle">이다.</h1>
        </div>
            <div class="Sec02_conandex">
                <img src="../img/index/conandex_customicon_big.png" id="conandexicon">
                <a class="conandex_go"><span class="arrow_left"></span>캐릭터 정보 확인하기</a>
            </div>
        </div>
        <div class="index_Sec02_R">
            <div class="index_Sec02_introbox">
            <swiper-container
                    class="Sec02_Swiper_wrapper"
                    style="--swiper-navigation-color: #fff; width: 100%; --swiper-pagination-color: #fff" class="mySwiper"
                speed="600" parallax="true" pagination="true" pagination-clickable="true" navigation="true">
                <div slot="container-start" class="parallax-bg"
                     style="background-image: url(https://swiperjs.com/demos/images/nature-1.jpg);" data-swiper-parallax="-23%"></div>

                <swiper-slide class="charabox c01">
                    <div class="title" data-swiper-parallax="-300">Slide 1</div>
                    <div class="subtitle" data-swiper-parallax="-200">Subtitle</div>
                    <div class="text" data-swiper-parallax="-100">
                        <p>
                            내용1
                        </p>
                    </div>
                </swiper-slide>
                <swiper-slide class="charabox c02">
                    <div class="title" data-swiper-parallax="-300">Slide 2</div>
                    <div class="subtitle" data-swiper-parallax="-200">Subtitle</div>
                    <div class="text" data-swiper-parallax="-100">
                        <p>
                            내용1
                        </p>
                    </div>
                </swiper-slide>
                <swiper-slide class="charabox c03">
                    <div class="title" data-swiper-parallax="-300">Slide 3</div>
                    <div class="subtitle" data-swiper-parallax="-200">Subtitle</div>
                    <div class="text" data-swiper-parallax="-100">
                        <p>
                            내용1
                        </p>
                    </div>
                </swiper-slide>
                <swiper-slide class="charabox c04">
                    <div class="title" data-swiper-parallax="-300">Slide 3</div>
                    <div class="subtitle" data-swiper-parallax="-200">Subtitle</div>
                    <div class="text" data-swiper-parallax="-100">
                        <p>
                            내용1
                        </p>
                    </div>
                </swiper-slide>
                <swiper-slide class="charabox c05">
                    <div class="title" data-swiper-parallax="-300">Slide 3</div>
                    <div class="subtitle" data-swiper-parallax="-200">Subtitle</div>
                    <div class="text" data-swiper-parallax="-100">
                        <p>
                            내용1
                        </p>
                    </div>
                </swiper-slide>
                <swiper-slide class="charabox c06">
                    <div class="title" data-swiper-parallax="-300">Slide 3</div>
                    <div class="subtitle" data-swiper-parallax="-200">Subtitle</div>
                    <div class="text" data-swiper-parallax="-100">
                        <p>
                            내용1
                        </p>
                    </div>
                </swiper-slide>
            </swiper-container>
        </div>

    </div>


</div>
    <div class="index_Sec03">
        <div class="index_Sec03_L">
            <div class="movie_box_wrapper">
                <a class="moviebox_01">
                    <img src="">
                    <div class="moviebox_text">
                        <span>명탐정코난 X 소년선데이</span>
                        <span>콜라보 확정!</span>
                        <span>굿즈 출시</span>
                        <span class="to_go_movie_event">
                            자세히 보기
                            <span class="arrow"></span>
                        </span>
                    </div>
                </a>
                <a class="moviebox_01">
                    <img>
                    <div class="moviebox_text">
                        <span>명탐정코난 :</span>
                        <span>100만 달러의 펜타그램</span>
                        <span>개봉!</span>
                        <span class="to_go_movie_event">
                            자세히 보기
                            <span class="arrow"></span>
                        </span>
                    </div>
                </a>
                <a class="moviebox_01">
                    <img src="../img/index/sec03_img.jpg">
                    <div class="moviebox_text">
                        <span>소년 선데이 S 2월호</span>
                        <span>절찬 발매 중</span>
                        <span></span>
                        <span class="to_go_movie_event">
                            자세히 보기
                            <span class="arrow"></span>
                        </span>
                    </div>
                </a>

            </div>
        </div>
        <div class="index_Sec03_R">
            <div class="commu_box_wrapper">

            </div>
        </div>

    </div>
    <div class="footer"></div>
</div>



<a href="/Vote_worldcupC"> 이상형 월드컵 </a> / <a href="/Vote_OSTC"> OST 투표 </a> / <a href="/Vote_storyC"> 스토리 투표 </a>

<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>

</body>
</html>
