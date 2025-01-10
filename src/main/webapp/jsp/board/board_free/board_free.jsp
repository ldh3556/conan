<%--
  Created by IntelliJ IDEA.
  User: kimsuhyeon
  Date: 2025. 1. 9.
  Time: 오후 3:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/BoardFreeDetailC" >
<c:forEach var="b" items="${boards }">
    <div>${b.b_no }</div>
    <div>${b.b_id }</div>
    <div>${b.b_name }</div>
    <div>${b.b_title }</div>
    <div>${b.b_date }</div>
</c:forEach></a>
</body>
</html>
