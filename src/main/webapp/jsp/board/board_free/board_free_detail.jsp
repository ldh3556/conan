<%--
  Created by IntelliJ IDEA.
  User: kimsuhyeon
  Date: 2025. 1. 10.
  Time: 오후 12:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div class="board-wrap">
    <div>
        <div>
            <div>작성인 : ${board.b_name }</div>
            <div>${board.b_begin }</div>
            <div><img style="width: 60px; height: 60px" src="jsp/board/board_free/board_free_img/${board.b_img }"></div>
            <div class="board-reg-col">Title</div>

            <div class="board-reg-col2">
                <input name="title" value="${board.b_title }" disabled="disabled">
                <%-- 					${review.r_title } --%>
            </div>
        </div>
        <div>
            <div class="board-reg-col">Text</div>
            <div class="board-reg-col2">
                <textarea name="text" maxlength="4000" disabled="disabled">${board.b_text }</textarea>
                <br> <span id="cntSpan">0</span> / 4000
            </div>
        </div>
        <div>
            <div>
                Posted at
                <fmt:formatDate value="${board.b_date }" pattern="yyyy-MM-dd HH:mm"/>
            </div>
        </div>
        <div style="position: relative; bottom: -50px;">
            <button class="board-reg-btn" onclick="location.href='BoardFreeUpdateC?no=${board.b_no}'">update</button>
            <button class="board-reg-btn" onclick="deleteBoard('${board.b_no}')">delete</button>
            <button type="button" class="board-reg-btn" onclick="location.href='BoardFreeC'">list</button>
        </div>
    </div>
    <hr>
    <br>
    <br>
    <!-- 댓글 리스트 출력 -->
    <div id="comments-section">
        <hr>
        <h4>댓글 목록</h4>
        <hr>
      <div>
          <jsp:include page="${comments}"/>
      </div>
    </div>
    </div>

    <!-- 댓글 작성 폼 -->
<div>
    <form method="get" action="FreeCommentRegC">
        <input type="hidden" name="no" value="${board.b_no}">
        <div>
            <label for="c_writer">이름:</label>
            <input type="text" id="c_writer" value="${sessionScope.user.nickname }" name="c_writer" readonly required>
        </div>
        <div>
            <label for="c_content">댓글:</label>
            <textarea id="c_content" name="c_content" rows="4" required></textarea>
        </div>
        <button type="submit">댓글 작성</button>
    </form>
</div>

<script type="text/javascript">
    function deleteBoard(no) {
        if (confirm('정말로 삭제하시겠습니까?')) {
            alert('삭제 되었습니다.')
            location.href = 'BoardFreeDelC?no=' + no;
        }
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
