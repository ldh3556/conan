<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> MY PAGE </title>
    <style>
        /* 공통 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            color: white;
            background-color: white; /* 배경색 추가 */
        }

        h1 {
            text-align: center;
            color: white;
            margin-top: 20px;
        }

        button {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .top-group {
            /*padding: 20px;*/
            height: 180px
        }

        /* 명탐정 코난 로고 */
        .top-group img {
            position: absolute;
            top: 10px; /* 이미지의 위쪽 조정 */
            left: 30px; /* 이미지의 왼쪽을 조정 */
            z-index: 2; /* 이미지가 다른 요소들 위에 오도록 설정 */
            width: 100px
        }

        /* 메인으로 버튼 */
        .main-btn {
            background: #001a6d;
            color: white;
            position: absolute;
            left: 150px;
        }

        input-group {
            width: 100%;
            height: 120px;
            background: black;
            border-radius: 50px;
            z-index: 0;
            position: absolute;
            top: 230px;
        }

        .input-group input[type="text"] {
            padding: 15px;
            font-size: 18px;
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 300px;
        }

        /* 동그란 코난 프로필 사진 */
        .input-group img {
            position: absolute;
            top: 253px;
            left: 200px;
            z-index: 2;
            width: 100px
        }

        /* 닉네임 "~님" */
        .input-group span {
            color: white;
            padding: 10px;
            position: absolute;
            top: 305px;
            left: 295px;
            z-index: 5;
            width: 200px;
            margin-left: 10px;
            font-weight: bold;
        }

        .include-group {
            display: flex;
            justify-content: space-evenly;
            height: 400px;
            padding: 50px 20px;
            background: #001a6d;
            width: 100%;
            z-index: 1;
            position: absolute;
            top: 300px;
        }

        .include-group-1 {
            margin-top: 50px;
            width: 600px;
            height: 300px;
            background: white;
            border-radius: 10px;;
            padding: 10px;
            display: flex;
            flex-direction: column;
        }

        /* MY PROFILE */
        .include-group-1 span {
            color: white;
            padding: 10px;
            position: absolute;
            top: 60px;
            left: 200px;
            z-index: 2;
            width: 200px;
            font-weight: bold;
        }

        /* password-match-message */
        .include-group span {
            color: white;
            padding: 10px;
            top: 60px;
            left: 200px;
            z-index: 2;
            width: 200px;
            font-weight: bold;
        }

        .include-group button {
            margin-left: 10px;
        }

        textarea {
            border: none;
            resize: none;
            width: 100%;
            height: 100%;
        }

        /* 버튼 숨기기(배경 색상과 똑같이 지정해서) + hover 커서 기능 없애기 */
        .edit-account-btn, .edit-icon-btn, .edit-bg-btn {
            cursor: default;
            background: #001a6d;
            color: #001a6d;
        }

        /* 뒤로가기 버튼 */
        .back-btn {
            background: #EFEFEF;
            color: black;
            left: 150px;
        }

        /* 프로필 섹션 */
        .profile {
            text-align: center;
            margin-top: 50px;
        }

        .profile img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 3px solid white;
        }

        .profile .nickname {
            font-size: 24px;
            font-weight: bold;
            margin-top: 10px;
        }

        .profile .bio {
            font-size: 18px;
            margin-top: 5px;
        }

        .error {
            font-size: 12px;
        }

        .error-red {
            color: red;
            font-size: 12px;
        }

        .error-green {
            color: green;
            font-size: 12px;
        }

    </style>

    <script>
        window.onload = function () {
            document.getElementsByName("name")[0].focus(); // "이름" 입력 필드에 커서를 두기
            updateDays();  // 페이지 로딩 시 일 수 업데이트
            attachEventListeners();  // 입력 필드 변경 시 유효성 검사를 진행하도록 이벤트 리스너 설정
            validateForm();  // 페이지 로딩 시 폼 유효성 검사 진행 (버튼 상태 확인)
        };

        // 각 입력 필드가 변경될 때마다 유효성 검사를 진행하는 이벤트 리스너 추가
        function attachEventListeners() {
            document.querySelector('[name="name"]').addEventListener('input', function () {
                var name = this.value;
                var errorMessage = document.getElementById("name-error");

                // 이름이 한글이 아닌 경우 오류 메시지 출력
                if (!validateName(name)) {
                    errorMessage.innerText = "이름은 한글로 기입해야 합니다.";
                    errorMessage.style.color = "red";
                    errorMessage.style.fontSize = "12px";
                } else {
                    errorMessage.innerText = ""; // 오류 메시지 삭제
                }
                validateForm();  // 폼 유효성 검사
            });

            document.querySelector('[name="birth_year"]').addEventListener('change', updateDays);
            document.querySelector('[name="birth_month"]').addEventListener('change', updateDays);
            document.querySelector('[name="birth_day"]').addEventListener('change', validateForm);
            document.querySelectorAll('[name="gender"]').forEach((radio) => {
                radio.addEventListener('change', validateForm);
            });
            document.querySelector('[name="e_mail"]').addEventListener('input', validateForm);
            document.querySelector('[name="id"]').addEventListener('input', resetIdValidation);
            document.querySelector('[name="nickname"]').addEventListener('input', resetNicknameValidation);
            document.querySelector('[name="pw"]').addEventListener('input', validatePasswordMatch);  // 비밀번호 수정 시 실시간 확인
            document.querySelector('[name="pw_check"]').addEventListener('input', validatePasswordMatch);  // 비밀번호 확인 수정 시 실시간 확인
        }

        // 아이디 필드 수정 시 중복 확인 상태 초기화
        function resetIdValidation() {
            isIdValid = false;  // 아이디가 수정되었으므로 중복확인 상태를 초기화
            checkRegisterError();  // 버튼 상태 업데이트
            validateForm();  // 폼 유효성 검사
        }

        // 닉네임 필드 수정 시 중복 확인 상태 초기화
        function resetNicknameValidation() {
            isNicknameValid = false;  // 닉네임이 수정되었으므로 중복확인 상태를 초기화
            checkRegisterError();  // 버튼 상태 업데이트
            validateForm();  // 폼 유효성 검사
        }

        // 이름 유효성 검사 (한글만 허용)
        function validateName(name) {
            const nameRegex = /^[가-힣]+$/;  // 한글만 허용
            return nameRegex.test(name);
        }

        // 아이디 유효성 검사
        function validateId(id) {
            const idRegex = /^[a-zA-Z0-9]{6,}$/;  // 영문 대소문자와 숫자 6자 이상
            return idRegex.test(id);
        }

        // 비밀번호 유효성 검사 (영문 대소문자, 숫자 포함 6자 이상)
        function validatePassword(password) {
            const pwRegex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}$/;  // 영문 대소문자, 숫자 포함 6자 이상
            return pwRegex.test(password);
        }

        // 닉네임 유효성 검사 (영문 대소문자 또는 한글, 3자 이상)
        function validateNickname(nickname) {
            const nicknameRegex = /^[a-zA-Z가-힣0-9]{3,}$/;  // 영문 대소문자, 한글, 숫자 3자 이상
            return nicknameRegex.test(nickname);
        }

        // 아이디 중복 확인
        function checkId() {
            var id = document.getElementById("id-input").value;

            if (!id) {
                document.getElementById("id-error").innerText = "아이디를 입력해주세요.";
                isIdValid = false;
                return;
            }

            // AJAX로 서버에 중복 확인 요청
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "CheckIDC?id=" + encodeURIComponent(id), true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var result = xhr.responseText;
                    if (result === "exists") {
                        document.getElementById("id-error").innerText = "이미 사용 중인 아이디입니다.";
                        document.getElementById("id-error").style.color = "red"; // 오류 메시지 빨간색
                        isIdValid = false;
                    } else if (result === "available") {
                        document.getElementById("id-error").innerText = "사용 가능한 아이디입니다.";
                        document.getElementById("id-error").style.color = "green"; // 사용 가능한 아이디 초록색
                        isIdValid = true;
                    } else {
                        document.getElementById("id-error").innerText = "서버 오류, 다시 시도해주세요.";
                        document.getElementById("id-error").style.color = "red"; // 오류 메시지 빨간색
                        isIdValid = false;
                    }
                    checkRegisterError();  // 중복 확인 후 오류 메시지 체크
                    validateForm();  // 중복 확인 후 폼 유효성 검사
                }
            };
            xhr.send();
        }

        // 닉네임 중복 확인
        function checkNickname() {
            var nickname = document.getElementById("nickname-input").value;

            if (!nickname) {
                document.getElementById("nickname-error").innerText = "닉네임을 입력해주세요.";
                isNicknameValid = false;
                return;
            }

            var xhr = new XMLHttpRequest();
            xhr.open("GET", "CheckNicknameC?nickname=" + encodeURIComponent(nickname), true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    var result = xhr.responseText;
                    if (result === "exists") {
                        document.getElementById("nickname-error").innerText = "이미 사용 중인 닉네임입니다.";
                        document.getElementById("nickname-error").style.color = "red"; // 오류 메시지 빨간색
                        isNicknameValid = false;
                    } else if (result === "available") {
                        document.getElementById("nickname-error").innerText = "사용 가능한 닉네임입니다.";
                        document.getElementById("nickname-error").style.color = "green"; // 사용 가능한 닉네임 초록색
                        isNicknameValid = true;
                    } else {
                        document.getElementById("nickname-error").innerText = "서버 오류, 다시 시도해주세요.";
                        document.getElementById("nickname-error").style.color = "red"; // 오류 메시지 빨간색
                        isNicknameValid = false;
                    }
                    checkRegisterError();  // 중복 확인 후 오류 메시지 체크
                    validateForm();  // 중복 확인 후 폼 유효성 검사
                }
            };
            xhr.send();
        }

        // 모든 입력 필드의 "유효성 검사 함수"
        // 모든 input 입력 값을 확인하고, 모든 input 값이 입력되었을 경우에만 REGISTER 버튼을 활성화
        function validateForm() {
            var isValid = true;

            // 이름 필드 확인 (한글만 허용)
            var name = document.querySelector('[name="name"]').value;
            if (!name || !validateName(name)) {
                isValid = false;
            }

            // 생년월일 확인
            var birthYear = document.querySelector('[name="birth_year"]').value;
            var birthMonth = document.querySelector('[name="birth_month"]').value;
            var birthDay = document.querySelector('[name="birth_day"]').value;
            if (!birthYear || !birthMonth || !birthDay) {
                isValid = false;
            }

            // 성별 확인
            var gender = document.querySelector('[name="gender"]:checked');
            if (!gender) {
                isValid = false;
            }

            // 이메일 확인
            var email = document.querySelector('[name="e_mail"]').value;
            if (!email || !validateEmail(email)) {
                isValid = false;
            }

            // 아이디 확인 (중복확인 완료)
            var id = document.querySelector('[name="id"]').value;
            if (!id || !isIdValid || !validateId(id)) {
                isValid = false;
            }

            // 비밀번호 확인 (비밀번호 확인과 비밀번호 유효성 검사를 동시에 실행)
            var pw = document.querySelector('[name="pw"]').value;
            var pwCheck = document.querySelector('[name="pw_check"]').value;
            if (!pw || !validatePassword(pw) || pw !== pwCheck) {
                isValid = false;
            }

            // 닉네임 확인 (중복확인 완료)
            var nickname = document.querySelector('[name="nickname"]').value;
            if (!nickname || !isNicknameValid || !validateNickname(nickname)) {
                isValid = false;
            }

            // 'REGISTER' 버튼 활성화/비활성화
            var registerButton = document.querySelector('button[type="submit"]');
            registerButton.disabled = !isValid;
        }

        // 이메일 유효성 검사 함수
        function validateEmail(email) {
            const regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            return regex.test(email);
        }

        // 아이디 또는 닉네임 중복 여부에 따라 "입력한 내용의 수정이 필요합니다." 메시지 표시
        function checkRegisterError() {
            if (!isIdValid || !isNicknameValid) {
                document.getElementById("register-error").innerText = "입력한 내용의 수정이 필요합니다.";
            } else {
                document.getElementById("register-error").innerText = "";  // 아이디와 닉네임이 모두 유효하면 수정 메시지 제거
            }
        }

        // 년, 월, 일에 맞춰 일 수를 동적으로 업데이트
        function updateDays() {
            var year = document.getElementsByName("birth_year")[0].value;
            var month = document.getElementsByName("birth_month")[0].value;
            var daySelect = document.getElementsByName("birth_day")[0];

            // 일수를 초기화
            daySelect.innerHTML = "";

            if (year && month) {
                var daysInMonth = new Date(year, month, 0).getDate();  // 해당 월의 마지막 날짜를 구함
                for (var i = 1; i <= daysInMonth; i++) {
                    var option = document.createElement("option");
                    option.value = i;
                    option.text = i;
                    daySelect.appendChild(option);
                }
            }
        }

        // 비밀번호 확인을 실시간으로 비교하는 함수
        function validatePasswordMatch() {
            var password = document.querySelector('[name="pw"]').value;
            var passwordCheck = document.querySelector('[name="pw_check"]').value;
            var passwordMatchMessage = document.getElementById("password-match-message");
            var registerButton = document.querySelector('button[type="submit"]');

            // 비밀번호와 비밀번호 확인 일치 여부 확인
            if (password !== passwordCheck) {
                passwordMatchMessage.innerText = "비밀번호가 일치하지 않습니다.";
                passwordMatchMessage.style.color = "red";
                passwordMatchMessage.style.fontSize = "12px";
                registerButton.disabled = true; // 가입 버튼 비활성화
            } else if (!validatePassword(password)) {
                // 비밀번호가 유효한 형식(영문 대소문자, 숫자 포함 6자 이상)이 아니면
                passwordMatchMessage.innerText = "비밀번호는 영문 대소문자와 숫자를 포함한 6자 이상이어야 합니다.";
                passwordMatchMessage.style.color = "red";
                passwordMatchMessage.style.fontSize = "12px";
                registerButton.disabled = true; // 가입 버튼 비활성화
            } else {
                // 비밀번호가 일치하고 유효하면
                passwordMatchMessage.innerText = "비밀번호가 일치합니다.";
                passwordMatchMessage.style.color = "green";
                passwordMatchMessage.style.fontSize = "12px";
                registerButton.disabled = false; // 가입 버튼 활성화
            }

            // 폼의 다른 필드 유효성 체크
            validateForm();
        }
    </script>

</head>
<body>

<!-- 첫 번째 필드 -->
<div class="top-group">
    <img src="img/index/logoimg.png">
    <button type="button" class="main-btn" onclick="location.href='index.jsp'"> 메인으로</button>
</div>

<!-- 두 번째 필드 -->
<div class="input-group">
    <img src="img/index/aaaa.png">
    <span>${sessionScope.user.nickname} 님 </span> <br>
</div>

<!-- 세 번째 필드 (jsp include 사용할 예상) -->
<form action="MyPage_Edit_AccountC" method="post">
    <div class="include-group">
        <div class="include-group-1">
            <span>MY PROFILE</span>
            <textarea name="text">${sessionScope.user.text}</textarea>
        </div>
        <div>
            <div class="include-group-2">
                <div>
                    <button class="edit-account-btn" onclick="location.href='MyPage_Edit_AccountC'"> 회원정보 수정</button>
                    <button class="edit-icon-btn"> 프로필 아이콘 변경</button>
                    <button class="edit-bg-btn"> 배경이미지 변경</button>
                </div>
                <div>

                    <div> 이름
                        <input name="name" type="text" value="${sessionScope.user.name}">
                        <span id="name-error" class="error"></span> <!-- 이름 오류 메시지 -->
                    </div>
                    <br>
                    <div> E-mail
                        <input name="e_mail" type="text" value="${sessionScope.user.e_mail}">
                    </div>
                    <br>
                    <div> 비밀번호
                        <input name="pw" type="password" value="${sessionScope.user.pw}" id="pw">
                    </div>
                    <br>
                    <div> 비밀번호 확인
                        <input name="pw_check" type="password" oninput="validatePasswordMatch()">
                        <span id="password-match-message"></span><br>
                    </div>
                    <br>
                    <div> 닉네임
                        <input name="nickname" type="text" value="${sessionScope.user.nickname}" id="nickname-input">
                        <button type="button" onclick="checkNickname()">중복확인</button>
                        <span id="nickname-error" class="error" style="color: red"></span> <!-- 중복 확인 결과 표시 -->
                    </div>
                    <br>
                    <div id="register-error" class="error"></div> <!-- 아이디 또는 닉네임 중복 시 나타날 오류 메시지 -->
                    <div>
                        <button type="submit" disabled> 수정완료</button> <!-- 초기 상태에서 disabled 속성 추가 -->
                        <button type="button" class="back-btn" onclick="location.href='MyPageC'"> 뒤로가기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

</body>
</html>
