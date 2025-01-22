<%--
  Created by IntelliJ IDEA.
  User: kimsuhyeon
  Date: 2025. 1. 9.
  Time: 오후 3:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
<div>
<c:forEach var="b" items="${boards }">

    <a href="BoardFreeDetailC?no=${b.b_no }" >
    <div>${b.b_id }</div>
    <div>${b.b_name }</div>
    <div>${b.b_begin }</div>
    <div>${b.b_title }</div>
    <div> <fmt:formatDate value="${b.b_date }" pattern="yyyy-MM-dd HH:mm"/></div>
        <hr></a>
</c:forEach>
    <div>
        <a href="BoardFreePageC?p=1">[begin]</a>
        <c:forEach begin="1" end="${pageCount }" var="i">
            <a href="BoardFreePageC?p=${i }">[${i }]</a>
        </c:forEach>
        <a href="BoardFreePageC?p=${pageCount }">[end]</a>
    </div>
</div>
    <div>
        <input id="search-input" placeholder="이 게시판 내 검색">
        <button id="search-btn">
            search
        </button>
        <span id="result"></span>
    </div>
</div>
</body>
</html>
