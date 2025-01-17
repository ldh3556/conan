<%--
  Created by IntelliJ IDEA.
  User: 82102
  Date: 25. 1. 14.
  Time: 오후 4:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
  </head>
  <body>
  <button class="button">버튼</button>
  <div class="wrapper">
    <div id="inner">

    </div>
  </div>
  <script>
    let modal = $('#inner')
    $('.button').click(function (){
      modal.text('adasd');
    })
  </script>
  </body>
</html>
