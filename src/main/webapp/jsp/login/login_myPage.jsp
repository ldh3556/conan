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
            background-color: #333; /* 배경색 추가 */
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
            border: 3pt solid blue;
            padding: 20px; /* 내부에 패딩 추가 */
        }

        .input-group input[type="text"] {
            padding: 15px;
            font-size: 18px;
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 300px;
        }

        /* 동그란 코난 사진 위치 */
        .input-group img {
            position: absolute;
            top: -20px; /* 이미지의 위쪽 조정 */
            left: 30px; /* 이미지의 왼쪽을 조정 */
            z-index: 2; /* 이미지가 다른 요소들 위에 오도록 설정 */
        }

        .include-group {
            display: flex;
            justify-content: space-between;
            height: 400px;
            padding: 20px; /* 내부에 패딩 추가 */
        }


        .include-group button {
            margin-left: 10px;
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

    </style>
</head>
<body>

<!-- 첫 번째 필드 -->
<div class="top-group" style="border: 3pt solid green; height: 180px">
    <img src="img/index/logoimg.png">
    <button type="button" class="back-btn" onclick="location.href='index.jsp'" style="background: #001a6d; color: white"> 메인으로</button>
</div>

<!-- 두 번째 필드 -->
<div class="input-group" style="width: 100%; height: 120px; background: #001a6d; border-radius: 50px; z-index: 0; position: absolute; top: 230px;">
    <img src="img/index/aaaa.png" style="width: 100px">
    <span style="margin-left: 150px;">${sessionScope.user.nickname} 님 </span> <br>
</div>

<!-- 세 번째 필드 -->
<div class="include-group" style="background: #001a6d; width: 100%; z-index: 1; position: absolute; top: 300px;" >
    <div style="margin-top: 20px; width: 600px; height: 300px; background: white; border-radius: 10px; padding: 10px; display: flex; flex-direction: column">
        <span style="color: black; padding: 10px;">MY PROFILE</span>
        <textarea style="border:none; resize: none; width: 100%; height: 100%;"></textarea>
    </div>
    <div>
        <button class="edit-account-btn" onclick="location.href='MyPage_Edit_AccountC'"> 회원정보 수정</button>
        <button class="edit-icon-btn" onclick="location.href='아이콘 변경 페이지'"> 프로필 아이콘 변경</button>
        <button class="edit-bg-btn" onclick="location.href='배경 변경 페이지'"> 배경이미지 변경</button>
    </div>
</div>

</body>
</html>
