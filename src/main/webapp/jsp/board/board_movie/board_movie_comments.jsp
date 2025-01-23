<%--
  Created by IntelliJ IDEA.
  User: kimsuhyeon
  Date: 2025. 1. 16.
  Time: 오후 3:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:choose>
    <c:when test="${not empty movieComments}">
        <c:forEach var="comment" items="${movieComments}">
            <div class="comment" id="comment-${comment.c_no}">
                <strong>${comment.c_writer}</strong>
                <p>${comment.formattedDate}</p>
                <!-- 댓글 내용 -->
                <p id="content-${comment.c_no}" style="display: block;">${comment.c_content}</p>
                <textarea id="textarea-${comment.c_no}" style="display: none;" rows="4">${comment.c_content}</textarea>
                <!-- 수정 및 삭제 버튼 -->
                <button id="edit-btn-${comment.c_no}" onclick="editCommentMovie(${comment.c_no})">수정</button>
                <button id="save-btn-${comment.c_no}" onclick="saveCommentMovie(${comment.c_no})" style="display: none;">저장</button>
                <button onclick="deleteCommentMovie(${comment.c_no}, ${comment.b_no})">삭제</button>
            </div>
            <hr>
        </c:forEach>
    </c:when>
    <c:otherwise>
        <p>댓글이 없습니다. 첫 댓글을 작성해보세요!</p>
    </c:otherwise>
</c:choose>
</body>
</html>
