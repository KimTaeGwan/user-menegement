<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
	<title>정보 입력</title>
	
	<meta name="viewport" content="width=device-width, minimum-scale=1.0, initial-scale=1.0, maximum-scale=1.0">
	
	<link rel='stylesheet' type='text/css' href='../css/common.css'/>
	<link rel='stylesheet' type='text/css' href='../css/modifyForm.css'/>
	
	<script type="text/javascript">
		function checkJoinForm(){
			
			var joinForm = document.joinForm;
			var checked_items = 0;
			
			if(joinForm.name.value==""){
				alert("이름을 입력해주세요.");
				joinForm.name.focus();
				return false;
			}
			
			if(joinForm.ph.value==""){
				alert("전화번호를 입력해주세요.");
				joinForm.ph.focus();
				return false;
			}
			
			if(joinForm.area.value==""){
				alert("지역을 입력해주세요.");
				joinForm.area.focus();
				return false;
			}
			
			if(!joinForm.agree1.checked){
				alert("개인정보 수집ㆍ이용 동의를 클릭해 주세요.");
				joinForm.agree1.focus();
				return false;
			}
			
			if(!joinForm.agree2.checked){
				alert("개인정보 제 3자 제공 동의.");
				joinForm.agree2.focus();
				return false;
			}
			
			joinForm.submit();
			/* return true; */
		}

		</script>


</head>
<body>
	<div id = "wrapper">
		<div id = "header"></div>
		
		<div class = "sivisual">
			<a class = "main" href = "./main.jsp"> <img src="../img/logo.png"> </a>
		</div>
		<div id="contents">
			<h3><b>	회원 가입 </b></h3>
			
			<div id = "members">
				<!-- 회원 정보 입력 폼 -->
				<form method="post" action="../pro/joinPro.jsp" name="joinForm" 
					onsubmit="return checkJoinForm()">
					<fieldset>
						<div class="tb-responsive view-type">
							<table class="rwd-table">
								<colgroup>
									<col style="width:30%">
								</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="name">성명</label></th>
										<td colspan="4">
											<input type="text" name="name" maxlength="12" class="input-text"> 
										</td>
									</tr>
									
									<tr>
									    <th scope="row"><label for="ph">전화번호</label></th>
									    <td colspan="4">
									    	<input type="text" name="ph" maxlength="12" class="input-text" placeholder="ex) 01022223333" > 
									    	<small> - 는 빼고 입력해 주세요 </small>
									    </td>
									</tr>
									<tr>
									    <th scope="row"><label for="area">지역</label></th>
									    <td colspan="4">
									    	<input type="text" name	="area" maxlength="12" class="input-text" placeholder="ex) 전주" > 
									   </td>
									</tr>
									<tr>
										<th scope="row"><label for="agree1">개인정보 <br>수집ㆍ이용<br> 동의</label></th>
										<td colspan="2">
											<input type="radio" name="agree1"> 동의
										</td>
										
										<th scope="row"><label for="agree2">개인정보 <br>제 3자<br>제공 동의</label></th>
										<td colspan="2">
											<input type="radio" name="agree2"> 동의
										</td>	
									</tr>
								</tbody>
							</table>
						</div>
						<div class="booking_btn">
							<a href="./main.jsp">취소</a> 
							<a href="#" class="check" onclick="checkJoinForm(); return false;">다음</a>
<!-- 							<input type="submit" value="다음"> 
 -->					</div>
					</fieldset>
				</form>
				
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
		
		
		
	</div>
</body>
</html>