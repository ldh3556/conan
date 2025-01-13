$(document).ready(function () {
    // 첫 번째 선택지 그룹 (q1, q2, q3, q4, q5, q6, q7, q8)
    const quarterFinal = [
        { quarterMatch: '.q1, .q2', quarterWin: '.s1', isSelected: false },
        { quarterMatch: '.q3, .q4', quarterWin: '.s2', isSelected: false },
        { quarterMatch: '.q5, .q6', quarterWin: '.s3', isSelected: false },
        { quarterMatch: '.q7, .q8', quarterWin: '.s4', isSelected: false }
    ];

    // 모든 s,f 선택지를 비활성화 (초기 상태)
    $('.s1, .s2, .s3, .s4, .f1, .f2').addClass('disabled');

    // 첫 번째 선택지 그룹 (q1, q2, q3, q4, q5, q6, q7, q8)
    const modal = $('#itemModal');
    const modalTitle = $('.modal-title');
    const modalDescription = $('.modal-description');
    const voteButton = $('#voteButton');
    const exitButton = $('#exitButton');
    let selectedElement; // 클릭한 항목을 저장할 변수
    const songDetails = {
        q1: {
            title: "빛이 될거야",
            description: `
            <div>
                <img src="img/vote/ost/" alt="">
                <p>코난 1기 오프닝</p>
                <audio controls>
                    <source src="audio/vote/ost/conan_op1.mp3" type="audio/mpeg">
                    Your browser does not support the audio element.
                </audio>
                <p>
                가사내용</br>
                어쩌고 저쩌고</br>
                어쩔저쩔
                </p>
            </div>
        `
        },
        q2: {
            title: "PUZZLE",
            description: `
            <div>
                <img src="img/vote/ost/" alt="">
                <p>코난 2기 오프닝</p>
                <audio controls>
                    <source src="audio/vote/ost/conan_op2.mp3" type="audio/mpeg">
                    Your browser does not support the audio element.
                </audio>
            </div>
        `
        },
        q3: {
            title: "꿈을 향해",
            description: `
            <div>
                <img src="img/vote/ost/" alt="">
                <p>코난 3기 오프닝</p>
                <audio controls>
                    <source src="audio/vote/ost/conan_op3.mp3" type="audio/mpeg">
                    Your browser does not support the audio element.
                </audio>
            </div>
        `
        },
        q4: {
            title: "Love is thrill, shock, suspense",
            description: `
            <div>
                <img src="img/vote/ost/" alt="">
                <p>코난 4기 오프닝</p>
                <audio controls>
                    <source src="audio/vote/ost/conan_op4.mp3" type="audio/mpeg">
                    Your browser does not support the audio element.
                </audio>
            </div>
        `
        },
        q5: {
            title: "바람의 라라라",
            description: `
            <div>
                <img src="img/vote/ost/" alt="">
                <p>코난 5기 오프닝</p>
                <audio controls>
                    <source src="audio/vote/ost/conan_op5.mp3" type="audio/mpeg">
                    Your browser does not support the audio element.
                </audio>
            </div>
        `
        },
        q6: {
            title: "Growing of my heart",
            description: `
            <div>
                <img src="img/vote/ost/" alt="">
                <p>코난 6기 오프닝</p>
                <audio controls>
                    <source src="audio/vote/ost/conan_op6.mp3" type="audio/mpeg">
                    Your browser does not support the audio element.
                </audio>
            </div>
        `
        },
        q7: {
            title: "Love for you",
            description: `
            <div>
                <img src="img/vote/ost/" alt="">
                <p>코난 7기 오프닝</p>
                <audio controls>
                    <source src="audio/vote/ost/conan_op7.mp3" type="audio/mpeg">
                    Your browser does not support the audio element.
                </audio>
            </div>
        `
        },
        q8: {
            title: "Hello Mr. my yesterday",
            description: `
            <div>
                <img src="img/vote/ost/" alt="">
                <p>코난 8기 오프닝</p>
                <audio controls>
                    <source src="audio/vote/ost/conan_op8.mp3" type="audio/mpeg">
                    Your browser does not support the audio element.
                </audio>
            </div>
        `
        }
    };

    // 대진표 항목 클릭 시 모달 열기
    $('.q1, .q2, .q3, .q4, .q5, .q6, .q7, .q8').click(function () {
        selectedElement = $(this); // 클릭한 항목을 저장
        const songTitle = $(this).data('title'); // data-title 속성으로 곡 제목 가져오기
        const songId = $(this).data('id'); // data-id 속성으로 곡 ID 가져오기

        // songDetails에서 해당 곡의 내용을 찾기
        const songDetail = songDetails[`q${songId}`]; // 예: "q1", "q2" 등으로 songDetails에서 찾기

        if (songDetail) {
            modalTitle.text(songDetail.title); // 제목 설정
            modalDescription.html(songDetail.description); // 상세 HTML 설정
            modal.show();
        } else {
            console.error(`Details not found for: ${songTitle}`);
        }
    });




    // 모달 닫기 버튼 클릭 시 모달 닫기
    exitButton.click(function (){
       pauseAudio();
       modal.hide();
    });
    $('.close-button').click(function(){
       pauseAudio();
       modal.hide();
    });

    function pauseAudio() {
        // 모든 오디오 요소 찾기
        $('audio').each(function () {
            this.pause(); // 오디오 멈추기
            this.currentTime = 0; // 오디오 처음으로 되돌리기
        });
    }


});
