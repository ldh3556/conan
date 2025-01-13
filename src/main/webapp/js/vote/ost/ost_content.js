$(document).ready(function () {
    // 첫 번째 선택지 그룹 (q1, q2, q3, q4, q5, q6, q7, q8)
    const quarterFinal = [
        { quarterMatch: '.q1, .q2', quarterWin: '.s1', isSelected: false},
        { quarterMatch: '.q3, .q4', quarterWin: '.s2', isSelected: false},
        { quarterMatch: '.q5, .q6', quarterWin: '.s3', isSelected: false},
        { quarterMatch: '.q7, .q8', quarterWin: '.s4', isSelected: false}
    ];

    // 모든 s,f 선택지를 비활성화 (초기 상태)
    $('.s1, .s2, .s3, .s4, .f1, .f2').addClass('disabled');

    // 첫 번째 선택지 처리 (q1, q2, q3, q4, q5, q6, q7, q8)
    quarterFinal.forEach(function (q) {
        $(q.quarterMatch).click(function () {
            const toSemi = $(this).clone();
            toSemi.css('border', 'none');
            $(q.quarterWin).empty().append(toSemi);

            // 해당 그룹의 선택지를 비활성화
            $(q.quarterMatch).addClass('disabled');

            // 선택받지 못한 요소에만 defeated 클래스를 추가해주고 싶은데...
            $(q.quarterMatch).not($(this)).addClass('defeated');
            toSemi.removeClass('defeated');

            // 선택이 완료된 정보를 true로 바꾸고 확인
            q.isSelected = true;
            console.log(q.isSelected);
            // 연결된 s 선택지를 활성화
            if(quarterFinal.every(q => q.isSelected)){
            $('.s1, .s2, .s3, .s4').removeClass('disabled');
            }
        });
    });

    // 두 번째 선택지 그룹 (s1 or s2, s3 or s4) -> f1, f2로 복사
    const semiFinal = [
        { sourceClass: '.s1, .s2', targetClass: '.f1', isSelected: false },
        { sourceClass: '.s3, .s4', targetClass: '.f2', isSelected: false }
    ];

    semiFinal.forEach(function (s) {
        $(s.sourceClass).click(function () {
            if ($(this).hasClass('disabled')) return; // 클릭을 무시 (비활성화 상태)

            const toFinal = $(this).clone();
            toFinal.css('margin-bottom','0px');
            toFinal.css('margin-top','0px');
            $(s.targetClass).empty().append(toFinal);

            $(s.sourceClass).addClass('disabled');

            // 탈락한 선택지에 defeated 클래스 추가
            // 선택되지 않은 s 요소 안의 q 요소에 defeated 클래스를 추가
            $(s.sourceClass).not($(this)).each(function () {
                $(this).find('.match').addClass('defeated');
            });
            toFinal.find('.match').removeClass('defeated');

            s.isSelected = true;
            console.log(s.isSelected);
            if(semiFinal.every(s => s.isSelected)){
                $('.f1, .f2').removeClass('disabled');
            }
        });
    });

    // f1 또는 f2 선택 후 winner에 복사하고 DB에 저장
     $('.f1, .f2').click(function () {
         const selectedSong = $(this).find('a').text();
         const finalWinner = $(this).clone();
         $('.winner').empty().append(finalWinner);
        // 선택된 데이터를 서버로 전송하여 DB에 저장
        const selectedOption = $(this).hasClass('f1') ? 'f1' : 'f2'; // 선택된 div(f1 or f2)
        console.log(selectedOption);

            $.ajax({
                 url: '/winCountC',  // 서버에 데이터를 저장할 URL
                 method: 'POST',
                 data: { songTitle: selectedSong}
            }).done(function(response) {
                console.log("DB 업데이트 성공:", response);
            }).fail(function(error) {
                console.error("DB 업데이트 실패:", error);
            });


            });

        });
