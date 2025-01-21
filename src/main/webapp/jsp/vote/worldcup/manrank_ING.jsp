<%@ page import="java.util.*, java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>랭킹</title>
</head>
<body>

<h1>현재 랭킹</h1>

<%
    // DB 연결
    String url = "jdbc:mysql://localhost:3306/vote_db";
    String user = "root";
    String password = "password";
    Connection conn = DriverManager.getConnection(url, user, password);

    // 쿼리 실행
    String sql = "SELECT * FROM winner_table_hdh ORDER BY rank";
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
%>

<table border="1">
    <thead>
    <tr>
        <th>순위</th>
        <th>이름</th>
        <th>이미지</th>
        <th>비율</th>
    </tr>
    </thead>
    <tbody>
    <%
        int rank = 1;
        while(rs.next()) {
    %>
    <tr>
        <td><%= rank++ %></td>
        <td><%= rs.getString("name") %></td>
        <td><img src="<%= rs.getString("image_url") %>" width="100" height="100"></td>
        <td><%= rs.getString("ratio") %>%</td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

</body>
</html>
