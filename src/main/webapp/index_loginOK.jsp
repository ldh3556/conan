<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> CONAN'DEX </title>
</head>
<body>

<div class="account_wrapper">
    <div class="login_text_wrapper" style="color: black">
        환영합니다, ${sessionScope.user.nickname} 님 <br>
        <div class="login_text" style="color: black">
            <a href="/LogoutC" id="login_text_id"> 로그아웃 </a>
            <a href="/MyPageC" id="login_text_reg"> 마이페이지 </a>
        </div>
    </div>
    <a href="/MyPageC" id="account_icon"></a>
    
</div>
</body>
</html>
