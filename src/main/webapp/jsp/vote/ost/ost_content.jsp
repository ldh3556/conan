<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>Title</title>
<link rel="stylesheet" href="css/vote/ost/ost_content.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<style>
		.bracket-lines {
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			pointer-events: none;
			z-index: 1;
		}
	</style>
</head>
<body>

<div id="itemModal" class="modal">
	<div class="modal-content">
		<span class="close-button">&times;</span>
		<h2 id="modal-title" class="modal-title"></h2>
		<div id="modal-description" class="modal-description"></div>
		<div class="modal-buttons">
			<button id="voteButton">투표하기</button>
			<button id="exitButton">나가기</button>
		</div>
	</div>
</div>


<div>
	id : ${param.id}
	<hr>
	pw: ${param.pw}
	<br>
	${result}
	<br>
	nickname: ${nickname}
</div>
	<div class="round">
		<!-- 그룹 1 (q1, q2, q3, q4) -->
		<c:forEach var="s" items="${songs}" varStatus="status">
			<c:if test="${status.index < 4}">
				<div class="match q${status.index + 1}" data-title="${s.song_title}" data-pk="${s.song_id}" data-divNum="${status.index + 1}">
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
			<c:if test="${status.index >= 4 && status.index < 8}">
				<div class="match q${status.index + 1}" data-title="${s.song_title}" data-pk="${s.song_id}" data-divnum="${status.index + 1}">
					<a>${s.song_title}</a>
				</div>
			</c:if>
		</c:forEach>
	</div>
<script src="js/vote/ost/bracket.js"></script>
</body>
</html>
