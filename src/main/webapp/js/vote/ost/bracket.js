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
    const modalContent = $('.modal-content');
    const modalTitle = $('.modal-title');
    const modalDescription = $('.modal-description');
    const exitButton = $('#exitButton');
    const voteButton = $('#voteButton');
//  let isVoteButtonClassAdded;         // 대회 시작 시 투표하기 버튼에 클래스 추가하는 것을 제어하기 위해

    const songDetails = {
        q1: {
            title: "빛이 될거야",
            description: `
            <div>
                <img src="/img/vote/ost/conan_op1.jpg" alt="">
                <p>코난 1기 오프닝</p>
                <audio controls>
                    <source src="/audio/vote/ost/conan_op1.mp3" type="audio/mpeg">
                    Your browser does not support the audio element.
                </audio>
                <a style="text-decoration: none" href=#none id="show" onclick="if(hide.style.display=='none') {hide.style.display='';show.innerText='- 가사 접기'} 
else {hide.style.display='none';show.innerText='- 가사 보기'}">- 가사 보기</a>
<div id="hide" style="display: none">
                <p>아침에 눈을 뜨면 지난밤이 궁금해</p>
    <p>오늘은 어떤 사건이 날 부를까</p>
    <p>모두들 어렵다고 모두들 안 된다고</p>
    <p>고개를 돌리는 많은 사건들</p>
    <p>세상 사람들은 왜, 왜 나만 바라볼까</p>
    <p>난 내가 누군지 몰라 이 세상을 헤맬 뿐야</p>
    <p>그래 이 세상에 해결 못 할 것은 없어</p>
    <p>끝까지 포기 않고 풀면 되잖아</p>
    <p>나 어두운 세상에 이 험한 세상에</p>
    <p>찬란한 빛이 될 거야~</p>
    <p>세상 사람들은 왜, 왜 나만 바라볼까</p>
    <p>난 내가 누군지 몰라 이 세상을 헤맬 뿐야</p>
    <p>그래 이 세상에 해결 못 할 것은 없어</p>
    <p>세상에 한 줄기 빛이 될 거야</p>
    <p>찬란한 빛이 될 거야~ 워~</p>
    </div>
                </div>
        `
        },
        q2: {
            title: "PUZZLE",
            description: `
            <div>
                <img src="/img/vote/ost/conan_op2.jpg" alt="">
                <p>코난 2기 오프닝</p>
                <audio controls>
                    <source src="/audio/vote/ost/conan_op2.mp3" type="audio/mpeg">
                    Your browser does not support the audio element.
                </audio>
                <a style="text-decoration: none" href=#none id="show" onclick="if(hide.style.display=='none') {hide.style.display='';show.innerText='- 가사 접기'} 
else {hide.style.display='none';show.innerText='- 가사 보기'}">- 가사 보기</a>
<div id="hide" style="display: none">
                <p>
                초점 없는 네 두 눈의 사랑을 느낄 수는 없지만</br>
                너의 맘 여기 내 품에 와서 열리는 순간</br>
                아아~ 그래 난 알 수가 있어</br>
                </br>
                눈물이 흘러 하지만 널 볼 때만큼</br>
                모든 의문은 사라지는 걸 해답을 훔쳐본 것처럼</br>
                말할 수 없겠지 혼자서 울겠지</br>
                그 매듭을 풀 수 있는 건 거울 속에 비친 네 모습</br>
                </br>
                초점 없는 네 두 눈의 사랑을 느낄 수는 없지만</br>
                너의 맘 여기 내 품에 와서 열리는 순간</br>
                아아~ 그래 난 알 수가 있어</br>
                </br>
                이제 난 알 수가 있어
                </p>
            </div>
            </div>
        `
        },
        q3: {
            title: "꿈을 향해",
            description: `
            <div>
                <img src="/img/vote/ost/conan_op3.png" alt="">
                <p>코난 3기 오프닝</p>
                <audio controls>
                    <source src="/audio/vote/ost/conan_op3.mp3" type="audio/mpeg">
                    Your browser does not support the audio element.
                </audio>
                <a style="text-decoration: none" href=#none id="show" onclick="if(hide.style.display=='none') {hide.style.display='';show.innerText='- 가사 접기'} 
else {hide.style.display='none';show.innerText='- 가사 보기'}">- 가사 보기</a>
<div id="hide" style="display: none">
                <p>
                그대 갑자기 사라져 버리는 꿈들을</br>
                요즘 들어 자주 본다며</br>
                풀이 죽은 나를 보며 아무런 말 없이</br>
                주머니 속의 차가운 나의 손을 꼭 잡아주는 그대</br>
                </br>
                누구보다 더 활짝 피어나려는 꽃처럼</br>
                슬픈 빗물에 젖어도 빨간 잎은 화려하게 반짝일 수 있게</br>
                </br>
                그대와 나 약속했던 아름다운 하늘 그곳을 향해</br>
                아직은 여린 우리 서로의 힘이 되어 계속 달려가</br>
                그대와 나 밝게 빛나는 별이 되는 그날까지</br>
                그리운 나날들에 사랑은 더 커져만 가네</br>
                그리고 또 언젠가는</br>
                </br>
                그대 갑자기 사라져 버리는 꿈들을</br>
                요즘 들어 자주 본다며</br>
                풀이 죽은 나를 보며 아무런 말 없이</br>
                주머니 속의 차가운 나의 손을 꼭 잡아주는 그대</br>
                </br>
                누구보다 더 활짝 피어나려는 꽃처럼</br>
                슬픈 빗물에 젖어도 빨간 잎은 화려하게 반짝일 수 있게</br>
                </br>
                그대와 나 약속했던 아름다운 하늘 그곳을 향해</br>
                힘들다 쉬어가면 헤어나질 못할 미로에 빠지겠죠</br>
                만약 우리 가야 할 길을 잃어 버려 헤맨대도</br>
                서로를 향한 믿음 화살표라 믿으며 가요</br>
                그리고 또 언젠가는</br>
                </br>
                내일은 너무나도 눈부셔</br>
                아무것도 나 보이지 않아</br>
                그럴 때 나 가끔 가야 할 길을 잃어버려도</br>
                환한 그 빛이 만드는 나의 발끝에서 자라는</br>
                검은 그림자를 의지하며 걸어나가요 Go Way(Go Way)</br>
                </br>
                그대와 나 약속했던 아름다운 하늘 그곳을 향해</br>
                힘들다 쉬어가면 헤어나질 못할 미로에 빠지겠죠</br>
                만약 우리 가야 할 길을 잃어 버려 헤맨대도</br>
                서로를 향한 믿음 화살표라 믿으며 가요</br>
                아름다운 그곳을 향해</br>
                </br>
                (Go to the special place you promised</br>
                Go to the special place you promised)
                </p>
            </div>
            </div>
        `
        },
        q4: {
            title: "Love is thrill, shock, suspense",
            description: `
            <div>
                <img src="/img/vote/ost/conan_op4.gif" alt="">
                <p>코난 4기 오프닝</p>
                <audio controls>
                    <source src="/audio/vote/ost/conan_op4.mp3" type="audio/mpeg">
                    Your browser does not support the audio element.
                </audio>
                <a style="text-decoration: none" href=#none id="show" onclick="if(hide.style.display=='none') {hide.style.display='';show.innerText='- 가사 접기'} 
else {hide.style.display='none';show.innerText='- 가사 보기'}">- 가사 보기</a>
<div id="hide" style="display: none">
                <p>
                사랑은 Thrill, shock, suspense</br>
                그 보이지 않는 힘 의지해서</br>
                닫혔던 마음을 활짝 열고서</br>
                강하게 강하게</br>
                </br>
                내가 느낀 아픔의 감정을</br>
                너 역시 느낄 줄은 몰랐어</br>
                웃으며 곁에 있던 너니까</br>
                내가 알 수가 없었어</br>
                </br>
                무얼 아파하고</br>
                두려워서 벌벌벌 떨었는지 몰랐었어</br>
                알지도 못한 채로 얽혀만 가는</br>
                그날의 진실들이 나는 너무도 두려웠어</br>
                </br>
                This love is thrill, shock, suspense</br>
                망설임을 저 푸른 바람에 날려 버린대도</br>
                다 안을 수 없는 내 작은 가슴을 원망만 했었어</br>
                </br>
                닫혔던 마음을 활짝 열고서</br>
                미래의 불안과 모든 망설임 다 안아도</br>
                힘이 돼 주는 네가 있어서</br>
                난 달려갈 수 있어</br>
                </br>
                너무나 부드러운 사랑에</br>
                포근히 안겼던 적 있었어</br>
                잃고서야 알 수가 있었죠</br>
                얼마나 소중했는지</br>
                </br>
                지금에 와서야</br>
                당신의 마음 속 깊은 생각들이</br>
                보일 것 같아</br>
                마치 옳은 것들과 곧은 것들을</br>
                내가 알 수 있도록</br>
                항상 보여주려고 했지</br>
                </br>
                This love is thrill, shock, suspense</br>
                망설임을 저 푸른 바람에 날려 버린대도</br>
                다 안을 수 없는 내 작은 가슴을 원망만 했었어</br>
                </br>
                닫혔던 마음을 활짝 열고서</br>
                미래의 불안과 모든 망설임 다 안아도</br>
                힘이 돼 주는 네가 있어서</br>
                난 달려갈 수 있어</br>
                </br>
                Looking for</br>
                Exit to</br>
                Escape</br>
                </br>
                이미 네가 보여준 (네가 와서 보여줄 True)</br>
                내 곁에 있던 진심</br>
                </br>
                피할 수도 없지만</br>
                외면하진 않겠지만</br>
                멈출 수 없어 포기할 수 없어 난 널</br>
                </br>
                This love is Thrill, shock, suspense</br>
                모든 것을 잊으려고 난 몰래 도망쳤어</br>
                이제서야 달아나도 소용없단 걸 알아 버렸어 돌아가야 해</br>
                </br>
                뭐 이젠 미친 듯 도망 안 갈래</br>
                다시 또 난 눈물 보이며 약해질지라도</br>
                부딪쳐 나 이겨낼 거야</br>
                널 위해서 달릴 거야</br>
                </p>
            </div>
            </div>
        `
        },
        q5: {
            title: "바람의 라라라",
            description: `
            <div>
                <img src="/img/vote/ost/conan_op5.jpeg" alt="">
                <p>코난 5기 오프닝</p>
                <audio controls>
                    <source src="/audio/vote/ost/conan_op5.mp3" type="audio/mpeg">
                    Your browser does not support the audio element.
                </audio>
                <a style="text-decoration: none" href=#none id="show" onclick="if(hide.style.display=='none') {hide.style.display='';show.innerText='- 가사 접기'} 
else {hide.style.display='none';show.innerText='- 가사 보기'}">- 가사 보기</a>
<div id="hide" style="display: none">
                <p>
                바닷바람에 너의 향기를 느껴</br>
                은빛 파도에 우리 둘 녹아버릴 것만 같아서 웃죠</br>
                이대로만 시간아 멈춰다오</br>
                모든 게 다 내게는 그댈 위한 시간 같아요</br>
                잡은 손 놓지 마 함께 걸어갈 거야</br>
                </br>
                빛나는 계절에 도착한 미래에</br>
                방황하지 않고 네 눈빛을</br>
                바람의 라라라</br>
                넘쳐버릴 듯한 불안에 눈물을 감춘 어제에</br>
                그때가 다시 온다면 난 말할게</br>
                바람의 라라라라</br>
                </br>
                때론 슬픔에 방황을 하며 울 때</br>
                은빛 파도에 마음을 달래주는 것만 같아서 웃죠</br>
                너의 생각에 가슴을 채워줘</br>
                모든 게 다 내게는 그댈 위한 시간 같아요</br>
                나를 꼭 안아줘 빛으로 변할 거야</br>
                </br>
                힘에 겨워 있을 때 함께 왔던 사막에</br>
                언제까지 변하지 않을 테죠</br>
                바람의 라라라</br>
                내 손을 잡아 주는 바람아</br>
                솔직한 마음으로 다가와</br>
                소중한 사람이기에 난 믿을게</br>
                바람의 라라라라</br>
                </br>
                바라보는 미소 속에</br>
                나도 모르게 너 안고 싶은 거 알잖아</br>
                세월이 변해도 다시 태어나도</br>
                뜨거운 믿음을 싣고 너를 내 안에 담고 변치 않아</br>
                </br>
                빛나는 계절에 도착한 미래에</br>
                방황하지 않고 네 눈빛을</br>
                바람의 라라라</br>
                넘쳐버릴 듯한 불안에 눈물을 감춘 어제에</br>
                그때가 다시 온다면 난 말할게</br>
                바람의 라라라라</br>
                </br>
                소중한 우리들의 시간 ~
                </p>
            </div>
            </div>
        `
        },
        q6: {
            title: "Growing of my heart",
            description: `
            <div>
                <img src="/img/vote/ost/conan_op6.jpg" alt="">
                <p>코난 6기 오프닝</p>
                <audio controls>
                    <source src="/audio/vote/ost/conan_op6.mp3" type="audio/mpeg">
                    Your browser does not support the audio element.
                </audio>
                <a style="text-decoration: none" href=#none id="show" onclick="if(hide.style.display=='none') {hide.style.display='';show.innerText='- 가사 접기'} 
else {hide.style.display='none';show.innerText='- 가사 보기'}">- 가사 보기</a>
<div id="hide" style="display: none">
                <p>
                미래의 꿈들을 찾아 희망의 날갤 달아</br>
                오늘의 힘들었던 일은 잊어버리고</br>
                </br>
                저 멀리 보이는 나의 끝 없는 꿈을 향해</br>
                더 힘껏 날갤 펼치고 날아가는거야</br>
                </br>
                구름을 지나쳐 하늘 저 끝까지 오르면</br>
                눈부신 태양에 내 맘은 따스해지고</br>
                </br>
                이제 Get up Get up Get up Get up Baby</br>
                두려워 하지말고 여기서 시작하는거야</br>
                Growing Of My Heart</br>
                </br>
                한순간 한 번에 한 숨에</br>
                무너져 버렸던 Yesterday</br>
                희망의 이름을 부르며 다시 찾아가는 Exit</br>
                </br>
                또 다른 시련들이 찾아온대도</br>
                눈물에 목이 매어 주저앉아도</br>
                숨을 참고 멈춰서 다시 시작하면 되는거야</br>
                </br>
                바람도 나무도 꽃도 나를 향해 있잖아</br>
                지금 떠오르는 태양도 날비추는 걸</br>
                </br>
                필요 없는 걱정들은 모두 던져 버리고</br>
                그렇게 미래의 꿈들을 향해 날아가</br>
                </br>
                구름을 지나쳐 하늘 저 끝까지 오르면</br>
                눈부신 태양에 내맘은 따스해지고</br>
                </br>
                이제 Get up Get up Get up Get up Baby</br>
                두려워 하지 말고 여기서 시작 하는거야</br>
                Growing Of My Heart</br>
                </br>
                나홀로 이겨내야 했던</br>
                고독한 나만의 Everyday</br>
                보이지 않는 꿈을 찾아</br>
                헤매었었던 Everynight</br>
                </br>
                아무 것도 모르고 빛나는 별을</br>
                모든 것을 안고서 맴돌고 있는 걸</br>
                억누를 수 없었던</br>
                나의 맘이 움직이고 있어</br>
                </br>
                미래의 꿈들을 찾아 희망의 날갤 달아</br>
                오늘의 힘들었던 일은 잊어버리고</br>
                </br>
                저 멀리 보이는 나의 끝 없는 꿈을 향해</br>
                더 힘껏 날갤 펼치고 날아가는거야</br>
                </br>
                구름을 지나쳐 하늘 저 끝까지 오르면</br>
                눈부신 태양에 내 맘은 따스해지고</br>
                </br>
                이제 Get up Get up Get up Get up Baby</br>
                두려워 하지 말고 여기서 시작 하는거야</br>
                Growing Of My Heart</br>
                </br>
                새로운 빛이 눈 앞에 펼쳐지고</br>
                가슴 속에 작은 속삭임</br>
                다시 태어나는 내 안의 진실은</br>
                I Can Find Out My Life</br>
                </br>
                미래의 꿈들을 찾아 희망의 날갤 달아</br>
                오늘의 힘들었던 일은 잊어버리고</br>
                </br>
                저 멀리 보이는 나의 끝 없는 꿈을 향해</br>
                더 힘껏 날개 펼치고 날아가는거야</br>
                </br>
                구름을 지나쳐 하늘 저 끝까지 오르면</br>
                눈부신 태양에 내 맘은 따스해지고</br>
                </br>
                이제 Get up Get up Get up Get up Baby</br>
                두려워 하지 말고 여기서 시작하는거야</br>
                Growing Of My Heart
                </p>
            </div>
            </div>
        `
        },
        q7: {
            title: "Love for you",
            description: `
            <div>
                <img src="/img/vote/ost/conan_op7.jpg" alt="">
                <p>코난 7기 오프닝</p>
                <audio controls>
                    <source src="/audio/vote/ost/conan_op7.mp3" type="audio/mpeg">
                    Your browser does not support the audio element.
                </audio>
                <a style="text-decoration: none" href=#none id="show" onclick="if(hide.style.display=='none') {hide.style.display='';show.innerText='- 가사 접기'} 
else {hide.style.display='none';show.innerText='- 가사 보기'}">- 가사 보기</a>
<div id="hide" style="display: none">
                <p>
                오에오</br>
                오에오</br>
                오에오</br>
                </br>
                바람에 떠도는 내 마음은 그 어디에</br>
                이제는 익숙해진 기다림의 끝은</br>
                난 알 수 없어</br>
                헛되이 하기엔 시간이 없는걸</br>
                지금 이 느낌은 무엇을 말하는지</br>
                난 알 수 있어</br>
                </br>
                자 힘을 내자 지금의 나라면</br>
                다른 그 무얼 할 수 있을까</br>
                모든 걸 다시 한 번 생각해 봐</br>
                자신을 믿어봐</br>
                </br>
                love for you 주저하지는 마</br>
                내 자신을 끝까지 믿고서 가는 거야</br>
                정해진 각본 따윈 없는 거야</br>
                한 번만 더 힘을 내</br>
                </br>
                love for you 지금이 기회야</br>
                놓치지 마 내일을 향해서 가는 거야</br>
                가슴 가득한 나의 열정에게</br>
                솔직해질 시간이야</br>
                </br>
                Let's go it's summer time blue sky</br>
                </br>
                모든 것이 까맣게 잠들어 있는 이 밤</br>
                꿈 안에서조차도 보이는 걸 어떻게 해</br>
                하지만 밀려드는 감정의 파도 속에</br>
                I can't forget you</br>
                In my heart, you’re always with me</br>
                </br>
                셀 수 없이 많은 밤 꿈에서 널 찾아</br>
                한 번도 너의 손을 잡을 수는 없었지만</br>
                알 수 있어</br>
                그 어디 있어도 다시 만날 수 있어</br>
                널 처음 봤을 때 그 순간 느꼈던 데자뷰</br>
                </br>
                내 손을 잡아줘</br>
                우리의 정해진 운명을 바꿀 순 없다 해도</br>
                너만이 내 곁에 있어 준다면</br>
                이제는 웃어봐</br>
                </br>
                love for you</br>
                주저하지는 마 내 자신을</br>
                끝까지 믿고서 가는 거야</br>
                정해진 각본 따윈 없는 거야</br>
                한 번만 더 힘을 내</br>
                </br>
                love for you</br>
                지금이 기회야</br>
                놓치지 마</br>
                내일을 향해서 가는 거야</br>
                가슴 가득한 나의 열정에게</br>
                솔직해질 시간이야</br>
                </br>
                Let's go it's summer time blue sky
                </p>
            </div>
            </div>
        `
        },
        q8: {
            title: "Hello Mr. my yesterday",
            description: `
            <div>
                <img src="/img/vote/ost/conan_op8.jpg" alt="">
                <p>코난 8기 오프닝</p>
                <audio controls>
                    <source src="/audio/vote/ost/conan_op8.mp3" type="audio/mpeg">
                    Your browser does not support the audio element.
                </audio>
                <a style="text-decoration: none" href=#none id="show" onclick="if(hide.style.display=='none') {hide.style.display='';show.innerText='- 가사 접기'} 
else {hide.style.display='none';show.innerText='- 가사 보기'}">- 가사 보기</a>
<div id="hide" style="display: none">
                <p>
                Hello Mr. my yesterday 전해주지 않을래?</br>
                꿈이 이루어지는 그때 꼭 다시 만나자고</br>
                </br>
                미치도록 내달려도 앞이 보이지 않아</br>
                덩그러니 홀로 남겨져 길 위에 털썩</br>
                주저앉아 애써 눈물을 참으려 했어</br>
                초라한 내가 싫어서...</br>
                </br>
                정말 묻고 싶은 단 한 가지</br>
                만약 신이 내 곁에 있다면</br>
                행복의 의미를 내게 가르쳐 줘</br>
                </br>
                저마다의 길을 걸어가며</br>
                제각각의 노래를 부르며</br>
                날 부러워한 my friend</br>
                </br>
                정작 내세울 것 하나 없는 나지만</br>
                이제는 돌아갈 곳조차도 없는</br>
                내일의 이유도 찾아볼 수 없어 내게선</br>
                </br>
                Hello Mr. my yesterday 타임머신을 타고</br>
                꿈을 쫓는 어제의 내게 전해야 될 얘기</br>
                희망을 말하는 그대여 그대에게 비친</br>
                내일을 살아가는 나는 미소 짓고 있나요?</br>
                </br>
                누구나 찾고 있어 Hero와 현실</br>
                매일 마주하는 현실의 벽 앞에</br>
                누구나 엇갈리는 선택을 하고 살지</br>
                저마다의 기준으로</br>
                </br>
                에디슨이 반세기 뒤에</br>
                만약 다시 태어나게 되면</br>
                시간여행을 할 수 있을지도 모를 일이야</br>
                </br>
                희망이라 날 속여왔던</br>
                슬픔의 균형을 잃고 나서</br>
                이제 설 수도 없어</br>
                </br>
                저마다의 커져 버린 꿈 얘길</br>
                하기 바쁜 동창회조차</br>
                갈 수 없게 됐어 초라해진 나의 꿈으로</br>
                </br>
                Hello Mr. my yesterday 타임머신을 타고</br>
                미래의 나에게로 부디 내 얘길 전해줘</br>
                꿈을 놓아버린 그대여 시간이 흘러서</br>
                나였었던 그대는 진정 웃을 수 있을까?</br>
                </br>
                이 세상에 태어난 그 순간부터</br>
                줄곧 이 길을 달렸어</br>
                너와 함께 한 1분 1초 모든 흔적이</br>
                내 삶의 증거야</br>
                </br>
                Hello Mr. my yesterday...</br>
                Hello Mr. my yesterday.</br>
                </br>
                아침이 올 때마다 내가 나일 수 있도록</br>
                내 곁을 지켜준 네게 내 삶을 약속해</br>
                우리 마주 잡은 두 손을</br>
                놓지 마 날 믿어</br>
                엇갈린 채 살아온 우린 어디를 향할까?</br>
                </br>
                Hello Mr. my yesterday 타임머신을 타고</br>
                꿈을 쫓는 어제의 내게 전해야 될 얘기</br>
                내 전불 걸고 맹세할게 삶이 끝난다 해도</br>
                꿈이 이뤄질 그때 너를 맞이하러 가겠어</br>
                </br>
                내 전불 걸고서</br>
                내 전불 걸고서</br>
                Oh oh oh</br>
                </br>
                혹시나 내 목소리가 너에게 닿으면</br>
                끝까지 포기하지 않을 나니까 날 믿어</br>
                난 포기하지 않아</br>
                난 널 놓지 않아</br>
                </br>
                Hello Mr. my yesterday...</br>
                Hello Mr. my yesterday...
                </p>
            </div>
            </div>
        `
        }
    };

//  ------------------   기본세팅 --------------------
    voteButton.addClass('quarterVoteButton');
    $('.q1, .q2, .q3, .q4, .q5, .q6, .q7, .q8').click(function (){
        let selectedQDiv = $(this);
        let selectedQSongTitle = $(this).data('title'); // DB에 저장된 노래의 song_title로 노래 제목 찾기
        let selectedQSongPK = $(this).data('pk');       // DB에 저장된 노래의 song_id로 노래 정보 찾기(시퀀스)
        let selectedQDivNum = $(this).data('divnum');   // html에 그려지는 q1~q8의 div 숫자 (1~8)
        //console.log(selectedQSongTitle);
        //console.log(selectedQSongPK);
        //console.log(selectedQDivNum);
        //console.log($(this).data());
        // songDetails에서 해당 곡의 내용을 찾기
        let songDetail = songDetails[`q${selectedQSongPK}`]; // 예: "q1", "q2" 등으로 songDetails에서 찾기
        if (songDetail) {
            modalTitle.text(songDetail.title); // 제목 설정
            modalDescription.html(songDetail.description); // 상세 HTML 설정
            modal.show();
        }else {
            console.error(`Details not found for: ${selectedQSongTitle}`);
        }
        closeModalOnClickOutside(modal, modalContent);
    // 8강 투표 버튼 클릭 처리    
    $(document).off('click','#voteButton.quarterVoteButton')
        .on('click','#voteButton.quarterVoteButton', function (){
        // 클릭된 q 요소 복제
        let quarterDivClone = selectedQDiv.clone();    // 처음 8강에서 선택하여 복제된 q1~q8 div
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
                        selectedQDiv.addClass('win');    // 승리한 8강 요소는 색상 처리
                    }else if (quarterMatch !== qNum){
                        $(quarterMatch).addClass('defeated');   // 패배한 8강 요소는 패배 처리
                    }
                }); // 사후 처리
                q.isSelected = true;
            }   // 클론을 4강 div에 넣고, 사후 처리
        });     // 8강 배열 순회 범위(forEach)
            pauseAudio();
            modal.hide();
            if (quarterFinalArray.every(q => q.isSelected)){
                $('.s1, .s2, .s3, .s4').removeClass('noneclick');
                voteButton.removeClass('quarterVoteButton');
                voteButton.addClass('semiVoteButton');
            }
    });         // 8강 투표 버튼 범위

    });     // q1~q8 클릭 범위

    $('.s1, .s2, .s3, .s4').click(function (){
        let selectedSDiv = $(this);         // 선택한 s 요소 그 자체
        let QDivInSelectedSDiv = selectedSDiv.find('[class*="q"]');    // 선택한 s div 안의 q div
        let sClassName = selectedSDiv.attr('class');    // s div에 붙은 모든 class
        let selectedSDivNum = sClassName.split(' ').filter(function (cls){
            return cls !== 'match';
        })[0].charAt(1);                // 선택한 s div의 모든 클래스에서 div 번호만 추출 (1~4)
        let selectedSSongTitle = QDivInSelectedSDiv.data('title');
        let selectedSSongPK = QDivInSelectedSDiv.data('pk');
        //console.log('선택한 곡의 제목 : ' + selectedSSongTitle);
        //console.log('선택한 곡의 pk값 : ' + selectedSSongPK);
        //console.log('선택한 s div의 ui상 번호 : ' + selectedSDivNum)

        let songDetail = songDetails[`q${selectedSSongPK}`]; // 예: "q1", "q2" 등으로 songDetails에서 찾기
        if (songDetail) {
            modalTitle.text(songDetail.title); // 제목 설정
            modalDescription.html(songDetail.description); // 상세 HTML 설정
            modal.show();
        }else {
            console.error(`Details not found for: ${selectedSSongTitle}`);
        }
        closeModalOnClickOutside(modal, modalContent);
        // 여기까지가 4강 모달 띄우는 기능
        $(document).off('click','#voteButton.semiVoteButton')
            .on('click','#voteButton.semiVoteButton',function (){
               let semiDivClone = selectedSDiv.clone();     // 4강에서 복제한 s1~s4 div
               let sNum = '.s' + selectedSDivNum;
               //console.log('sNum : ' + sNum);

            // 배열 순회
            semiFinalArray.forEach((s) => {
               let semiMatches = s.semiMatch;
                //console.log('s.semiMatch의 정체? = ' + s.semiMatch);   // .s1 .s2     .s3 .s4
                if (semiMatches.includes(sNum)){
                    // 복제된 요소 스타일 설정
                    semiDivClone.css('border','none');
                    semiDivClone.css('margin-top','0px');
                    semiDivClone.css('margin-bottom','0px');
                    let semiWinCounter = $(s.semiWin);
                    if (semiWinCounter.length > 0){
                        semiWinCounter.empty().append(semiDivClone);
                    }

                semiMatches.forEach((semiMatch) => {
                   $(semiMatch).addClass('noneclick');      // 선택한 4강 분기의 노래들 둘 다 비활성화
                   if (semiMatch === sNum){
                       QDivInSelectedSDiv.addClass('win');        // 승리한 4강 요소는 색상 처리
                   }else if (semiMatch !== sNum){
                       $(semiMatch).find('[class*="q"]').addClass('defeated');   // 패배한 4강 요소는 패배 처리
                   }
                });     // 투표 이후 사후 처리
                s.isSelected = true;
                }
            });     // 4강 배열 순회 범위(forEach)
                pauseAudio();
                modal.hide();
                if (semiFinalArray.every(s => s.isSelected)){
                    $('.f1, .f2').removeClass('noneclick');
                    voteButton.removeClass('semiVoteButton');
                    voteButton.addClass('finalVoteButton');
                }
        });     // 4강 투표 버튼 범위

    });     // s1~s4 클릭 범위

    $('.f1, .f2').click(function (){
        let selectedFDiv = $(this);
        let QDivInSelectedFDiv = selectedFDiv.find('[class*="q"]');
        let fClassName = selectedFDiv.attr('class');    // f div에 붙은 모든 class
        let selectedFDivNum = fClassName.split(' ').filter(function (cls){
            return cls !== 'match';
        })[0].charAt(1);                // 선택한 s div의 모든 클래스에서 div 번호만 추출 (1~4)
        let selectedFSongTitle = QDivInSelectedFDiv.data('title');  // q에 담긴 노래 제목
        let selectedFSongPK = QDivInSelectedFDiv.data('pk');        // q에 담긴 노래 pk값

        let songDetail = songDetails[`q${selectedFSongPK}`];
        if (songDetail) {
            modalTitle.text(songDetail.title); // 제목 설정
            modalDescription.html(songDetail.description); // 상세 HTML 설정
            modal.show();
        }else {
            console.error(`Details not found for: ${selectedFSongTitle}`);
        }   // 여기까지가 모달 띄우는 기능
        closeModalOnClickOutside(modal, modalContent);

        $(document).off('click','#voteButton.finalVoteButton')
            .on('click','#voteButton.finalVoteButton',function () {
                let finalVictorySong = selectedFDiv.find('a').text();
               // let pk =    $(finalVictorySong).parent().data("pk");
                pauseAudio();
                console.log(selectedFSongPK)

                // 우승곡에 해당하는 정보를 songDetails에서 찾기
                let selectedSongInfo = null;
                for (let key in songDetails) {
                    console.log(`Checking song: ${songDetails[key].title}, Final victory song: ${finalVictorySong}`);
                    console.log(`Type of songDetails[key].title: ${typeof songDetails[key].title}`);
                    console.log(`Type of finalVictorySong: ${typeof finalVictorySong}`);
                    if (songDetails[key].title === finalVictorySong) {
                        selectedSongInfo = songDetails[key];
                        break;
                    }
                }
                if (selectedSongInfo) {
                    // form을 이용해 데이터를 서버로 동기식으로 전송
                    const form = $('<form>', {
                        action: '/winCountC',  // 우승 횟수를 처리할 서버 URL
                        method: 'POST'
                    });

                    // 노래 제목을 추가
                    form.append($('<input>', {
                        type: 'hidden',
                        name: 'songTitle',
                        value: selectedSongInfo.title
                    }));
                    form.append($('<input>', {
                        type: 'hidden',
                        name: 'selectedFSongPK',
                        value: selectedFSongPK
                    }));
                    // 노래 설명을 추가
                    form.append($('<input>', {
                        type: 'hidden',
                        name: 'songDescription',
                        value: selectedSongInfo.description
                    }));

                    // 추가적으로 필요한 다른 정보를 추가할 수 있습니다.
                    // 예: form.append($('<input>', { type: 'hidden', name: 'songImage', value: selectedSongInfo.image }));

                    // form을 body에 추가하고 submit 호출
                    $('body').append(form);
                   form[0].submit();  // 데이터를 서버로 전송

                    // 페이지 리로드 방지 (필요한 경우)
                    return false;  // form의 기본 제출 동작을 막음
                } else {
                    console.error("선택한 곡을 찾을 수 없습니다.");
                }
            });
    });     // f1~f2 클릭 범위

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

    function closeModalOnClickOutside(modal, modalContent) {
        modal.on('click', function(event) {
            // 클릭된 요소가 모달 콘텐츠가 아니라면 모달 닫기
            if (!modalContent.is(event.target) && modalContent.has(event.target).length === 0) {
                modal.hide(); // 모달 닫기
            }
        });
    }



});     // ready 범위