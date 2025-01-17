<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<h2>우승곡 정보</h2>
<p>곡 제목: ${songTitle}</p>
<p>곡 설명: ${songDescription}</p>

<button onclick="location.href='/ost_rankingC'">통계~~~</button>


<%--        <c:forEach var="r" items="${result}">--%>
<%--            <div>--%>
<%--                <div>${r.song_id}</div>--%>
<%--                <div>${r.song_title}</div>--%>
<%--                <div>${r.win_count}</div>--%>
<%--            </div>--%>
<%--        </c:forEach>--%>


</body>
</html>
