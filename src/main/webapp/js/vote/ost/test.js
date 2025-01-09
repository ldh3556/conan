$(document).ready(function() {
    // q1, q2, q3, q4, q5, q6, q7, q8 클릭 처리
    $('.q1, .q2, .q3, .q4, .q5, .q6, .q7, .q8, .s1, .s2, .s3, .s4').click(function() {
        var content = $(this).html();

        // 클릭된 div의 클래스에 따라 s1 ~ s4에 복사
        if ($(this).hasClass('q1') || $(this).hasClass('q2')) {
            $('.s1').html(content); // s1에 복사
            // q1, q2 모두 비활성화
            $('.q1, .q2').addClass('disabled');
        } else if ($(this).hasClass('q3') || $(this).hasClass('q4')) {
            $('.s2').html(content); // s2에 복사
            // q3, q4 모두 비활성화
            $('.q3, .q4').addClass('disabled');
        } else if ($(this).hasClass('q5') || $(this).hasClass('q6')) {
            $('.s3').html(content); // s3에 복사
            // q5, q6 모두 비활성화
            $('.q5, .q6').addClass('disabled');
        } else if ($(this).hasClass('q7') || $(this).hasClass('q8')) {
            $('.s4').html(content); // s4에 복사
            // q7, q8 모두 비활성화
            $('.q7, .q8').addClass('disabled');
        } else if ($(this).hasClass('s1') || $(this).hasClass('s2')) {
            $('.f1').html(content); // s4에 복사
            // q7, q8 모두 비활성화
            $('.s1, .s2').addClass('disabled');
        } else if ($(this).hasClass('s3') || $(this).hasClass('s4')) {
            $('.f2').html(content); // s4에 복사
            // q7, q8 모두 비활성화
            $('.s3, .s4').addClass('disabled');
        }
    });
});