<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.util.List" %>
<%@ page import="com.conan.semi.encyclop.CharacterDTO" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>캐릭터 도감</title>
    <!-- CSS 연동 (예: /css/style.css) -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/encyclop/character/character.css" />
</head>
<body>

<!-- 상단 헤더 메뉴 -->
<div class="header">
    <!-- 메뉴 버튼 예시 -->
    <img class="menu_button" src="${pageContext.request.contextPath}/img/encyclop/menu.png" alt="menu button" />

    <!-- 중앙 로고 -->
    <img class="conan_logo" src="${pageContext.request.contextPath}/img/encyclop/conan_logo.png" alt="conan logo" />

    <!-- 우측 프로필 아이콘 -->
    <img class="profile_icon" src="${pageContext.request.contextPath}/img/encyclop/profile_icon.png" alt="profile icon" />

    <div class="header_login_wrapper">
        로그인 해주세요
        <div class="header_login_inner">
            <a href="${pageContext.request.contextPath}/LoginC">로그인</a>
            <a href="${pageContext.request.contextPath}/AccountC">회원가입</a>
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
    <!-- 헤더 영역 (타이틀 + 필터링 및 정렬 폼) -->
    <div class="sec01_head">
        <div class="sec01_head_text">CHARACTER</div>
        <div class="sec01_select_wrapper">
            <!-- 필터링 및 정렬 폼 -->
            <form action="${pageContext.request.contextPath}/CharacterListC" method="get" style="display: flex; width: 100%;">
                <!-- 카테고리 선택 -->
                <select name="category" id="category" style="flex: 2;">
                    <option value="all" <c:if test="${currentCategory == 'all'}">selected</c:if>>전체</option>
                    <c:forEach var="cat" items="${categories}">
                        <option value="${cat}" <c:if test="${cat == currentCategory}">selected</c:if>>${cat}</option>
                    </c:forEach>
                </select>

                <!-- 정렬 옵션 선택 -->
                <select name="sortOption" id="sortOption" style="flex: 1; margin-left: 10px;">
                    <option value="" <c:if test="${empty currentSortOption}">selected</c:if>>정렬 선택</option>
                    <option value="nameAsc" <c:if test="${currentSortOption == 'nameAsc'}">selected</c:if>>이름 오름차순</option>
                    <option value="nameDesc" <c:if test="${currentSortOption == 'nameDesc'}">selected</c:if>>이름 내림차순</option>
                </select>

                <input type="submit" value="적용" style="margin-left: 10px;">
            </form>
        </div>
    </div>

    <!-- 선택된 그룹이나 세력 표시용 라벨 (예시) -->
    <div class="chara_union_label">
        <c:if test="${currentCategory != 'all'}">
            선택된 카테고리: ${currentCategory}
        </c:if>
    </div>

    <!-- 캐릭터 목록 전체 wrapper -->
    <div class="chara_list_wrapper">
        <!-- 한 줄에 여러 캐릭터를 배치할 수 있음. -->
        <div class="chara_list_01">
            <c:choose>
            <c:when test="${not empty characterList}">
            <c:set var="count" value="0" />
            <c:forEach var="c" items="${characterList}">
            <div class="chara_list_box_set">
                <!-- 캐릭터 아이콘 영역 -->
                <div class="chara_list_box_icon">
                    <!-- DB에 저장된 button_image (원형 아이콘용) -->
                    <img class="chara_list_box_icon_img"
                         src="${c.buttonImage}"
                         alt="${c.name} 버튼이미지" />
                </div>
                <!-- 이름 or 간단 텍스트 -->
                <div style="text-align:center; font-weight:bold; margin-top:5px;">
                        ${c.name}
                </div>
                <!-- 캐릭터가 속한 카테고리 목록 -->
                <div style="text-align:center; font-size:0.9em; color:#555;">
                    <c:forEach var="cat" items="${c.categories}" varStatus="status">
                        ${cat}<c:if test="${!status.last}">, </c:if>
                    </c:forEach>
                </div>
            </div>
            <c:set var="count" value="${count + 1}" />
            <!-- 4개 단위로 줄바꿈 -->
            <c:if test="${count % 4 == 0}">
        </div>
        <div class="chara_list_01">
            </c:if>
            </c:forEach>
            </c:when>
            <c:otherwise>
                <p>캐릭터 정보가 없습니다.</p>
            </c:otherwise>
            </c:choose>
        </div> <!-- chara_list_01 -->
    </div> <!-- chara_list_wrapper -->
</div> <!-- sec01_chara -->

<!-- footer 영역 (원하는 경우) -->
<div class="footer">

</div>

</body>
</html>
