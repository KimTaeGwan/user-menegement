<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%-- memberInfo _ Bean, DAO 호출 --%>

<%@ page import="jsp.memberInfo.MemberInfoBean" %>  
<%@ page import="jsp.memberInfo.MemberInfoDAO" %>

<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<title>정보 수정</title>
</head>
<body>	
	<jsp:useBean id="member" class="jsp.memberInfo.MemberInfoBean" />
	<jsp:setProperty property="*" name="member"/>	
	
	<%	
		String id = session.getAttribute("id").toString();
		member.setId(id);
		
		MemberInfoDAO dao = MemberInfoDAO.getInstance();
		dao.updateMember(member);
		
		session.setAttribute("id", null);
		session.setAttribute("pw", null);
		%><script>
		alert("수정 되었습니다.");
		location.href="../view/loginForm.jsp";
		</script> <% 
	%>
</body>
</html>