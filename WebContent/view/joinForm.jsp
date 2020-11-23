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
			
			if(joinForm.id.value == ""){
				alert("아이디를 입력하세요.");
				joinForm.id.focus();
				return false;
			}
			
			if(joinForm.id.value.length < 5 || 
				joinForm.pw.value.length > 12){
				alert("영문이나 특수문자 숫자 5자 이상, 12자 이하의 아이디만 사용 가능합니다.");
				joinForm.id.focus();
				return false;
			}
			
			if(joinForm.pw.value == ""){
				alert("비밀번호를 입력하세요.");
				joinForm.pw.focus();
				return false;
			}
			
			//비밀번호 조합 확인
			var pattern1 = /[0-9]/;
			var pattern2 = /[a-zA-Z]/;
			var pattern3 = /[~!@#$^&*)]/;
			
			if(!pattern1.test(joinForm.pw.value) || 
				!pattern2.test(joinForm.pw.value) || 
				!pattern3.test(joinForm.pw.value) || 
				joinForm.pw.value.length < 8){
					alert("8~12자 영문 대 소문자, 숫자, 특수문자를 사용하세요");
					joinForm.pw.focus();
					return false;
			}
			
			// 비밀번호에 아이디가 속하는지 확인
			if(joinForm.pw.value.indexOf(joinForm.id.value) > -1){
				alert("비밀번호는 ID를 포함할 수 없습니다.");
				joinForm.pw.focus();
				return false;
			}
			
			// 동일문자 확인
			var samePass_0 = 0; 
		
			for(var i = 2; i < joinForm.pw.value.length; i++){
				var chrPass_0 = joinForm.pw.value.charCodeAt(i-2);
				var chrPass_1 = joinForm.pw.value.charCodeAt(i-1);
				var chrPass_2 = joinForm.pw.value.charCodeAt(i);
				
				//동일문자 카운트
				if((chrPass_0 == chrPass_1) && (chrPass_1 == chrPass_2)){
					samePass_0++;
				}else{
					samePass_0 = 0;
				}
	         }   
			
			if(samePass_0 > 0){
				alert("동일문자를 3자 이상 연속 입력할 수 없습니다.");
				joinForm.pw.focus();
				return false;
			}
			
			if(joinForm.pw.value != joinForm.pwr.value){
				alert("비밀번호가 일치하지 않습니다.");
				joinForm.pwr.focus();
				return false;
			}
			
			if(joinForm.name.value==""){
				alert("이름을 입력해주세요!");
				joinForm.name.focus();
				return false;
			}
			
			for (i=0;i<joinForm.elements.length;i++){ //특정 영역을 체크 할때는 숫자로 대신 한다 예: for(i=3;i<21;i++)
			if ((joinForm.elements[i].name == "gender") && (joinForm.elements[i].checked))
				checked_items++;
			}
				
			if (checked_items == 0){
				alert("성별을 선택해주세요!");
				return false;
			}
	
			if(joinForm.birth.value==""){
				alert("생년월일을 입력해주세요!");
				joinForm.birth.focus();
				return false;
			}
			
			if(joinForm.phone.value==""){
				alert("전화번호를 입력해주세요!");
				joinForm.phone.focus();
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
			<a class = "main" href = "../main.jsp"> <img src="../img/logo.png"> </a>
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
										<th scope="row"><em class="Bred">&lowast; </em><label for="userName">성명</label></th>
										<td>
											<input id="name" name="name" type="text" value="" maxlength="12" class="input-text"> 
										</td>
										<th scope="row"><em class="Bred">&lowast; </em><label for="gender">성별</label></th>
	                                   	<td>
	                                   		<div class="radio">
		                                        <div class="custom-radio">
		                                            <input type="radio" id="male" name="gender" value="men">
		                                            <label for="male">남</label>
		                                        </div>
		                                        <div class="custom-radio">
		                                            <input type="radio" id="female" name="gender" value="women">
		                                            <label for="female">여</label>
		                                        </div>
	                                    	</div>
	                               		</td>
									</tr>
									<tr>
										<th scope="row"><label for="userBirth">생년월일</label></th>
										<td colspan="3">
											<input id="birth" name="birth" type="text" maxlength="12" class="input-text" >									
										</td>
									</tr>
									<tr>
										<th scope="row"><em class="Bred">&lowast; </em><label for="userId">아이디</label></th>
	                                    <td colspan="3">
	                                    	<input id="id" name="id" type="text" maxlength="12" class="input-text" placeholder="아이디">
	                                    </td>
									</tr>
									<tr>
									    <th scope="row"><em class="Bred">&lowast; </em><label for="userPassword">비밀번호</label></th>
									    <td colspan="3"><input id="userPassword" name="pw" type="password" value="" maxlength="12" class="input-text" placeholder="비밀번호" > <small>(8자 이상 <span style="color:red;">12자까지</span> 영문, 숫자, 특수문자를 사용해 주세요.)</small></td>
									</tr>
									<tr>
									    <th scope="row"><em class="Bred">&lowast; </em><label for="userPasswordChk">비밀번호 확인</label></th>
									    <td colspan="3"><input type="password" id="pwr" name="userPasswordChk" value="" maxlength="12" class="input-text" placeholder="비밀번호확인" > <small>비밀번호를 동일하게 입력해 주세요.</small></td>
									</tr>
									<tr>
										<th scope="row"><label for="userPhone">연락처</label></th>
										<td colspan="3">
											<input id="phone" name="phone" type="text" maxlength="12" class="input-text" >
										</td>	
									</tr>
								</tbody>
							</table>
						</div>
						<div class="booking_btn">
							<a href="./myPage.jsp">취소</a> 
							<a href="#" class="check" onclick="checkJoinForm(); return false;">다음</a>
<!-- 							<input type="submit" value="다음"> 
 -->						</div>
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