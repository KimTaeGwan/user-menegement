<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%-- DAO import --%>   
<%@ page import="jsp.memberInfo.MemberInfoDAO" %>
    
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<title>로그인 체크 페이지</title>
</head>
<body>	
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
		
	MemberInfoDAO dao = MemberInfoDAO.getInstance();
	Boolean ck = false;
	ck = dao.loginCheck(id, pw);
	
	if(ck){
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		
		response.sendRedirect("../main.jsp");
	} else{
		%><script>
			alert("가압하지 않은 아이디거나, 잘못된 비밀번호 입니다.");
			history.go(-1);
		</script> <% 
	}
%>

</body>
</html>