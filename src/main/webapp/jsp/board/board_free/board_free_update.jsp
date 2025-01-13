<%--
  Created by IntelliJ IDEA.
  User: kimsuhyeon
  Date: 2025. 1. 10.
  Time: 오후 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="BoardFreeUpdateC?no=${board.b_no }" method="post">
<div class="board-wrap">
    <div>
        <div>
            <div>작성인 : ${board.b_name }</div>
            <div>
                말머리 선택 : <select name="begin">
                <option value="[나만의 팬픽 만들기]">[나만의 팬픽 만들기]</option>
                <option value="[이벤트 후기]">[이벤트 후기]</option>
                <option value="[굿즈 리뷰]">[굿즈 리뷰]</option>
                <option value="[건의하기]">[건의하기]</option>
            </select>
            </div>
            <div class="board-reg-col">Title</div>
            <div class="board-reg-col2">
                <input name="title" value="${board.b_title }">
                <%-- 					${review.r_title } --%>
            </div>
        </div>
        <div>
            <div class="board-reg-col">Text</div>
            <div class="board-reg-col2">
                <textarea name="txt" maxlength="1000">${board.b_text }</textarea>
                <%-- 					${review.r_txt } --%>
                <br> <span id="cntSpan">0</span> / 1000
            </div>
        </div>
        <div>
            <div>
                Posted at
                <fmt:formatDate value="${board.b_date }"/>
            </div>
        </div>
        <div style="position: relative; bottom: -50px;">
            <button class="board-reg-btn">수정완료</button>
            <button type="button" class="board-reg-btn" onclick="cancelUpdatBoard('${board.b_no}')">취소</button>
            <button type="button" class="board-reg-btn" onclick="location.href='BoardFreeC">list</button>
        </div>
    </div>
</div>
</form>
<script type="text/javascript">
    function cancelUpdatBoard(no) {
        if (confirm('수정을 취소하시겠습니까?')) {
            location.href = "jsp/board/board_free/board_free_detail.jsp"
        }
    }

    const textarea = document.querySelector("textarea[name='text']");
    const cntSpan = document.querySelector("#cntSpan");
    textarea.addEventListener('input', () => {
        const len = textarea.value.length;
        cntSpan.innerText = len;
    });

</script>
</body>
</html>
