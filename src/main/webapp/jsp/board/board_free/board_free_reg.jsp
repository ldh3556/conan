<%--
  Created by IntelliJ IDEA.
  User: kimsuhyeon
  Date: 2025. 1. 10.
  Time: 오후 3:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<script type="text/javascript" src="js/vote/board/board.js"></script>
<head>
    <title>Title</title>
</head>
<body>
<form action="BoardFreeRegC" method="post">
    <div>
        id <input name="id">
    </div>
    <div>
        name <input name="name">
    </div>
    <div>
        말머리 선택 : <select>
            <option value="fanpic">[나만의 팬픽 만들기]</option>
            <option value="event">[이벤트 후기]</option>
            <option value="goods">[굿즈 리뷰]</option>
            <option value="suggest">[건의하기]</option>

        </select>
    </div>
    <div>
        title <input name="title">
    </div>
    <div>
        text
        <textarea name="text" maxlength="1000"></textarea>
        <br> <span id="cntSpan">0</span> / 1000
    </div>
    <div>
        <button onclick="regBoard()">등록</button>
    </div><div>
        <button onclick="cancelregBoard()">취소</button>
    </div>
</form>
<script type="text/javascript">

    const textarea = document.querySelector("textarea[name='text']");
    const cntSpan = document.querySelector("#cntSpan");
    textarea.addEventListener('input', ()=>{
        const len = textarea.value.length;
        cntSpan.innerText = len;
    });

    function regBoard(){
        confirm("이대로 등록 하시겠습니까?")
        alert("등록되었습니다")
    }
    function cancelregBoard(){
        confirm("등록을 취소 하시겠습니까?")
        alert("최소되었습니다")
    }
</script>
</body>
</html>
