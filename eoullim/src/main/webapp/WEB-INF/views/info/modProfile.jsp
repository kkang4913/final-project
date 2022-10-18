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
	  					
	<title>회원가입</title>
</head>
<body>
	<div class="form-logo">
		<img src="${path}/resources/img/logos/eoulrim_logo_p.png">
	</div>
	<section class="form-section">
		<div class="form-container" >
		<c:url  var="infoModUrl" value="/infoMod"></c:url>
			<form class="join-form " method="post" action="${infoModUrl}">
				<label class="join-form__label ">아이디</label>
				<input class="join-form__input info__id" type="text" name="memberId" id="uId" value="${sessionScope.loginData.memberId}"readonly>
				<div class="error-id-msg"></div>
				<div class="checked" id="div-display">
					<label class="join-form__label">새 비밀번호</label>
					<input class="join-form__input info__pw1" type="password" name="password" id="pw1" >
					<div class="error-pw1-msg"></div>
					<label class="join-form__label">새 비밀번호 확인</label>
					<input class="join-form__input info__pw2" type="password" name="password2" id="pw2" >
					<div class="error-pw2-msg"></div>	
				</div>
					<button class="join-form__btn btn--purple" type="button" onclick="pwModCilck();">비밀번호 수정</button>
				<label class="join-form__label">이름</label>
				<input class="join-form__input" type="text" name="memberName" id ="memberName" value="${sessionScope.loginData.memberName}"readonly>
				<div class="error-name-msg"></div>
				<c:set var="birthYear" value="${fn:substring(sessionScope.loginData.birth, 0, 4)}"></c:set>
				<c:set var="birthMonth" value="${fn:substring(sessionScope.loginData.birth, 4, 6)}"></c:set>
				<c:set var="birthDate" value="${fn:substring(sessionScope.loginData.birth, 6, 8)}"></c:set>
				<label class="join-form__label">생년월일</label>
				<div class="" id="info__birth">
					<div class="join-form-flex">
					 <select class="join-form-inline__input" id="birth-year" name="year" readonly>
				     	 <option value="${birthYear}" selected>${birthYear}</option>
			    	</select>
				    <select class="join-form-inline__input" id="birth-month" name="month" readonly>
				      <option value="${birthMonth}" selected>${birthMonth}</option>
				    	</select>
				    <select class="join-form-inline__input" id="birth-day" name="day" readonly>
						<option value="${birthDate}" selected>${birthDate}</option>
			   	 </select>
			   	 </div>
				  <div class="error-msg"></div>
				 </div>
				<div class="join-form-inline">
					<div class="join-form-inline__div">
						<label class="join-form__label">성별</label>
						<select class="join-form__input" name="gender" id="gender" readonly>
							<option value="${sessionScope.loginData.gender}" selected>
								<c:choose>
									<c:when test="${sessionScope.loginData.gender eq 'M'}">남자</c:when>
									<c:when test="${sessionScope.loginData.gender eq 'F'}">여자</c:when>
								</c:choose>
							</option>
						</select>
					</div>
					<div class="join-form-inline__div">
						<label class="join-form__label">지역</label>
						<select class="join-form__input" name="LocationId" id="location">
							<option disabled selected>지역</option>
								<c:forEach items="${locDatas}" var="locDto">
									<option value="${locDto.locationId}" <c:if test="${sessionScope.loginData.locationId eq locDto.locationId}">
										selected</c:if>>${locDto.locationName}</option>
								</c:forEach>
						</select>
					</div>
				</div>
				<label class="join-form__label">휴대전화</label>
				<input class="join-form__input info__phone" type="text" name="phone" id="pnum" value="${sessionScope.loginData.phone}">
			    <div class="error-phone-msg"></div>
			
			<label class="join-form__label" for="checkbox"> 관심분야 </label>

			<div>
				<c:forEach items="${categorysDatas}" var="categoryDto" >
					<c:set var="selList" value="${sessionScope.loginData.category}" />

					<c:set var="id" value="${fn:split(selList, ',')}" />

					<div id="cate" class="join-form_category_option">
						<input value="${categoryDto.categoryId}" id="${categoryDto.categoryId}" type="checkbox" name="category" onclick="count_check(this);"
						<c:forEach items="${id}" var="selId">
						<c:if test="${categoryDto.categoryId eq selId}">
							   checked
						</c:if>
						</c:forEach>>
						<label for="${categoryDto.categoryId}">${categoryDto.categoryName} </label>
					</div>
				</c:forEach>
			</div>
				<button class="join-form__btn btn--purple" type="button"  onclick="formCheck(this.form);" value="수정"  >수정</button>
				<button class="join-form__btn btn--grey" type="button" onclick="popClose();" >취소</button>
			</form>
		</div>
	</section>
</body>
<script src="${path}/resources/js/components/popup.js"></script>
<script type="text/javascript">
	  /*** PW ***/
	   // pwVal: 패스워드, pwReVal: 패스워드 재입력, isPwValid: 패스워드 유효 여부
		let pwVal = "", pwReVal = "", isPwValid = false
		const pwInputEl = document.querySelector('div form .info__pw1')
		const pwErrorMsgEl = document.querySelector('div form .error-pw1-msg')
		const oldPwErrorMsgEl = document.querySelector('div form .error-oldPw-msg')
		pwInputEl.addEventListener('change', () => {
		  const pwRegExp = /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/
		  pwVal = pwInputEl.value
		  if(pwRegExp.test(pwVal)) { // 정규식 조건 만족 O
		    isPwValid = true
		    pwErrorMsgEl.textContent = ""
		  } 
		  else { // 정규식 조건 만족 X
		    isPwValid = false
		    pwErrorMsgEl.textContent = errMsg.pw
		  }
		  checkPwValid()
		  console.log(pwVal, pwReVal, isPwValid)
		});
		/*** SECTION - PASSWORD RECHECK ***/
		const pwReInputEl = document.querySelector('div form .info__pw2')
		const pwReErrorMsgEl = document.querySelector('div form .error-pw2-msg')
		pwReInputEl.addEventListener('change', () => {
		  pwReVal = pwReInputEl.value
		  checkPwValid()
		  console.log(pwVal, pwReVal, isPwValid)
		});
		// 비밀번호와 재입력 값 일치 여부
		function checkPwValid() {
		  if(pwReVal === "") { // 미입력
		    pwReErrorMsgEl.textContent = ""
		  }
		  else if(pwVal === pwReVal) { // 비밀번호 재입력 일치
		    if(isPwValid)
		    pwReErrorMsgEl.style.color = "green"
		    pwReErrorMsgEl.textContent = errMsg.pwRe.success
		  }
		  else { // 비밀번호 재입력 불일치
		    pwReErrorMsgEl.style.color = "red"
		    pwReErrorMsgEl.textContent = errMsg.pwRe.fail
		  }
		}

	   /*** modile ***/
	  const phoneInputEl = document.querySelector('div form .info__phone')
	  const phoneErrorMsgEl = document.querySelector('div form .error-phone-msg')
	  phoneInputEl.addEventListener('change', () => {
	    const phoneRegExp = /^010([0-9]{8})$/ // 010-XXXX-XXXX 유효성
	    if(phoneRegExp.test(phoneInputEl.value)) { // 유효성 검사 성공
	    	phoneErrorMsgEl.textContent = ""
	    } else { // 유효성 검사 실패
	    	phoneErrorMsgEl.textContent = errMsg.mobile
	    }
	  });
	  
	  const errMsg = {
			  pw: "8~20자의 영문, 숫자, 특수문자를 모두 포함한 비밀번호를 입력해주세요",
			  pwRe: {
			    success: "비밀번호가 일치합니다",
			    fail: "비밀번호가 일치하지 않습니다"
			  },
			  mobile: "‘-’ 제외 11자리를 입력해주세요" 
			}
	  function count_check(element) {
			var chkBox = document.getElementsByName('category');
			//카테고리 name 값을 부르고
			var chkCnt = 0;  
			// 체크박스 초기값은 0 으로 설정
			
		    for(var i = 0; i < chkBox.length; i++){
		    	if(chkBox[i].checked){
		    		chkCnt++;
		    	}
		    }
			if (chkCnt > 3) {
				alert("관심사는 3개까지만 선택하실수 있습니다.");
				element.checked = false;
				return false;
			}
		 }
	
	function formCheck(form) {
	  let uid = document.getElementById('uId');
	  let pw1 = document.getElementById('pw1');
	  let pw2 = document.getElementById('pw2');
	  let memberName = document.getElementById('memberName');
	  let gender = document.getElementById('gender');
	  let location = document.getElementById('location');
	  let phone = document.getElementById('pnum');
	  let category = document.getElementById('category');

	  if(uid.value === undefined || uid.value.trim() === ""){
		  alert("아이디를 입력해주세요.");
		  uid.focus();
		  return false;
	  }
	  
		  if(pw1.value === undefined || pw1.value.trim() === ""){
			  alert("비밀번호를 입력해주세요.");
			  pw1.focus();
			  return false;
		  }
		  
		  if(pw2.value === undefined || pw2.value.trim() === ""){
			  alert("비밀번호를 입력해주세요.");
			  pw2.focus();
			  return false;
		  }
	  
		  if(memberName.value === undefined || memberName.value.trim() === ""){
			  alert("이름을 입력해주세요.");
			  memberName.focus();
			  return false;
		  }
	  if(gender.value != 'M' && gender.value != 'F' ){
		  alert("성별을 선택해주세요");
		  gender.focus();
		  return false;
	  }
	  if(location.value === '지역'){
		  alert("지역을 선택해주세요");
		  location.focus();
		  return false;
	  }
	  if(phone.value === undefined || phone.value.trim() === ""){
		  alert("전화번호를 입력해주세요");
		  phone.focus();
		  return false;
	  }
	  
	  // 관심분야
	  let is_checked = [];
	  
	  let checkbox = document.querySelectorAll('.join-form_category_option input');

	  for(let i = 0; i<checkbox.length; i++) {
		// 체크박스 체크 여부 확인
		  let item = checkbox[i].checked;
		  is_checked.push(item);
	  }
	  
	  // .filter() => 조건식 함수
	  // is_checked 배열에 담김 값을 하나씩 꺼내서 item에 담음
	  // item == true 이면, flag 변수에 담기
	  let flag = is_checked.filter(function(item) {
		  console.log("aaaa");
		  return item == true;
	  })

		if(flag.length <= 0) {
			alert('관심분야를 1개 이상 선택하세요.');
			return false;
		}
	  
	  alert('수정이 완료되었습니다.');
	  
	  form.submit();
	  move();
	  
	  function move() {
	  setTimeout(() => {
		  window.opener.location.href="/somoim/info/myInfo"
			    window.close();
	}, 2);
	}
		  
	  }
	
	function pwModCilck() {
	isPwMod = true;
	var element = document.getElementById("div-display");
    element.classList.toggle("checked");
}
	  
</script>
</html>
