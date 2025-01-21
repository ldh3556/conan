$(function () {

   insertReply();
   updateReply();

});

function drawComment(resData) {
   const replyDiv = $("#reply");

   let content = "";
   console.log(content);
   $.each(resData, function (i, comment){
      content += `<div style="margin-bottom: 10px;">
  <div>
    <!-- 닉네임: 약간 굵은 볼드 -->
    <span style="font-weight: 600;">${comment.ost_login_nickname_fk}</span>
    <!-- 제목: 닉네임 옆에 볼드 제거 -->
    <span style="font-weight: normal;"> - ${comment.song_title}</span>
    <!-- 작성일: 닉네임과 제목 옆에 작은 크기와 회색 -->
    <small style="font-size: small; color: gray; margin-left: 10px;">작성일: ${comment.comment_date}</small>
  </div>
  <!-- 댓글 내용: 다음 줄에 출력 -->
  <div>${comment.comment_text}</div>
</div>`
   });
   $(replyDiv).append(content);


}


function updateReply() {
   $.ajax({
      url: "reply-api",
      success: function (resData) {
         console.log(resData)
         $("#reply").empty();
         drawComment(resData);
      }
   })
}


function insertReply() {

   $("#submitComment").click(()=>{
     const text = $("#commentText").val();
     const pk = $("#selectedFSongPK").text();
      console.log(pk);
      console.log('----------')
   $.ajax({
      url: "insert-comment",
      data: {text,pk},
      success: function (resData) {
         console.log(resData)
         if(resData){
            $('#commentText').val('');
            updateReply();
         }

      }
   })
   });
}