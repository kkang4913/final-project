<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${path}/resources/css/styles.css">
	<script type="text/javascript" src="${path}/resources/js/jquery-3.6.0.min.js"></script>
	<title>패스워드 찾기</title>
</head>
<style>
	.success-id-msg > p {padding: 3px 0;}
</style>
<body>
<div class="form-logo">
	<img src="${path}/resources/img/logos/eoulrim_logo_p.png">
</div>
	<section class="form-section">
		<div class="form-container">
			<form class="find-form" action="">
				<label class="find-form__label" >아이디</label>
				<input class="find-form__input" type="text" id="findmemId">
				<label class="find-form__label">이름</label>
				<input class="find-form__input" type="text" id="findmemName">
				<label class="find-form__label">휴대전화</label>
				<input class="find-form__input" type="text" id="findmemPhone" placeholder="핸드폰 번호">
				<div class="success-id-msg"></div>
				<div class="find-form-inline div-line">
					<button class="find-form__btn btn--grey" type="button" onclick="popClose();">취소</button>
					<button class="find-form__btn btn--purple" type="button" value="확인" onclick="findPw();">비밀번호 찾기</button>
				</div>
			</form>
		</div>
	</section>
</body>
<script type="text/javascript">
	function popClose() {
		window.close();
	}
	function findPw() {
		var  memberId = document.querySelector('#findmemId').value;
		var  memberName = document.querySelector('#findmemName').value;
		var  phone = document.querySelector('#findmemPhone').value;
	
		if(memberId === undefined || memberId === ""){
			alert("아이디를 입력해 주세요.");
			memberId.focus();
			return false;
		}
		
		if(memberId.includes("@")){
			alert("아이디에는 '@' 가 들어갈수 없습니다. 소셜로그인을 이용해주세요");
			memberId.focus();
			return false;
		}
		
		if(memberName === undefined || memberName === ""){
			alert("이름을 입력해 주세요.");
			memberName.focus();
			return false;
		}
		
		if(phone === undefined || phone === ""){
			alert("전화번호를 입력해 주세요.");
			phone.focus();
			return false;
		}
		let count = 0;
		$.ajax({
			url: "./findPw",
			method: "POST",
		    data : sendData = {"memberId" : memberId, "memberName" : memberName, "phone" : phone },
		    dataType : "json",
		    success : function(data) {
		    if(data.code === "noData"){
		    	msg = "해당 데이터가 존재하지 않습니다.";
		    	fn_showMessage(msg,"error" );
		    	}else if (data.code==="success") {
		    		msg = "비밀번호는 " + data.pw + " 입니다.";
			    	fn_showMessage(msg,"success");	
				}	    
		     }
		    }) 
				function fn_showMessage(msg,value) {
				
				// 비밀번호 찾기가 한 번 실행되면 count가 1이됨.
				// 비밀번호 찾기를 한 번이라도 실행했을 경우, 기존 메시지 삭제함.
				if(count === 1) {
					result.innerHTML = "";
	    		}
				let tag = "";
		    	
				let result = document.querySelector('.success-id-msg');
				
				if(value == "success"){
						tag += "<p>임시비밀번호 발급</p>";
						tag += "<p>" + memberId + "님</p>";
						tag += "<p style='color:#e23a3a;'>" + msg + "</p>";
						tag += "<p>로그인 후 비밀번호 변경을 해주세요.</p>";
						result.innerHTML = tag;
				}else if(value == "error"){
						tag += "<p style='color:#e23a3a;'>" + msg + "</p>";
						result.innerHTML = tag;
				}
				// fn_showMessage() 실행되면 무조건 count 1씩 증가
				count++;
			}
		}
		</script>
</html>