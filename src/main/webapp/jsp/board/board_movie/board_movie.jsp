<%--
  Created by IntelliJ IDEA.
  User: kimsuhyeon
  Date: 2025. 1. 9.
  Time: 오후 3:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <div class="search_box">
        <input id="search-input" placeholder="이 게시판 내 제목 검색">
        <button id="search-btn">
            search
        </button>
        <span id="result"></span>
    </div>
    <div class="board_con">
        <c:choose>
            <c:when test="${not empty boards}">
                <c:forEach var="b" items="${boards }">
                    <a href="BoardMovieDetailC?no=${b.b_no }" class="board_box">
                        <div>${b.b_name }</div>
                        <div>${b.b_begin }</div>
                        <div>${b.b_title }</div>
                        <div><fmt:formatDate value="${b.b_date }" pattern="yyyy-MM-dd HH:mm"/></div>
                        <hr>
                    </a>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p>게시글이 없습니다. 첫 게시글을 작성해보세요!</p>
            </c:otherwise>
        </c:choose>
        <div class="pagination">
            <a href="BoardMoviePageC?p=1">BEGIN</a>
            <c:forEach begin="1" end="${pageCount }" var="i">
                <a href="BoardMoviePageC?p=${i }">${i }</a>
            </c:forEach>
            <a href="BoardMoviePageC?p=${pageCount }">END</a>
        </div>
        <div class="under_buttons">
            <div class="buttons">
                <a href="BoardNoticeRegC">글쓰기</a>
            </div>
        </div>
    </div>

</div>
</body>
</html>
