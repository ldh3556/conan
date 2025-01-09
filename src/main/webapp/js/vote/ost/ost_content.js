$(document).ready(function () {
    // 첫 번째 선택지 그룹 (q1, q2, q3, q4, q5, q6, q7, q8)
    const questions = [
        { questionClass: '.q1, .q2', targetClass: '.s1', options: ['q1', 'q2'] },
        { questionClass: '.q3, .q4', targetClass: '.s2', options: ['q3', 'q4'] },
        { questionClass: '.q5, .q6', targetClass: '.s3', options: ['q5', 'q6'] },
        { questionClass: '.q7, .q8', targetClass: '.s4', options: ['q7', 'q8'] }
    ];

    // 첫 번째 선택지 처리 (q1, q2, q3, q4, q5, q6, q7, q8)
    questions.forEach(function (question) {
        $(question.questionClass).click(function () {
            var content = $(this).clone();
            $(question.targetClass).empty().append(content);
            $(question.questionClass).off('click');  // 해당 선택지를 비활성화
        });
    });

    // 두 번째 선택지 그룹 (s1 or s2, s3 or s4) -> f1, f2로 복사
    const secondQuestions = [
        { sourceClass: '.s1, .s2', targetClass: '.f1' },
        { sourceClass: '.s3, .s4', targetClass: '.f2' }
    ];

    secondQuestions.forEach(function (question) {
        $(question.sourceClass).click(function () {
            var content = $(this).clone();
            $(question.targetClass).empty().append(content);
            $(question.sourceClass).off('click');  // 선택지 비활성화
        });
    });

    // f1 또는 f2 선택 후 winner에 복사하고 DB에 저장
   /* $('.f1, .f2').click(function () {
        var content = $(this).clone();
        $('.winner').empty().append(content);

        // 선택된 데이터를 서버로 전송하여 DB에 저장
        // var selectedOption = $(this).hasClass('f1') ? 'f1' : 'f2'; // 선택된 div(f1 or f2)

       /* $.ajax({
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
