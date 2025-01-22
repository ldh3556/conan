<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title></title>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <style>
        #commentText{
            resize: none;
        }
    </style>
</head>
<body>
<div style="border: 1px solid #ccc; padding: 10px;">

    <!-- 버튼 영역 -->
    <div style="margin-bottom: 10px;">
        <button onclick="location.href='/ost_rankingC'">통계보기</button>
        <button type="button" onclick="location.href='/ost_contentC2'">다시하기</button>
<%--        <button type="button" onclick="location.href='/action3'">다른게임</button>--%>
    </div>

    <hr>
    <span hidden="hidden" id="selectedFSongPK">${selectedFSongPK}</span>
    <!-- 댓글 입력 폼 -->
    <div style="margin-bottom: 20px;">

            <textarea name="comment" id="commentText" rows="4" cols="50" placeholder="댓글을 입력하세요" required></textarea><br>
            <button type="button" id="submitComment">댓글 작성</button>
    </div>

    <hr>

    <div>
<%--        <c:choose>--%>
<%--            <c:when test="${empty commentList}">--%>
<%--                <p>아직 댓글이 없습니다. 첫 댓글을 작성해보세요!</p>--%>
<%--            </c:when>--%>
<%--            <c:otherwise>--%>
<%--                <c:forEach var="comment" items="${commentList}">--%>
<%--                    <div style="margin-bottom: 10px;">--%>
<%--                        <p><strong>${comment.userName}:</strong> ${comment.content}</p>--%>
<%--                        <p style="font-size: small; color: gray;">작성일: ${comment.date}</p>--%>
<%--                    </div>--%>
<%--                    <hr>--%>
<%--                </c:forEach>--%>
<%--            </c:otherwise>--%>
<%--        </c:choose>--%>
        <div id="reply">


        </div>
    </div>

    <!-- 페이징 영역 -->
<%--    <div style="text-align: center; margin-top: 20px;">--%>
<%--        <c:if test="${totalPages > 1}">--%>
<%--            <!-- 이전 버튼 -->--%>
<%--            <c:if test="${currentPage > 1}">--%>
<%--                <a href="?page=${currentPage - 1}">이전</a>--%>
<%--            </c:if>--%>
<%--            <!-- 페이지 번호 -->--%>
<%--            <c:forEach var="pageNum" begin="1" end="${totalPages}">--%>
<%--                <a href="?page=${pageNum}"--%>
<%--                   style="<c:if test='${pageNum == currentPage}'>font-weight: bold; color: red;</c:if>">--%>
<%--                        ${pageNum}--%>
<%--                </a>--%>
<%--            </c:forEach>--%>
<%--            <!-- 다음 버튼 -->--%>
<%--            <c:if test="${currentPage < totalPages}">--%>
<%--                <a href="?page=${currentPage + 1}">다음</a>--%>
<%--            </c:if>--%>
<%--        </c:if>--%>
<%--    </div>--%>

</div>
<%--<script src="/js/vote/ost/ost_comment.js"></script>--%>
<script src="/js/vote/ost/reply.js"></script>
</body>
</html>