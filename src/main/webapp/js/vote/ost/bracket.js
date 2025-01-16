$(document).ready(function () {
    // 첫 번째 선택지 그룹 (q1, q2, q3, q4, q5, q6, q7, q8)
    const quarterFinalArray = [
        { quarterMatch: ['.q1', '.q2'], quarterWin: '.s1', isSelected: false },
        { quarterMatch: ['.q3', '.q4'], quarterWin: '.s2', isSelected: false },
        { quarterMatch: ['.q5', '.q6'], quarterWin: '.s3', isSelected: false },
        { quarterMatch: ['.q7', '.q8'], quarterWin: '.s4', isSelected: false }
    ];

    const semiFinalArray = [
        { semiMatch: ['.s1', '.s2'], semiWin: '.f1', isSelected: false },
        { semiMatch: ['.s3', '.s4'], semiWin: '.f2', isSelected: false }
    ];

    const finalArray = [
        { finalMatch: ['.f1, .f2'], finalWin: 'winner'}
    ]
    // 모든 s,f 선택지를 비활성화 (초기 상태)
    $('.s1, .s2, .s3, .s4, .f1, .f2').addClass('noneclick');

    const modal = $('#itemModal');
    const modalTitle = $('.modal-title');
    const modalDescription = $('.modal-description');
    const exitButton = $('#exitButton');
    const voteButton = $('#voteButton');
    let isVoteButtonClassAdded;         // 대회 시작 시 투표하기 버튼에 클래스 추가하는 것을 제어하기 위해

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

//  ------------------   기본세팅 --------------------
    isVoteButtonClassAdded = false; // 플래그 변수 초기화
    $('.q1, .q2, .q3, .q4, .q5, .q6, .q7, .q8').click(function (){
        if (!isVoteButtonClassAdded){
            voteButton.addClass('quarterVoteButton');
            isVoteButtonClassAdded = true;              // voteButton에 최초 1회 클래스 추가
        }
        let selectedQElment = $(this);
        let selectedQSongTitle = $(this).data('title'); // DB에 저장된 노래의 song_title로 노래 제목 찾기
        let selectedQSongPK = $(this).data('pk');       // DB에 저장된 노래의 song_id로 노래 정보 찾기(시퀀스)
        let selectedQDivNum = $(this).data('divnum');   // html에 그려지는 q1~q8의 div 숫자 (1~8)
        //console.log(selectedQSongTitle);
        //console.log(selectedQSongPK);
        //console.log(selectedQDivNum);
        //console.log($(this).data());
        // songDetails에서 해당 곡의 내용을 찾기
        const songDetail = songDetails[`q${selectedQSongPK}`]; // 예: "q1", "q2" 등으로 songDetails에서 찾기
        if (songDetail) {
            modalTitle.text(songDetail.title); // 제목 설정
            modalDescription.html(songDetail.description); // 상세 HTML 설정
            modal.show();
        }else {
            console.error(`Details not found for: ${selectedQSongTitle}`);
        }
    // 8강 투표 버튼 클릭 처리    
    $(document).off('click','#voteButton.quarterVoteButton')
        .on('click','#voteButton.quarterVoteButton', function (){
        // 클릭된 q 요소 복제
        let quarterDivClone = selectedQElment.clone();    // 처음 8강에서 선택하여 복제된 q1~q8 div
        let qNum = ".q" + selectedQDivNum;              //  클릭한 div의 ui상의 번호의 앞에 .q를 붙인것
        //console.log(qNum);
        // 배열 순회
        quarterFinalArray.forEach((q) => {
            let quarterMatches = q.quarterMatch;
            //console.log('q.quarterMatch의 정체?' + q.quarterMatch);      // .q1, .q2  ,  .q3, .q4  , 등등
            // quarterMatch 배열의 객체들 중에 .q1~.q8(유저선택)이 있다면 true
            if (quarterMatches.includes(qNum)){
                // 복제된 요소 스타일 지정
                quarterDivClone.css('border','none');
                let quarterWinCounter = $(q.quarterWin);
                if (quarterWinCounter.length > 0) {
                    quarterWinCounter.empty().append(quarterDivClone);
                }   // 4강 div에 넣기
                quarterMatches.forEach((quarterMatch) => {
                    $(quarterMatch).addClass('noneclick');  // 선택한 8강 분기의 노래들 둘 다 비활성화
                    if (quarterMatch === qNum){
                        selectedQElment.addClass('win');    // 승리한 8강 요소는 색상 처리
                    }else if (quarterMatch !== qNum){
                        $(quarterMatch).addClass('defeated');   // 패배한 8강 요소는 패배 처리
                    }
                }); // 사후 처리
                q.isSelected = true;
            }   // 클론을 4강 div에 넣고, 사후 처리
        });     // 8강 배열 순회 범위(forEach)
            modal.hide();
            if (quarterFinalArray.every(q => q.isSelected)){
                $('.s1, .s2, .s3, .s4').removeClass('noneclick');
                $('#voteButton').removeClass('quarterVoteButton');
            }
    });         // 8강 투표 버튼 범위

    });     // q1~q8 클릭 범위
    isVoteButtonClassAdded = false;
    $('.s1, .s2, .s3, .s4').click(function (){
        if(!isVoteButtonClassAdded){
            $('#voteButton').addClass('semiVoteButton');
            isVoteButtonClassAdded = true;
        }

    });     // s1~s4 클릭 범위
    
// 모달 닫기 버튼 클릭 시 모달 닫기
    exitButton.click(function() {
        pauseAudio();
        modal.hide();
    });     // exitButton 범위

    $('.close-button').click(function() {
        pauseAudio();
        modal.hide();
    });     // close-button 범위

    function pauseAudio() {
        // 모든 오디오 요소 찾기
        $('audio').each(function () {
            this.pause(); // 오디오 멈추기
            this.currentTime = 0; // 오디오 처음으로 되돌리기
        });
    }       // pauseAudio 범위

});     // ready 범위