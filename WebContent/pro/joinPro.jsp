<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%-- memberInfo _ Bean, DAO 호출 --%>

<%@ page import="jsp.userInfo.*" %>  

<%
  	request.setCharacterEncoding("utf-8");
  %>
<!DOCTYPE html>
<html>
<head>
	<title>가입 완료</title>
</head>
<body>	
	<jsp:useBean id="user" class="jsp.userInfo.UserInfoBean" />
	<jsp:setProperty property="*" name="user"/>	
	
	<%	
		UserInfoDAO dao = UserInfoDAO.getInstance();
		
		if(dao.isJoinUser(user)){
			%>
			<script type="text/javascript">
			alert("이미 회원 가입 하셨습니다.");
			history.go(-1);
			</script>
			<% 
		} else{
			dao.insertUser(user);
			
			session.setAttribute("name", user.getName());
			session.setAttribute("id", user.getId());
			response.sendRedirect("../view/joinCom.jsp");
		}
	%>
	
</body>
</html>