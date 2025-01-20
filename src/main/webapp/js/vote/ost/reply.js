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
                      <p><strong>${comment.ost_login_nickname_fk}:</strong> ${comment.comment_text}</p>
                      <p style="font-size: small; color: gray;">작성일: ${comment.comment_date}</p>
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

            updateReply();
         }

      }
   })
   });
}