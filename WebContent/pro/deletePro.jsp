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
	
	String sid = session.getAttribute("id").toString();
	String spw = session.getAttribute("pw").toString();
	
	MemberInfoDAO dao = MemberInfoDAO.getInstance();
	Boolean ck = false;
	ck = dao.loginCheck(id, pw);
	
	if(ck && id.equals(sid) && pw.equals(spw)){
		dao.deleteMember(id);
		session.invalidate();
		%><script>
			alert("탈퇴 되었습니다.");
			location.href="../main.jsp";
		</script> <% 
	} else{
		%><script>
			alert("아이디나 비밀번호가 틀렸습니다.");
			history.go(-1);
		</script> <% 
	}
%>

</body>
</html>