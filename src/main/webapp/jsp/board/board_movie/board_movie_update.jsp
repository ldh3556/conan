<%--
  Created by IntelliJ IDEA.
  User: kimsuhyeon
  Date: 2025. 1. 10.
  Time: 오후 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="BoardMovieUpdateC?no=${board.b_no }" method="post">
<div class="board-wrap">
    <div>
        <div>
            <div>작성인 : ${board.b_name }</div>
            <div>
                말머리 선택 : <select name="begin">
                <option value="[1기]">[1기]</option>
                <option value="[2기]">[2기]</option>
                <option value="[3기]">[3기]</option>
                <option value="[4기]">[4기]</option>
            </select>
            </div>
            <div class="board-reg-col">Title</div>
            <div class="board-reg-col2">
                <input name="title" value="${board.b_title }">
                <%-- 					${review.r_title } --%>
            </div>
        </div>
        <div><input type="file" name="img" value="${board.b_img}"></div>
        <div>
            <div class="board-reg-col">Text</div>
            <div class="board-reg-col2">
                <textarea name="text" maxlength="4000">${board.b_text }</textarea>
                <br> <span id="cntSpan">0</span> / 4000
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
            <button type="button"  onclick="cancelUpdatBoard()">취소</button>
            <button type="button"  onclick="location.href='BoardMovieC'">list</button>
        </div>
    </div>
</div>
</form>
<script type="text/javascript">
    function cancelUpdatBoard() {
        const result = confirm('수정을 취소하시겠습니까?');
        if (!result) {
            return false;
        }
        alert("수정이 취소되었습니다");
        history.back();
    }

    const textarea = document.querySelector("textarea[name='text']");
    const cntSpan = document.querySelector("#cntSpan");
    cntSpan.innerText = textarea.value.length;
    textarea.addEventListener('input', () => {
        const len = textarea.value.length;
        cntSpan.innerText = len;
    });

</script>
</body>
</html>
