<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.conan.semi.encyclop.CharacterDTO" %>

<!DOCTYPE html>
<html>
<head>
    <title>캐릭터 도감</title>
    <!-- CSS 연동 (예: /css/style.css) -->
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/encyclop/character/character.css" />
</head>
<body>

<!-- 상단 헤더 메뉴 -->
<div class="header">
    <!-- 메뉴 버튼 예시 -->
    <img class="menu_button" <%--src="/img/encyclop/menu.png" alt="menu button"--%> />

    <!-- 중앙 로고 -->
    <img class="conan_logo" <%--src="/img/encyclop/conan_logo.png" alt="conan logo"--%> />

    <!-- 우측 프로필 아이콘 -->
    <img class="profile_icon" <%--src="/img/encyclop/profile_icon.png" alt="profile icon"--%> />

    <div class="header_login_wrapper">
        로그인 해주세요
        <div class="header_login_inner">
            <a href="/LoginC">로그인</a>
            <a href="/AccountC">회원가입</a>
        </div>
    </div>
</div>

<!-- 상단 Category 바 -->
<div class="category">
    <span class="category_text">캐릭터</span>
    <span class="category_text">발명품</span>
    <span class="category_text">영화</span>
</div>

<!-- 본문: 캐릭터 목록 섹션 -->
<div class="sec01_chara">
    <!-- 헤더 영역 (타이틀 + select 등) -->
    <div class="sec01_head">
        <div class="sec01_head_text">캐릭터 도감</div>
        <div class="sec01_select_wrapper">
            <select name="sortOption">
                <option value="">정렬 선택</option>
                <option value="nameAsc">이름 오름차순</option>
                <option value="nameDesc">이름 내림차순</option>
            </select>
            <div class="sec01_select_wrapper_R">정렬</div>
        </div>
    </div>

    <!-- 선택된 그룹이나 세력 표시용 라벨 (예시) -->
    <div class="chara_union_label">
        일반인 / 탐정 / 검은조직 ...
    </div>

    <!-- 캐릭터 목록 전체 wrapper -->
    <div class="chara_list_wrapper">
        <!-- 한 줄에 여러 캐릭터를 배치할 수 있음. -->
        <div class="chara_list_01">
            <%
                // DAO에서 request.setAttribute("characters", charList)로 세팅된 리스트 꺼내기
                List<CharacterDTO> characters = (List<CharacterDTO>) request.getAttribute("characters");
                if (characters == null || characters.isEmpty()) {
            %>
            <p>캐릭터 정보가 없습니다.</p>
            <%
            } else {
                // 간단히 4개씩 끊어서 보여주는 예시
                int count = 0;
                for (CharacterDTO c : characters) {
            %>
            <div class="chara_list_box_set">
                <!-- 캐릭터 아이콘 영역 -->
                <div class="chara_list_box_icon">
                    <!-- DB에 저장된 button_image (원형 아이콘용) -->
                    <img class="chara_list_box_icon_img"
                         src="<%= c.getButtonImage() %>"
                         alt="버튼이미지" />
                </div>
                <!-- 이름 or 간단 텍스트 -->
                <div style="text-align:center; font-weight:bold; margin-top:5px;">
                    <%= c.getName() %>
                </div>
            </div>
            <%
                count++;
                // 4개 단위로 줄바꿈 (새로운 .chara_list_01)
                if (count % 4 == 0) {
            %>
        </div>
        <div class="chara_list_01">
            <%
                        }
                    } // end for
                }
            %>
        </div> <!-- chara_list_01 -->
    </div> <!-- chara_list_wrapper -->
</div> <!-- sec01_chara -->

<!-- footer 영역 (원하는 경우) -->
<div class="footer">

</div>

</body>
</html>
