<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>캐릭터 도감</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/encyclop/character/character.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css"/>
    <style>
        /* 모달 배경 */
        .chara_detail_wrapper {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw; /* 뷰포트의 전체 너비 */
            height: 100vh; /* 뷰포트의 전체 높이 */
            background-color: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
            display: none; /* 초기에는 숨김 */
            justify-content: center; /* 수평 가운데 정렬 */
            align-items: center; /* 수직 가운데 정렬 */
            z-index: 1000; /* 상위 레이어 */
            visibility: hidden; /* 초기에는 보이지 않음 */
            opacity: 0; /* 투명 */
            transition: opacity 0.3s ease-in-out; /* 점진적 표시 */

        }

        /* 모달 내용 */
        .modal-content {
            width: 80%;
            height: 70%;
            padding: 20px;
            border-radius: 30px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            position: relative;
            display: flex;
            background-image: url("/img/Encyclop/chara_detail_bg.png");
            background-size: cover;
        }

        #modalCharacterDescription {
            white-space: pre-line;
        }

    </style>
</head>
<body>

<div class="header">
    <button class="menu_button">
        <%-- 야 안누리 메뉴버튼에 넣을거 만들어야 된다--%>
    </button>
    <div class="conan_logo">
        <img src="${pageContext.request.contextPath}/img/index/logoimg.png">
    </div>
    <jsp:include page="${loginPage}"></jsp:include>
</div>

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
                        <option value="1" <c:if test="${currentCategory == '1'}">selected</c:if>>모리 탐정사무소</option>
                        <option value="2" <c:if test="${currentCategory == '2'}">selected</c:if>>소년 탐정단</option>
                        <option value="3" <c:if test="${currentCategory == '3'}">selected</c:if>>경시청</option>
                        <option value="4" <c:if test="${currentCategory == '4'}">selected</c:if>>CIA</option>
                        <option value="5" <c:if test="${currentCategory == '5'}">selected</c:if>>FBI</option>
                        <option value="6" <c:if test="${currentCategory == '6'}">selected</c:if>>검은조직</option>
                        <option value="7" <c:if test="${currentCategory == '7'}">selected</c:if>>지방청</option>
                    </select>
                </form>
            </div>
        </div>
        <!-- 선택된 그룹이나 세력 표시용 라벨 (예시) -->
        <div class="chara_union_label">
            <c:choose>
                <c:when test="${currentCategory != 'all'}">
                    선택된 카테고리: ${currentCategoryName}
                </c:when>
                <c:otherwise>
                    모든 캐릭터
                </c:otherwise>
            </c:choose>
        </div>

        <!-- 캐릭터 목록 전체 wrapper -->
        <div class="chara_list_wrapper">
            <!-- 한 줄에 여러 캐릭터를 배치할 수 있음. -->
            <div class="chara_list_01">
                <c:choose>
                <c:when test="${not empty characterList}">
                <c:set var="count" value="0"/>
                <c:forEach var="c" items="${characterList}">
                <div class="chara_list_box_set">
                    <!-- 캐릭터 아이콘 영역 -->

                    <div class="chara_list_box_icon">
                        <!-- DB에서 가져온 button_image 경로를 보정 -->
                        <c:set var="fixedImagePath" value="${c.buttonImage}"/>
                        <c:choose>
                            <%-- 경로에 Encyclop 폴더가 누락된 경우 처리 --%>
                            <c:when test="${not fixedImagePath.contains('Encyclop/')}">
                                <c:set var="fixedImagePath"
                                       value="${fn:replace(fixedImagePath, 'Characters/', 'Encyclop/Characters/')}"/>
                            </c:when>
                        </c:choose>

                        <!-- 메인 이미지 경로 설정 -->
                        <c:set var="fixedMainImagePath" value="${c.mainImage}"/>
                            <%--이미지 경로 맞는지 확인--%>
                        <c:choose>
                            <c:when test="${not fixedMainImagePath.contains('Encyclop/')}">
                                <c:set var="fixedMainImagePath"
                                       value="${fn:replace(fixedMainImagePath, 'Characters/', 'Encyclop/Characters/')}"/>
                            </c:when>
                        </c:choose>

                        <!-- 버튼 이미지 출력 -->
                        <img class="chara_list_box_icon_img"
                             src="${fixedImagePath}"
                             alt="${fn:escapeXml(c.name)} 버튼이미지"
                             onclick="openCharacterModal('${fn:escapeXml(c.id)}',
                                     '${fn:escapeXml(c.name)}',
                                     '${fn:escapeXml(c.age)}',
                                     '${fn:escapeXml(c.quote)}',
                                     '${fn:escapeXml(c.description)}',
                                     '${fixedMainImagePath}')">
                    </div>

                    <!-- 이름 or 간단 텍스트 -->
                    <span class="text_chara">
                            ${fn:escapeXml(c.name)}
                    </span>
                </div>
                <c:set var="count" value="${count + 1}"/>
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
    <div class="footer">
        <a>이용약관</a>
        <a>개인정보 처리방침</a>
        <a>About us</a>
    </div>
</div>


<%--모달--%>
<div id="charaDetailModal" class="chara_detail_wrapper">
    <div class="modal-content">
        <button class="close_button" onclick="closeCharacterModal()"><img src="/img/Encyclop/x.svg" alt="닫는 버튼">
        </button>
        <img id="modalCharacterImage" src="" alt="캐릭터 메인 이미지">
        <div class="modal-character">
            <div class="sec01_head_text">CHARACTER</div>
            <div id="modalCharacterName"></div>
            <div id="modalCharacterQuote">명언</div>
            <div id="modalCharacterAge" style="font-size: 23px; margin-top: 6px; font-weight: 600;">나이</div>
            <div id="modalCharacterDescription" style="margin-top: 20px; line-height: 150%; font-size: 20px;">설명</div>
            <div><img src="/img/Encyclop/detective_boys.png" alt="" style="width: 120%; margin-top: 20px;"></div>
        </div>
    </div>
</div>

<script>
    function openCharacterModal(id, name, age, quote, description, imagePath) {
        // SQL에서 이스케이프된 데이터를 복구
        const processedDescription = description
            .replace(/\\n/g, '\n') // 줄바꿈 복구
            .replace(/\\'/g, "'") // 작은따옴표 복구
            .replace(/\\"/g, '"'); // 큰따옴표 복구

        console.log("Processed Description:", processedDescription);

        // 모달 데이터 설정
        document.getElementById('modalCharacterName').textContent = name;
        document.getElementById('modalCharacterAge').textContent = age;
        document.getElementById('modalCharacterQuote').textContent = quote;
        document.getElementById('modalCharacterDescription').textContent = processedDescription;
        document.getElementById('modalCharacterImage').src = imagePath;

        // 모달 표시
        const modal = document.getElementById('charaDetailModal');
        modal.style.display = 'flex';
        modal.style.visibility = 'visible';
        modal.style.opacity = '1';
    }

    function closeCharacterModal() {
        const modal = document.getElementById('charaDetailModal');

        // 모달 숨기기
        modal.style.opacity = '0';
        setTimeout(() => {
            modal.style.display = 'none';
            modal.style.visibility = 'hidden';
        }, 300); // transition 시간과 맞춤
    }
</script>

</body>
</html>