$(function (){
    searchBoardFree();
});

function searchBoardFree(){
    $("#search-btn").click(function (){
        const boardTitle = $("#search-input").val();
        console.log(boardTitle);

        $.ajax({
            url: 'BoardFreeSearchC',
            data: {boardTitle}
        }).done(function (resData){
            $("#result").empty();

            console.log(resData);
            console.log(resData.length);
            console.log(JSON.stringify(resData));
if (resData.length != 0){
    showResult(resData);
}

            })
            .fail(function (xhr){
                console.log(xhr);
            });
    })

    function showResult(resData){
        $.each(resData, function (i, b){
            console.log(i);
            console.log(b);

            let content = ` <div>[게시번호 : ${b.b_no }]</div>
    <a href="BoardFreeDetailC?no=${b.b_no }" >
    <div>${b.b_id }</div>
    <div>${b.b_name }</div>
    <div>${b.b_begin }</div>
    <div>${b.b_title }</div>
    <div>${b.b_date }</div></a>`;

            $("#result").append(content);

        })
    }

}