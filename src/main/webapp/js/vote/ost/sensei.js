$(document).ready(function () {
    // 첫 번째 선택지 그룹 (q1, q2, q3, q4, q5, q6, q7, q8)
    const quarterFinal = [
        { quarterMatch: ['.q1', '.q2'], quarterWin: '.s1', isSelected: false },
        { quarterMatch: ['.q3', '.q4'], quarterWin: '.s2', isSelected: false },
        { quarterMatch: ['.q5', '.q6'], quarterWin: '.s3', isSelected: false },
        { quarterMatch: ['.q7', '.q8'], quarterWin: '.s4', isSelected: false }
    ];

    const semiFinal = [
        { semiMatch: ['.s1', '.s2'], semiWin: '.f1', isSelected: false },
        { semiMatch: ['.s3', '.s4'], semiWin: '.f2', isSelected: false }
    ];

    const final = [
        { finalMatch: ['.f1, .f2'], finalWin: 'winner'}
    ]
    // 모든 s,f 선택지를 비활성화 (초기 상태)
    $('.s1, .s2, .s3, .s4, .f1, .f2').addClass('disabled');

    // 첫 번째 선택지 그룹 (q1, q2, q3, q4, q5, q6, q7, q8)
    const modal = $('#itemModal');
    const modalTitle = $('.modal-title');
    const modalDescription = $('.modal-description');
    const voteButton = $('#voteButton');
    const exitButton = $('#exitButton');

    let selectedElement; // 클릭한 항목을 저장할 변수

    let toSemi;
    let toFinal;
    let winner;

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
        $('#voteButton').addClass('qVoteButton');
        selectedElement = $(this); // 클릭한 항목을 저장
        const songTitle = $(this).data('title'); // data-title 속성으로 곡 제목 가져오기
        const songId = $(this).data('id'); // data-id 속성으로 곡 ID 가져오기
        const divNum = $(this).data('num');

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
    $(document).on('click', '#voteButton.qVoteButton',function () {
        let id = selectedElement.attr('class').match(/q\d/)[0];
        const title = selectedElement.data('title');
        toSemi = selectedElement.clone();
        id = "." + id;


        // 배열 순회
        quarterFinal.forEach((q ) => {
            const matches = q.quarterMatch;  // 이미 ['.q1', '.q2'] 형태로 되어 있다고 가정

            // 선택된 항목이 해당 그룹에 속하는지 체크
            if (matches.includes(id)) {
                // 복제된 요소 스타일 설정
                toSemi.css('border', 'none');
                // 승자 컨테이너를 동적으로 결정
                const winContainer = $(q.quarterWin);
                if (winContainer.length > 0) {
                    winContainer.empty().append(toSemi);
                }
                // 해당 그룹의 모든 항목에 disabled 추가, 선택되지 않은 항목은 defeated 추가
                matches.forEach((match) => {
                    // console.log(`매치 순회: ${match}`);
                    $(match).addClass('disabled'); // 모든 항목에 disabled 추가
                    if (match !== `${id}`) {
                        $(match).addClass('defeated'); // 선택되지 않은 항목에 defeated 추가
                    }
                });
                // 선택된 요소는 defeated 클래스 제거 (이미 승리한 상태)
                toSemi.removeClass('defeated');

                // 해당 객체의 isSelected 값을 true로 변경
                q.isSelected = true;
            }
        });

        // 모든 객체가 선택되었을 때 s1, s2, s3, s4를 활성화
        if (quarterFinal.every(q => q.isSelected)) {
            $('.s1, .s2, .s3, .s4').removeClass('disabled');
            $('#voteButton').removeClass('qVoteButton');
        }

        // 배경 색상 변경
        $(selectedElement).css('background-color', 'E8F9FF');
        $("#exitButton").click();
    });

    let selectedSemi2;
    let selectedSemiDiv;
    let aaa;
    // 쌤이 해주신거는 selectedSemi2인데 내가 aaa로 바꿔봄
    $('.s1, .s2, .s3, .s4').click(function (e) {
        aaa = $(this).attr('class').match(/s\d/)[0];
        console.log('aaa : ' + aaa);
        $('#voteButton').addClass('sVoteButton');
        // 클릭된 부모 요소 (s1, s2, s3, s4)
        const index = $(this).attr('class').charAt($(this).attr('class').length - 1);  // 클래스에서 마지막 숫자 추출
        selectedSemi2 =  e.target.getAttribute("class").match(/s\d/)[0];
        selectedSemiDiv = $(this).clone();
        selectedSemi2 = "." + selectedSemi2;
        console.log('--------')
        aaa = '.' + aaa;
        console.log(aaa)
        // quarterFinal 배열을 사용해 클릭된 요소에 맞는 q 요소 찾아 처리
        const selectedMatch = quarterFinal[index - 1];  // 배열의 인덱스는 0부터 시작하므로 1을 빼줍니다.

        // 해당하는 q1~q8 클래스 요소 동적으로 선택
        const selectedSemi = $(this).find(selectedMatch.quarterMatch.join(', '));  // q1~q8을 한 번에 선택

        // console.log(selectedElement);  // 선택된 요소 확인

        const songTitle = selectedElement.data('title');  // data-title 속성으로 곡 제목 가져오기
        const songId = selectedElement.data('id');  // data-id 속성으로 곡 ID 가져오기

        const songDetail = songDetails[`q${songId}`];  // songDetails에서 해당 곡의 내용을 찾기
        // console.log(songTitle);
        // console.log(songId);
        // console.log(songDetail);
        if (songDetail) {
            modalTitle.text(songDetail.title); // 제목 설정
            modalDescription.html(songDetail.description); // 상세 HTML 설정
            modal.show();
        } else {
            console.error(`Details not found for: ${songTitle}`);
        }



        $(document).on('click', '#voteButton.sVoteButton',function () {
            // let id = selectedElement.attr('class').match(/q\d/)[0];
            // console.log(id);
            let title = selectedElement.data('title');
            console.log(title);
            toFinal = selectedSemiDiv.clone();
            console.log(toFinal);
            console.log(songId);
            // id = '.' + id;
            // console.log(id);

            semiFinal.forEach((s)=>{
                const matches = s.semiMatch;

                console.log(matches);

                if(matches.includes(aaa)){
                    console.log(`매치가 일치: ${matches} -> 선택된 항목: ${aaa}`);
                    toFinal.css('border','none');
                    toFinal.removeClass(function (index, className) {
                        const match = className.match(/\bs\d+/); // "s"로 시작하는 클래스 하나를 찾음
                        return match ? match[0] : '';           // 찾은 클래스 이름을 반환하여 제거
                    });
                    const winContainer = $(s.semiWin);
                    if (winContainer.length > 0){
                        winContainer.empty().append(toFinal);
                        console.log(`복제된 요소가 ${s.semiWin}에 추가되었습니다`);
                    }
                    matches.forEach((match) => {
                        $(match).addClass('disabled');
                        if (match !== `${aaa}`){
                            $(match).addClass('defeated');
                        }
                    });
                    toFinal.removeClass('defeated');
                    s.isSelected = true;
                }
                if (semiFinal.every(s => s.isSelected)){
                    $('.f1, .f2').removeClass('disabled');
                    $('#voteButton').removeClass('sVoteButton');
                }
                $(selectedElement).css('background-color','E8F9FF');
                $('#exitButton').click();
            });

        });



    });







    // 모달 닫기 버튼 클릭 시 모달 닫기
    exitButton.click(function() {
        pauseAudio();
        modal.hide();
    });

    $('.close-button').click(function() {
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