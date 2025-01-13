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

<div class="board-wrap">
    <div>
        <div>
            <div class="board-reg-col">Title</div>
            <div>작성인 : ${board.b_name }</div>
            <div class="board-reg-col2">
                <input name="title" value="${board.b_title }" disabled="disabled">
                <%-- 					${review.r_title } --%>
            </div>
        </div>
        <div>
            <div class="board-reg-col">Text</div>
            <div class="board-reg-col2">
                <textarea name="txt" maxlength="1000" disabled="disabled">${board.b_text }</textarea>
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
            <button class="board-reg-btn" onclick="location.href='BoardFreeUpadateC?no=${board.b_no}'">update</button>
            <button class="board-reg-btn" onclick="deleteBoard('${board.b_no}')">delete</button>
            <button class="board-reg-btn">list</button>
        </div>
    </div>
</div>

<script type="text/javascript">
    function deleteBoard(no) {
        if (confirm('really?')) {
            location.href = 'BoardDelC?no=' + no;
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
