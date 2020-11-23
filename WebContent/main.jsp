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
	
	<!-- <link rel='stylesheet' type='text/css' href='./css/comm.css'/> -->
	<link rel='stylesheet' type='text/css' href='./css/common.css'/>
	<link rel='stylesheet' type='text/css' href='./css/joinCom.css'/>
	<link rel='stylesheet' type='text/css' href='./css/main.css'/>
</head>
<body>
	
	<div id = "wrapper">
		
		<div id = "header">
			<ul class = "right">
			<%
				if (session.getAttribute("id") == null){
			%>  
				<li><a href = "./view/loginForm.jsp" class = "login"> 로그인 </a> </li>
				<li><a href = "./view/joinFormAgree.jsp" class = "join"> 회원가입 </a> </li>
			<%
			} else{
			%>
				<li><a href = "./pro/logoutPro.jsp" class = "login"> 로그아웃 </a> </li>
				<li><a href = "./view/myPage.jsp" class = "join"> 마이페이지 </a> </li>
			<%
			}
			%>
			</ul>
		</div>
		
		<div class = "sivisual">
			<a class = "main" href = "./main.jsp"> <img src="./img/logo.png"> </a>
		</div>
	
		<div id = "contents">
	 		<h3><b>	메인 페이지 </b></h3>
	 		<div class="gb_box box-0 tc">
        		
        	<p>
        		<b>이 웹은 전주시설공단의 덕진수영장측에서 <br />
        			내부망에서만 이용할 예정입니다.<br />
        			<br />
        			해당 웹에서는 서비스 기능이 없습니다.<br />
        			웹에서는 본인인증된 회원만 등록을 하여 DB에 저장을 하고<br />
        			얼굴인식 장치에 등록된 DB와 연동하여 <br />
        			수영장 출입시 얼굴인식장치로 회원 인증하기 위함입니다.<br />
          		</b>
       		</p>
       
    		</div>       
		</div>
	</div>
	<div id = "footer">
		<div class="f_b">							
			<div class="container pad20">
				<div class="addr">
						<p>
							<a href="./view/privacyPolicy.jsp">개인정보처리방침</a>
							<a href="./view/termsOfService.jsp">이용 약관</a>
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