<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<title>회원가입 완료</title>
		
	<meta name="viewport" content="width=device-width, minimum-scale=1.0, initial-scale=1.0, maximum-scale=1.0">
	
	<link rel='stylesheet' type='text/css' href='../css/common.css'/>
	<link rel='stylesheet' type='text/css' href='../css/joinCom.css'/>
	
</head>
<body>
	<div id = "wrapper">
		<div id = "header"></div>
		
		<div class = "sivisual">
			<a class = "main" href = "../main.jsp"> <img src="../img/logo.png"> </a>
		</div>
		
		
		<div id = "contents">
	 		<h3><img src = "../img/joinCom.png"></h3>
	 		<div class="gb_box box-0 tc">
        		
        	<p>회원가입이 완료되었습니다.<br />
       			<b>로그인 후 이용하시기 바랍니다.</b>
       		</p>
        
		        <div class="booking_btn">
		            <a href="../view/loginForm.jsp" class="check box-1">로그인 하기</a>
		        </div>
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