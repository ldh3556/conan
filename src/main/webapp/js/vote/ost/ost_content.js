$(document).ready(function () {
    // 첫 번째 선택지 그룹 (q1, q2, q3, q4, q5, q6, q7, q8)
    const questions = [
        { quarterMatch: '.q1, .q2', quarterWin: '.s1', isSelected: false},
        { quarterMatch: '.q3, .q4', quarterWin: '.s2', isSelected: false},
        { quarterMatch: '.q5, .q6', quarterWin: '.s3', isSelected: false},
        { quarterMatch: '.q7, .q8', quarterWin: '.s4', isSelected: false}
    ];

    // 모든 s,f 선택지를 비활성화 (초기 상태)
    $('.s1, .s2, .s3, .s4, .f1, .f2').addClass('disabled');

    // 첫 번째 선택지 처리 (q1, q2, q3, q4, q5, q6, q7, q8)
    questions.forEach(function (q) {
        $(q.quarterMatch).click(function () {
            var content = $(this).clone();
            content.css('border', 'none');
            $(q.quarterWin).empty().append(content);

            // 해당 그룹의 선택지를 비활성화
            $(q.quarterMatch).addClass('disabled');
            !$(this).addClass('defeated');

            q.isSelected = true;
            console.log(q.isSelected);
            // 연결된 s 선택지를 활성화
            if(questions.every(q => q.isSelected)){
            $('.s1, .s2, .s3, .s4').removeClass('disabled');
            }
        });
    });

    // 두 번째 선택지 그룹 (s1 or s2, s3 or s4) -> f1, f2로 복사
    const secondQuestions = [
        { sourceClass: '.s1, .s2', targetClass: '.f1' },
        { sourceClass: '.s3, .s4', targetClass: '.f2' }
    ];

    secondQuestions.forEach(function (question) {
        $(question.sourceClass).click(function () {
            if ($(this).hasClass('disabled')) return; // 클릭을 무시 (비활성화 상태)

            var content = $(this).clone();
            $(question.targetClass).empty().append(content);
            $(question.sourceClass).off('click').addClass('disabled');

        });
    });

    // f1 또는 f2 선택 후 winner에 복사하고 DB에 저장
    /* $('.f1, .f2').click(function () {
        var content = $(this).clone();
        $('.winner').empty().append(content);

        // 선택된 데이터를 서버로 전송하여 DB에 저장
        var selectedOption = $(this).hasClass('f1') ? 'f1' : 'f2'; // 선택된 div(f1 or f2)

        $.ajax({
            url: '/saveToDatabase',  // 서버에 데이터를 저장할 URL
            method: 'POST',
            data: { selectedOption: selectedOption },
            success: function(response) {
                console.log("DB 업데이트 성공:", response);
            },
            error: function(error) {
                console.error("DB 업데이트 실패:", error);
            }
        });
    }); */
});
