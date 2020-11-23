<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<title>로그아웃 페이지</title>
</head>
<body>	
<%
	session.invalidate();
	response.sendRedirect("../main.jsp");
%>
	
</body>
</html>