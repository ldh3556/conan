$(document).ready(function() {
    // q1, q2, q3, q4, q5, q6, q7, q8 클릭 처리
    $('.q1, .q2, .q3, .q4, .q5, .q6, .q7, .q8, .s1, .s2, .s3, .s4').click(function() {
        var content = $(this).html();
        var group; // 클릭된 div의 그룹을 저장할 변수

        // 클릭된 div의 클래스에 따라 그룹 선택
        if ($(this).hasClass('q1') || $(this).hasClass('q2')) {
            group = $('.q1, .q2');
            $('.s1').html(content); // s1에 복사
        } else if ($(this).hasClass('q3') || $(this).hasClass('q4')) {
            group = $('.q3, .q4');
            $('.s2').html(content); // s2에 복사
        } else if ($(this).hasClass('q5') || $(this).hasClass('q6')) {
            group = $('.q5, .q6');
            $('.s3').html(content); // s3에 복사
        } else if ($(this).hasClass('q7') || $(this).hasClass('q8')) {
            group = $('.q7, .q8');
            $('.s4').html(content); // s4에 복사
        } else if ($(this).hasClass('s1') || $(this).hasClass('s2')) {
            group = $('.s1, .s2');
            $('.f1').html(content); // f1에 복사
        } else if ($(this).hasClass('s3') || $(this).hasClass('s4')) {
            group = $('.s3, .s4');
            $('.f2').html(content); // f2에 복사
        }

        // 그룹 내 처리
        if (group) {
            group.addClass('disabled'); // 그룹 전체에 'disabled' 클래스 추가
            group.not(this).addClass('defeated'); // 선택되지 않은 요소에 'not-selected' 클래스 추가
        }
    });
});