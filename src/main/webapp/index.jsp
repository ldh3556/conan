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
    <title> CONAN'DEX </title>
    <style>

    </style>
</head>
<link rel="stylesheet" href="css/index.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css">
<body>
<div class="wrapper">

    <div class="header">
        <button class="menu_button">
        </button>
        <div class="conan_logo">
            <img src="/img/index/logoimg.png">
        </div>

                <jsp:include page="${loginPage}"></jsp:include>
    </div>


    <div class="index_Sec01">
        <div class="index_Sec01_L">
            <a class="playlogo_wrapper" href="/jsp/game/loading/loading.jsp">
                <img src="/img/index/conandex_customicon.png" class="conan_attr_logo">
                <span id="play">PLAY</span>
            </a>
        </div>
        <div class="index_Sec01_R">
            <a class="votelogo_wrapper" href="/jsp/vote/loading/loading.jsp">
                <img src="/img/index/conandex_customicon.png" class="conan_attr_logo">
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


            <%----%>
            <div class="Sec02_conandex" onclick="location.href='CharacterListC'">
                <img src="/img/index/conandex_customicon_big.png" id="conandexicon">
                <%----%>
                <a class="conandex_go"><span class="arrow_left"></span>캐릭터 정보 확인하기</a>

            </div>
        </div>
        <div class="index_Sec02_R">
            <div class="index_Sec02_introbox">
                <swiper-container
                        class="Sec02_Swiper_wrapper"
                        style="--swiper-navigation-color: #fff; width: 100%; --swiper-pagination-color: #fff"
                        class="mySwiper"
                        speed="600" parallax="true" pagination="true" pagination-clickable="true" navigation="true">
                    <div slot="container-start" class="parallax-bg"
                         style="background-image: url(https://swiperjs.com/demos/images/nature-1.jpg);"
                         data-swiper-parallax="-23%"></div>

                    <swiper-slide class="charabox c01">
                        <div class="title" data-swiper-parallax="-300">코난</div>
                        <div class="subtitle" data-swiper-parallax="-200">명탐정 코난의 주인공</div>
                        <div class="text" data-swiper-parallax="-100">
                            <p>
                                그의 정체는 검은 조직이 개발한 정체 불명의 알약(APTX4869)을 먹고
                                어린아이의 모습이된<br> 고등학생 탐정 남도일이다.
                                검은 조직으로부터 정체를 숨기기 위해 코난이라는
                                <br> 이름으로 아버지가 탐정사무소를 하는
                                소꿉친구인 미란이의 집에서 함께 지내고 있다.
                            </p>
                        </div>
                    </swiper-slide>
                    <swiper-slide class="charabox c02">
                        <div class="title" data-swiper-parallax="-300">남도일</div>
                        <div class="subtitle" data-swiper-parallax="-200">천재 고등학생 명탐정</div>
                        <div class="text" data-swiper-parallax="-100">
                            <p>
                                코난의 본 모습이자 미란이의 소꿉친구, 세계적인 추리소설가인 아버지<br>
                                ,남건과 대배우인 어머니, 이하연의 아들이다. 그의 뛰어난 추리두뇌는<br>
                                아버지의 영향을 많이 받았으며, 코난의 모습으로 여러가지 사건 사고를<br>
                                해결해나간다.
                            </p>
                        </div>
                    </swiper-slide>
                    <swiper-slide class="charabox c03">
                        <div class="title" data-swiper-parallax="-300">유명한</div>
                        <div class="subtitle" data-swiper-parallax="-200">소꿉친구, 미란이의 아버지</div>
                        <div class="text" data-swiper-parallax="-100">
                            <p>
                                미란이의 아버지이자, 탐정으로 활동중이다.<br>
                                유능한 형사이던 그는 경찰을 은퇴하고 탐정사무소를 차렸다. 코난과 함께<br>
                                항상 온갖 사건 사고에 휘말리며, 코난은 그의 목소리를 빌려 사건을 해결한다.
                            </p>
                        </div>
                    </swiper-slide>
                    <swiper-slide class="charabox c04">
                        <div class="title" data-swiper-parallax="-300">브라운 박사</div>
                        <div class="subtitle" data-swiper-parallax="-200">코난의 옆집에 사는 천재 발명가</div>
                        <div class="text" data-swiper-parallax="-100">
                            <p>
                                남도일이 어릴적부터 옆집에 살았던 천재 발명가이다.<br>
                                코난이 사용하는 발명품들을 만든 장본인이다.<br>
                                현재는 집에서 검은조직의 일원이었던 홍장미와 함께 지내고 있다.
                            </p>
                        </div>
                    </swiper-slide>
                    <swiper-slide class="charabox c05">
                        <div class="title" data-swiper-parallax="-300">유미란</div>
                        <div class="subtitle" data-swiper-parallax="-200">남도일의 소꿉친구</div>
                        <div class="text" data-swiper-parallax="-100">
                            <p>
                                아버지인 유명한 탐정을 따라다니며, 항상 사건에 휘말린다.<br>
                                태권도 유단자이며 전국체전에서 우승한 적도 있는 실력자이다.<br>
                                도일이와 오랜시간을 함께 지내며 둘은 연애를 하고있다.
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
                    <div class="movie_img">
                        <img src="/img/index/sec03_banner_250122(1).jpg">
                    </div>
                    <div class="moviebox_text">
                        <p>25.01.22</p>
                        <div class="span_wrap">
                            <span>신규 굿즈</span>
                            <span>[천문학자] 시리즈 출시!</span>
                        </div>
                        <span class="to_go_movie_event">
                            자세히 보기
                            <span class="arrow"></span>
                        </span>
                    </div>
                </a>
                <a class="moviebox_01">
                    <div class="movie_img">
                        <img src="/img/index/sec03_banner_250122(2).jpg">
                    </div>
                    <div class="moviebox_text">
                        <p>25.01.22</p>
                        <div class="span_wrap">
                            <span>주간 소년 선데이 8호</span>
                            <span>오늘 발매!</span>
                        </div>
                        <span></span>
                        <span class="to_go_movie_event">
                            자세히 보기
                            <span class="arrow"></span>
                        </span>
                    </div>
                </a>
                <a class="moviebox_01">
                    <div class="movie_img">
                        <img src="/img/index/sec03_banner_241226(1).jpg">
                    </div>
                    <div class="moviebox_text">
                        <p>24.12.26</p>
                        <div class="span_wrap">
                            <span>소년 선데이 S 2월호</span>
                            <span>절찬 발매 중</span>
                        </div>
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
                <div class="notice_togo">
                    <span>Community</span>
                    <a href="BoardHC"> 커뮤니티 바로가기</a>
                </div>
                <hr style="width: 100%">
                <a class="commu_post_wrapper">
                    <span>[공지사항]</span>
                    <span>사이트 운영 방침 안내</span>
                    <span>2025.01.22</span>
                </a>
                <a class="commu_post_wrapper">
                    <span>[공지사항]</span>
                    <span>사이트 운영 방침 안내</span>
                    <span>2025.01.22</span>
                </a>
                <a class="commu_post_wrapper">
                    <span>[자유게시판]</span>
                    <span>요즘 코난</span>
                    <span>2025.01.22</span>
                </a>
                <a class="commu_post_wrapper">
                    <span>[영화 후기]</span>
                    <span>내돈내산 100만 달러의 펜타그램</span>
                    <span>2025.01.22</span>
                </a>
            </div>
        </div>

    </div>
    <div class="footer">
        <a>이용약관</a>
        <a>개인정보 처리방침</a>
        <a>About us</a>
    </div>
</div>
<a href="/Vote_worldcupC"> 이상형 월드컵 </a> / <a href="/Vote_OSTC"> OST 투표 </a> / <a href="/Vote_storyC"> 스토리 투표 </a>

<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>

</body>
</html>
