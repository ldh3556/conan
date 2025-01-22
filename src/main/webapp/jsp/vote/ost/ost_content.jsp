<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>Title</title>
<link rel="stylesheet" href="/css/vote/ost/ost_content.css">
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
		#lyrics-container {
			max-height: 100px; /* 처음에는 내용이 접혀있도록 */
			overflow: hidden;
			transition: max-height 0.3s ease-in-out;
		}
		#toggle-description {
			display: block;
			margin-top: 10px;
			text-decoration: none;
			color: blue;
			cursor: pointer;
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

<%--이하 디버깅용 코드입니다. --%>
<%--<div>--%>
<%--	id : ${id}--%>
<%--	<hr>--%>
<%--	pw: ${pw}--%>
<%--	<hr>--%>
<%--	nickname: ${nickname}--%>
<%--</div>--%>
<div class="wrapper">
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
		<div class="match s1">준결승</div>
		<div class="match s2">준결승</div>
	</div>

	<!-- Final Round -->
	<div class="round">
		<div class="match f1">결승</div>
	</div>
	<div class="round">
		<div class="match f2">결승</div>
	</div>

	<!-- Second Round -->
	<div class="round">
		<div class="match s3">준결승</div>
		<div class="match s4">준결승</div>
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
</div>
<script src="js/vote/ost/bracket.js"></script>
</body>
</html>
