<%@page import="jsp.userInfo.UserInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%-- DAO import --%>   
    
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<title>로그인 체크 페이지</title>
</head>
<body>	
	<jsp:useBean id="user" class="jsp.userInfo.UserInfoBean" />
	<jsp:setProperty property="*" name="user"/>	
	
<%
	UserInfoDAO dao = UserInfoDAO.getInstance();

	if(!dao.isJoinUser(user)){
		%>
		<script type="text/javascript">
		alert("등록된 정보가 없습니다.");
		history.go(-1);
		</script>
		<% 
	} else{
		String id = dao.getId(user);
		
		session.setAttribute("id", id);
		response.sendRedirect("../view/findIDCom.jsp");
	}
	
%>

</body>
</html>