<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%-- memberInfo _ Bean, DAO 호출 --%>

<%@ page import="jsp.memberInfo.*" %>  

<%
		request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<title>가입 완료</title>
</head>
<body>	
	<jsp:useBean id="member" class="jsp.memberInfo.MemberInfoBean" />
	<jsp:setProperty property="*" name="member"/>	
	
	<%	
		MemberInfoDAO dao = MemberInfoDAO.getInstance();
		
		String id = request.getParameter("id");
		if(dao.overlapIdCheck(id)){
			%>
			<script>
			alert("중복된 아이디입니다.");
			history.go(-1);
			</script>
			<% 
		} else{
			dao.insertMember(member);

			response.sendRedirect("../view/joinCom.jsp");
		}
	%>
	
</body>
</html>