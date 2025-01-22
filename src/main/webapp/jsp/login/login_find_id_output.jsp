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
    <title> FIND ID OUTPUT </title>
    <link rel="stylesheet" href="/css/login/login.css">
</head>
<body>
<div class="wrapper">
    <div class="sec01_L">
        <a href="/jsp/index_lmj.jsp"><img src="/img/login/logoimg.png"></a>
    </div>
    <div class="sec01_R">
        <div class="deco_line"></div>
        <h1> FIND ID OUTPUT </h1>
        <div class="find_id_input_box">
            <div class="reg_text_wrapper">

                <div class="info">
                    <h3 class="result-message">
                        ${result}
                    </h3>
                </div>
                <div class="input_button">
                    <button class="back-btn" onclick="window.history.back();">뒤로가기</button>
                    <button type="button" class="back-btn" onclick="location.href='index.jsp'">메인으로</button>
                </div>
            </div>
        </div>
    </div>

</div>
<div class="footer"></div>



</body>
</html>