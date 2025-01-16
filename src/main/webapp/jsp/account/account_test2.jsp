<%--
  Created by IntelliJ IDEA.
  User: hwangdonghyuk
  Date: 2025. 1. 9.
  Time: 오후 4:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>

    <script>
        window.onload = function () {
            document.getElementsByName("name")[0].focus(); // "이름" 입력 필드에 커서를 두기
            updateDays();  // 페이지 로딩 시 일 수 업데이트
            attachEventListeners();  // 입력 필드 변경 시 유효성 검사를 진행하도록 이벤트 리스너 설정
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

        // 비밀번호 유효성 검사 (영문 대소문자, 숫자 포함 8자 이상)
        function validatePassword(password) {
            const pwRegex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{8,}$/;  // 영문 대소문자, 숫자 포함 8자 이상
            return pwRegex.test(password);
        }

        // 닉네임 유효성 검사
        function validateNickname(nickname) {
            const nicknameEngRegex = /^[a-zA-Z]{7,}$/;  // 영문 대소문자 7자 이상
            const nicknameKorRegex = /^[가-힣0-9]{5,}$/;  // 한글 또는 숫자 5자 이상
            return nicknameEngRegex.test(nickname) || nicknameKorRegex.test(nickname);
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
                        // 아이디가 중복일 경우 오류 메시지 표시
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
                // 비밀번호가 유효한 형식(영문 대소문자, 숫자 포함 8자 이상)이 아니면
                passwordMatchMessage.innerText = "비밀번호는 영문 대소문자와 숫자를 포함한 8자 이상이어야 합니다.";
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

    <style>
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

</head>
<body>

<h1> REGISTER </h1> 회원이 되어 함께 소통해요!
<hr>

<form action="AccountC_test" method="post" id="signup-form">
    <div> 이름
        <input name="name" type="text" placeholder="이름을 입력하세요">
        <span id="name-error" class="error"></span> <!-- 이름 오류 메시지 -->
    </div>
    <br>

    <div> 생년월일
        <select name="birth_year" onchange="updateDays()">
            <option value="">년</option>
            <% int currentYear = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR); %>
            <% for (int year = 1960; year <= currentYear; year++) { %>
            <option value="<%= year %>" <%= (year == 1960) ? "selected" : "" %>><%= year %>
            </option>
            <% } %>
        </select>

        <select name="birth_month" onchange="updateDays()">
            <option value="">월</option>
            <% for (int month = 1; month <= 12; month++) { %>
            <option value="<%= month %>" <%= (month == 1) ? "selected" : "" %>><%= month %>
            </option>
            <% } %>
        </select>

        <select name="birth_day">
            <option value="">일</option>
        </select>
    </div>
    <br>

    <div> 성별
        <label><input name="gender" type="radio" value="남" checked="checked"> 남 </label>
        <label><input name="gender" type="radio" value="여"> 여 </label>
    </div>
    <br>

    <div> E-mail
        <input name="e_mail" type="text" placeholder="example@gmail.com">
    </div>
    <br>

    <div> 아이디
        <input name="id" type="text" placeholder="영문 대,소문자,숫자 조합 6자리 이상" id="id-input">
        <button type="button" onclick="checkId()">중복확인</button>
        <span id="id-error" class="error"></span> <!-- 중복 확인 결과 표시 -->
    </div>
    <br>

    <div> 비밀번호
        <input name="pw" type="password" placeholder="영문 대,소문자, 숫자 조합 8자리 이상" id="pw">
    </div>
    <br>

    <div> 비밀번호 확인
        <input name="pw_check" type="password" placeholder="비밀번호를 확인해주세요" oninput="validatePasswordMatch()">
        <span id="password-match-message"></span><br>
    </div>
    <br>

    <div> 닉네임
        <input name="nickname" type="text" placeholder="영문 대,소문자 6자, 한글 5자" id="nickname-input">
        <button type="button" onclick="checkNickname()">중복확인</button>
        <span id="nickname-error" class="error"></span> <!-- 중복 확인 결과 표시 -->
    </div>
    <br>

    <div id="register-error" class="error"></div> <!-- 아이디 또는 닉네임 중복 시 나타날 오류 메시지 -->

    <div>
        <button type="submit" disabled> REGISTER</button> <!-- 초기 상태에서는 비활성화 -->
        <button type="button" class="back-btn" onclick="location.href='jsp/main_HDH.jsp'">메인으로</button>
    </div>
</form>

</body>
</html>



