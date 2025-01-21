$(document).ready(function() {
    $('#submitComment').click(function() {
        var commentText = $('#commentText').val();  // 사용자가 입력한 댓글 내용

        if (commentText.trim() === "") {
            alert("댓글을 입력하세요.");
            return;
        }

        $.ajax({
            url: '/regCommentC',  // 댓글을 처리할 서블릿 URL
            type: 'POST',
            data: {
                comment: commentText  // 댓글 내용
            },
            success: function(response) {
                // 서버가 댓글을 성공적으로 처리했을 때
                alert('댓글이 성공적으로 등록되었습니다.');

                // 댓글 목록을 갱신하거나, 댓글 입력창 초기화 등 추가 작업
                $('#commentText').val('');  // 댓글 입력창 초기화
                // 여기서 댓글 목록을 다시 받아서 갱신하거나, 새 댓글을 화면에 바로 추가할 수도 있습니다.

                // 예시: 새 댓글을 화면에 추가
                $('#commentsList').prepend('<div>' + commentText + '</div>');
            },
            error: function(xhr, status, error) {
                // 에러가 발생한 경우
                alert('댓글 등록에 실패했습니다. 다시 시도해 주세요.');
            }
        });
    });
});
