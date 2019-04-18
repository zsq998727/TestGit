<%--
  Created by IntelliJ IDEA.
  User: zsq
  Date: 2019/1/5
  Time: 9:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link rel="stylesheet" type="text/css" href="static/bootstrap/css/bootstrap.min.css">

    <script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/static/bootstrap/js/bootstrap.min.js"></script>
    <title>Title</title>
</head>
<body>
<%
    session.setAttribute("userInfo", "null");
%>
<jsp:forward page="/index_page"></jsp:forward>
</body>
</html>
