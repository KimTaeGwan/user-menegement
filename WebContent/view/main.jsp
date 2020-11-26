<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<title>메인 페이지</title>
	
	<meta name="viewport" content="width=device-width, minimum-scale=1.0, initial-scale=1.0, maximum-scale=1.0">
	
	<link rel='stylesheet' type='text/css' href='../css/common.css'/>
	<link rel='stylesheet' type='text/css' href='../css/myPage.css'/>
	
</head>
<body>
<%
	session.invalidate();
%>
	<div id = "wrapper">
		<div id = "header"></div>
		
		<div class = "sivisual">
			<a class = "main" href = "./main.jsp"> <img src="../img/logo.png"> </a>
		</div>
		
		<div id="contents">
			
			<div class="article">
				<ul class="mypage_btn">
					<li><a href="./joinForm.jsp">회원가입</a></li>
					<li><a href="./findID.jsp">ID 찾기</a></li>
				</ul>
			</div>		
		</div>
		
		
	</div>
	
	<div id = "footer">
		<div class="f_b">							
			<div class="container pad20">
				<div class="addr">
						<p>
							<a href="./privacyPolicy.jsp">개인정보처리방침</a>
							<a href="./termsOfService.jsp">이용 약관</a>
						</p>
					<address>
						[07057] 서울특별시 동작구 여의대방로22길 4 Tel: 02-826-0472 FAX: 02-826-0473<br />
						상호명 : 한국비전기술(주) 대표자 : 전영민     사업자등록번호 :  108-81-76628
					</address>
				</div>
			</div>
		</div>
	</div>
</body>
</html>