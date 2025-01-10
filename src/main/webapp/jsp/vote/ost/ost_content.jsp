<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>Title</title>
<link rel="stylesheet" href="css/vote/ost/ost_content.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<div class="contents">
	<!-- First Round -->
	<div class="round">
		<!-- 그룹 1 (q1, q2, q3, q4) -->
		<c:forEach var="s" items="${songs}" varStatus="status">
			<c:if test="${status.index < 4}">
				<div class="match q${status.index + 1}">
					<a>${s.song_title}</a>
				</div>
			</c:if>
		</c:forEach>
	</div>

	<!-- Second Round -->
	<div class="round">
		<div class="match s1">s1</div>
		<div class="match s2">s2</div>
	</div>

	<!-- Final Round -->
	<div class="round">
		<div class="match f1">f1</div>
	</div>
	<div class="round">
		<div class="match f2">f2</div>
	</div>

	<!-- Second Round -->
	<div class="round">
		<div class="match s3">s3</div>
		<div class="match s4">s4</div>
	</div>

	<!-- First Round -->
	<div class="round">
		<!-- 그룹 2 (q5, q6, q7, q8) -->
		<c:forEach var="s" items="${songs}" varStatus="status">
			<c:if test="${status.index >= 4 && status.index <= 8}">
				<div class="match q${status.index + 1}">
					<a>${s.song_title}</a>
				</div>
			</c:if>
		</c:forEach>
	</div>
</div>
<script src="js/vote/ost/ost_content.js"></script>
</body>
</html>
