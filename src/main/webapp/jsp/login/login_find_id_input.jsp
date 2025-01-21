<%--
  Created by IntelliJ IDEA.
  User: hwangdonghyuk
  Date: 2025. 1. 9.
  Time: 오후 4:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title> FIND_ID_TEST </title>
    <link rel="stylesheet" href="../../css/login/login.css">
</head>
<body>

<div class="wrapper">
    <div class="sec01_L">
        <a href="/jsp/index_lmj.jsp"><img src="../../img/login/logoimg.png"></a>
    </div>
    <div class="sec01_R">
        <div class="deco_line"></div>
        <h1> 아이디 찾기 </h1>
        <div class="reg_text_wrapper">

            <div class="to_find">
                <a href="/Find_PWC"> 비밀번호 찾기 </a>
            </div>
        </div>

        <div class="find_id_input_box">
            <form action="/Find_IDC" method="post">
                <div id="input_name"> <span>이름</span> <input name="name" type="text" placeholder="이름을 입력하세요"></div>
                <div id="input_email"> <span>E-mail</span> <input name="e_mail" type="text" placeholder="example@gmail.com"> </div>
                <div class="input_button"> <button> FIND ID </button>
                    <button type="button" class="back-btn" onclick="location.href='index.jsp'">메인으로</button>
                </div>
            </form>
        </div>
    </div>

</div>
<div class="footer"></div>

</body>
</html>