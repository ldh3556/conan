<%--
  Created by IntelliJ IDEA.
  User: kimsuhyeon
  Date: 2025. 1. 10.
  Time: 오후 3:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<script type="text/javascript" src="js/vote/board/board.js"></script>
<head>
    <title>Title</title>
</head>
<body>
<form action="BoardMovieRegC" method="post" onsubmit="regBoard(e)">
    <div>
        id <input name="id">
    </div>
    <div>
        name <input name="name">
    </div>
    <div>
        말머리 선택 : <select name="begin">
            <option value="[1기]">[1기]</option>
            <option value="[2기]">[2기]</option>
            <option value="[3기]">[3기]</option>
            <option value="[4기]">[4기]</option>
        </select>
    </div>
    <div>
        title <input name="title">
    </div>
    <div>
        text
        <textarea name="text" maxlength="4000"></textarea>
        <br> <span id="cntSpan">0</span> / 4000
    </div>
    <div>
        <button>등록</button>
    </div><div>
        <button type="button" onclick="cancelregBoard()">취소</button>
    </div>
</form>
<script type="text/javascript">
        function regBoard(event) {
            const result = confirm("이대로 업로드 하시겠습니까?");
            if (!result) {
                event.preventDefault(); // 폼 제출 중단
                alert("업로드가 취소되었습니다.");
            }
        }

    function cancelregBoard(){
        if (confirm("등록을 취소 하시겠습니까?")){
            alert("취소되었습니다")
        location.href="BoardMovieC"}
    }
    const textarea = document.querySelector("textarea[name='text']");
    const cntSpan = document.querySelector("#cntSpan");
    textarea.addEventListener('input', ()=>{
        const len = textarea.value.length;
        cntSpan.innerText = len;
    });
</script>
</body>
</html>
