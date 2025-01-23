<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>캐릭터 도감</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/encyclop/character/character.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
</head>
<body>

<div class="header">
    <button class="menu_button">
    <%-- 야 안누리 메뉴버튼에 넣을거 만들어야 된다--%>
    </button>
    <a class="conan_logo" href="/index.jsp">
        <img src="${pageContext.request.contextPath}/img/index/logoimg.png">
    </a>
    <jsp:include page="${loginPage}"></jsp:include>
</div>

<%-- 상단 코난 이미지 있는거..
<div class="conandex_wrapper">CONAN'DEX
    <div class="conandex_inner">코난 도감</div>
    <div class="conandex_logo"><img style="width: 100%;" src="${pageContext.request.contextPath}/img/index/conandex_customicon_big.png" alt="conandex_img"></div>
</div>--%>

<%--이거 왜 안되냐 미칀--%>

<!-- 상단 Category 바 -->
<div class="chara_wrapper">
    <div class="category">
        <div class="category_text">캐릭터</div>
        <div class="category_text">발명품</div>
        <div class="category_text">영화</div>
    </div>

    <!-- 본문: 캐릭터 목록 섹션 -->
    <div class="sec01_chara">
        <!-- 헤더 영역 (타이틀 + 필터링 및 정렬 폼) -->
        <div class="sec01_head">
            <div class="sec01_head_text">CHARACTER</div>
            <div class="sec01_select_wrapper">
                <div class="sec01_select_wrapper_L">
                    세력
                    <!-- 필터링 및 정렬 폼 -->
                </div>
                <form method="get" action="CharacterListC">
                    <!-- 카테고리 선택 -->
                    <select name="category" id="category" onchange="this.form.submit()">
                        <option value="all" <c:if test="${currentCategory == 'all'}">selected</c:if>>모든 캐릭터</option>
                        <option value="1" <c:if test="${currentCategory == '모리 탐정사무소'}">selected</c:if>>모리 탐정사무소</option>
                        <option value="2" <c:if test="${currentCategory == '소년 탐정단'}">selected</c:if>>소년 탐정단</option>
                        <option value="3" <c:if test="${currentCategory == '경시청'}">selected</c:if>>경시청</option>
                        <option value="4" <c:if test="${currentCategory == 'CIA'}">selected</c:if>>CIA</option>
                        <option value="5" <c:if test="${currentCategory == 'FBI'}">selected</c:if>>FBI</option>
                        <option value="6" <c:if test="${currentCategory == '검은조직'}">selected</c:if>>검은조직</option>
                        <option value="7" <c:if test="${currentCategory == '지방청'}">selected</c:if>>지방청</option>
                    </select>

                </form>
            </div>
        </div>
        <!-- 선택된 그룹이나 세력 표시용 라벨 (예시) -->
        <div class="chara_union_label">
            <c:if test="${currentCategory != 'all'}">
                ${currentCategory}
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
                        <!-- DB에서 가져온 button_image 경로를 보정 -->
                        <c:set var="fixedImagePath" value="${c.buttonImage}" />
                        <c:choose>
                            <%-- 경로에 Encyclop 폴더가 누락된 경우 처리 --%>
                            <c:when test="${not fixedImagePath.contains('Encyclop/')}">
                                <c:set var="fixedImagePath" value="${fn:replace(fixedImagePath, 'Characters/', 'Encyclop/Characters/')}" />
                            </c:when>
                        </c:choose>
                        <img class="chara_list_box_icon_img"
                             src="${fixedImagePath}"
                             alt="${c.name} 버튼이미지" />
                    </div>

                    <!-- 이름 or 간단 텍스트 -->
                    <span class="text_chara">
                            ${c.name}
                    </span>
                    <!-- 캐릭터가 속한 카테고리 목록 -->
                    <div style="text-align:center; font-size:0.9em; color:#555;">
                        <c:forEach var="cat" items="${c.categories}" varStatus="status">
                            ${cat}<c:if test="${!status.last}">, </c:if>
                        </c:forEach>
                    </div>
                </div>
                <c:set var="count" value="${count + 1}" />
                <!-- 6개 단위로 줄바꿈 -->
                <c:if test="${count % 6 == 0}">
            </div>
            <div class="chara_list_01">
                </c:if>
                </c:forEach>
                </c:when>
                <c:otherwise>
                    <p>캐릭터 정보가 없습니다.</p>
                </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>

    <!-- footer 영역 (원하는 경우) -->
    <div class="footer">

    </div>
</div>


</body>
</html>
