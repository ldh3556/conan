$(function () {
    searchBoardFree();
});

function searchBoardFree() {
    $("#search-btn").click(function () {
        const boardTitle = $("#search-input").val();
        console.log(boardTitle);

        $.ajax({
            url: 'BoardFreeSearchC',
            data: {boardTitle}
        }).done(function (resData) {
            $("#result").empty();

            console.log(resData);
            console.log(resData.length);
            console.log(JSON.stringify(resData));
            if (resData.length != 0) {
                showResult(resData);
            }

        })
            .fail(function (xhr) {
                console.log(xhr);
            });
    })

    function showResult(resData) {
        $.each(resData, function (i, b) {
            console.log(i);
            console.log(b);

            let content = ` <div>[게시번호 : ${b.b_no}]</div>
    <a href="BoardFreeDetailC?no=${b.b_no}" >
    <div>${b.b_id}</div>
    <div>${b.b_name}</div>
    <div>${b.b_begin}</div>
    <div>${b.b_title}</div>
    <div>${b.b_date}</div></a>`;

            $("#result").append(content);

        })
    }

}

    function editComment(commentId) {
    // 기존 텍스트 숨기기
    document.getElementById(`content-${commentId}`).style.display = 'none';
    // 텍스트 영역 표시
    document.getElementById(`textarea-${commentId}`).style.display = 'block';
    // 버튼 토글
    document.getElementById(`edit-btn-${commentId}`).style.display = 'none';
    document.getElementById(`save-btn-${commentId}`).style.display = 'inline-block';
}

    function saveComment(commentId) {
    // 텍스트 영역에서 변경된 값 가져오기
    const updatedContent = document.getElementById(`textarea-${commentId}`).value;

    // AJAX 요청을 통해 서버로 수정 데이터 전송
    const xhr = new XMLHttpRequest();
    xhr.open('POST', 'FreeCommentUpdateC', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function () {
    if (xhr.readyState === 4 && xhr.status === 200) {
    // 수정된 내용을 화면에 반영
    document.getElementById(`content-${commentId}`).innerText = updatedContent;
    // 텍스트 영역 숨기기
    document.getElementById(`textarea-${commentId}`).style.display = 'none';
    // 기존 텍스트 표시
    document.getElementById(`content-${commentId}`).style.display = 'block';
    // 버튼 토글
    document.getElementById(`edit-btn-${commentId}`).style.display = 'inline-block';
    document.getElementById(`save-btn-${commentId}`).style.display = 'none';
}
};
    xhr.send(`c_no=${commentId}&c_content=${encodeURIComponent(updatedContent)}`);
}

    function deleteComment(commentId) {
    if (confirm('정말로 댓글을 삭제하시겠습니까?')) {
    location.href = `FreeCommentDeleteC?c_no=${commentId}`;
}
}
