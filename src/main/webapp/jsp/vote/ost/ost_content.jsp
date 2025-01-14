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
		<h2 class="modal-title"></h2>
		<div class="modal-description"></div>
		<div class="modal-buttons">
			<button id="voteButton">투표하기</button>
			<button id="exitButton">나가기</button>
		</div>
	</div>
</div>

<%--<div class="contents">--%>
<%--	<div class="bracket-lines"><svg width="100%" height="100%" style="position:absolute; top:0; left:0;">--%>
<%--		<line x1="29.999996185302734" y1="62.80000114440918" x2="29.999996185302734" y2="62.80000114440918" style="stroke:#4CAF50;stroke-width:3;stroke-linecap:round"></line>--%>
<%--		<line x1="29.999996185302734" y1="62.80000114440918" x2="173.00000038146973" y2="62.80000114440918" style="stroke:#4CAF50;stroke-width:3;stroke-linecap:round"></line>--%>
<%--		<line x1="173.00000038146973" y1="62.80000114440918" x2="173.00000038146973" y2="161.20000839233398" style="stroke:#4CAF50;stroke-width:3;stroke-linecap:round"></line>--%>
<%--		<line x1="173.00000038146973" y1="161.20000839233398" x2="290.00000381469727" y2="161.20000839233398" style="stroke:#4CAF50;stroke-width:3;stroke-linecap:round"></line>--%>

<%--		<line x1="29.999996185302734" y1="259.600004196167" x2="29.999996185302734" y2="259.600004196167" style="stroke:#4CAF50;stroke-width:3;stroke-linecap:round"></line>--%>
<%--		<line x1="29.999996185302734" y1="259.600004196167" x2="173.00000038146973" y2="259.600004196167" style="stroke:#4CAF50;stroke-width:3;stroke-linecap:round"></line>--%>
<%--		<line x1="173.00000038146973" y1="259.600004196167" x2="173.00000038146973" y2="161.20000839233398" style="stroke:#4CAF50;stroke-width:3;stroke-linecap:round"></line>--%>
<%--		<line x1="173.00000038146973" y1="161.20000839233398" x2="290.00000381469727" y2="161.20000839233398" style="stroke:#4CAF50;stroke-width:3;stroke-linecap:round"></line>--%>

<%--		<line x1="29.999996185302734" y1="345.2000102996826" x2="29.999996185302734" y2="345.2000102996826" style="stroke:#4CAF50;stroke-width:3;stroke-linecap:round"></line>--%>
<%--		<line x1="29.999996185302734" y1="345.2000102996826" x2="173.00000038146973" y2="345.2000102996826" style="stroke:#4CAF50;stroke-width:3;stroke-linecap:round"></line>--%>
<%--		<line x1="173.00000038146973" y1="345.2000102996826" x2="173.00000038146973" y2="443.6000175476074" style="stroke:#4CAF50;stroke-width:3;stroke-linecap:round"></line>--%>
<%--		<line x1="173.00000038146973" y1="443.6000175476074" x2="290.00000381469727" y2="443.6000175476074" style="stroke:#4CAF50;stroke-width:3;stroke-linecap:round"></line>--%>

<%--		<line x1="29.999996185302734" y1="541.9999980926514" x2="29.999996185302734" y2="541.9999980926514" style="stroke:#4CAF50;stroke-width:3;stroke-linecap:round"></line>--%>
<%--		<line x1="29.999996185302734" y1="541.9999980926514" x2="173.00000038146973" y2="541.9999980926514" style="stroke:#4CAF50;stroke-width:3;stroke-linecap:round"></line>--%>
<%--		<line x1="173.00000038146973" y1="541.9999980926514" x2="173.00000038146973" y2="443.6000175476074" style="stroke:#4CAF50;stroke-width:3;stroke-linecap:round"></line>--%>
<%--		<line x1="173.00000038146973" y1="443.6000175476074" x2="290.00000381469727" y2="443.6000175476074" style="stroke:#4CAF50;stroke-width:3;stroke-linecap:round"></line>--%>
<%--	</svg></div>--%>
	<!-- First Round -->
	<div class="round">
		<!-- 그룹 1 (q1, q2, q3, q4) -->
		<c:forEach var="s" items="${songs}" varStatus="status">
			<c:if test="${status.index < 4}">
				<div class="match q${status.index + 1}" data-title="${s.song_title}" data-id="${s.song_id}" data-num="${status.index + 1}">
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
				<div class="match q${status.index + 1}" data-title="${s.song_title}" data-id="${s.song_id}">
					<a>${s.song_title}</a>
				</div>
			</c:if>
		</c:forEach>
	</div>
	<div class="winner" style="border: 1px solid black">asd</div>
</div>
<script src="js/vote/ost/ost_content.js"></script>
</body>
</html>
