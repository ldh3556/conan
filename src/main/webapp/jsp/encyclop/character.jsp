<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.conan.semi.encyclop.CharacterDTO" %>

<!DOCTYPE html>
<html>
<head>
    <title>캐릭터 목록</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/encyclop/character/character.css" />
</head>
</head>
<body>
<h1>캐릭터 목록</h1>

<%
    // (1) 서블릿에서 넘겨준 "characters" 속성 꺼내기
    List<CharacterDTO> characters = (List<CharacterDTO>) request.getAttribute("characters");
    if (characters == null || characters.size() == 0) {
%>
<p>등록된 캐릭터가 없습니다.</p>
<%
} else {
%>
<table border="1">
    <tr>
        <th>ID</th>
        <th>이름</th>
        <th>나이</th>
        <th>명대사</th>
        <th>설명</th>
        <th>이미지</th>
    </tr>
    <%
        // (2) for문으로 리스트의 각 캐릭터 정보를 테이블에 출력
        for (CharacterDTO c : characters) {
    %>
    <tr>
        <td><%= c.getId() %></td>
        <td><%= c.getName() %></td>
        <td><%= c.getAge() %></td>
        <td><%= c.getQuote() %></td>
        <td><%= c.getDescription()<%--.replaceAll("\n", "<br>")--%> %></td>
        <td>
            <img src="<%= c.getButtonImage() %>" alt="버튼이미지" width="100" />
            <br/>
            <img src="<%= c.getMainImage() %>" alt="메인이미지" width="100" />
        </td>
    </tr>
    <%
        } // end for
    %>
</table>
<%
    } // end else
%>
</body>
</html>
