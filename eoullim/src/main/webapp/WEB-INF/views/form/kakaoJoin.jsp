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
	<title>추가정보 입력(카카오)</title>
</head>
<body>
<header></header>
<main class="main">
	<c:if test="${not empty userInfo}">
		<section class="social-page">
		<div>
			<img src="${path}/resources/img/logos/eoulrim_logo_p.png">
		</div>
		<div class="start-page-title">
			<span>카카오 로그인</span>
			<span>추가정보를</span>
			<span>입력해주세요 :)</span>
		</div>
	</section>
	<section class="social-join-form join-page">
		<div class="join-container" >
		<c:url  var="joinKakaoAddUrl" value="/socialAddJoin"></c:url>
			<form class="join-form " method="post" action="${joinKakaoAddUrl}">
				<c:if test="${not empty userInfo}">
					<label class="join-form__label">아이디</label>
					<div style="display: flex; justify-content:space-between; ">
						<input class="join-form__input info__id" type="text" name="memberId" id="uId" value="${userInfo.email}" >
						<input style="display: none"  class="join-form__input info__id" name="loginType" value="${userInfo.loginType}"  >
							<button class="join-chk-btn" type="button" onclick="findIdchk();">중복확인</button>
					</div>
				</c:if>	
				<div class="error-id-msg"></div>
				<label class="join-form__label">비밀번호</label>
				<input class="join-form__input info__pw1" type="password" name="password" id="pw1">
				<div class="error-pw1-msg"></div>
				<label class="join-form__label">비밀번호 재확인</label>
				<input class="join-form__input info__pw2" type="password" name="password2" id="pw2">
				<div class="error-pw2-msg"></div>	
				<c:if test="${empty userInfo}">
				<label class="join-form__label">이름</label>
				<input class="join-form__input" type="text" name="memberName" id ="memberName" >
				</c:if>
				<c:if test="${not empty userInfo}">
				<label class="join-form__label">이름</label>
				<input class="join-form__input" type="text" name="memberName" id ="memberName" value="${userInfo.nickname}">
				</c:if>
				<div class="error-name-msg"></div>
				<label class="join-form__label">생년월일</label>
				<div class="" id="info__birth">
					<div class="join-form-flex">
					 <select class="join-form-inline__input" id="birth-year" name="year" >
				     	 <option value="0" >출생 연도</option>
			    	</select>
		    		<c:if test="${empty userInfo}">
				    <select class="join-form-inline__input" id="birth-month" name="month">
				      <option selected value="0">월</option>
				    	</select>
				    <select class="join-form-inline__input" id="birth-day" name="day">
				    	  <option  selected value="0">일</option>
			   	 </select>
			   	 </c:if>
		    		<c:if test="${not empty userInfo}">
				    <select class="join-form-inline__input" id="birth-month" name="month">
				      <option selected value="${userInfo.month}">${userInfo.month}</option>
				    	</select>
				    <select class="join-form-inline__input" id="birth-day" name="day">
				    	  <option selected value="${userInfo.day}">${userInfo.day}</option>
			   	 </select>
			   	 </c:if>
			   	 </div>
				  <div class="error-msg"></div>
				 </div>
				<div class="join-form-inline">
					<div class="join-form-inline__div">
						<label class="join-form__label">성별</label>
						<select class="join-form__input" name="gender" id="gender" style="width: 100%">
							<option disabled selected >성별</option>
							<option value="M">남자</option>
							<option value="F">여자</option>
						</select>
					</div>
					<div class="join-form-inline__div">
						<label class="join-form__label">지역</label>
						<select class="join-form__input" name="LocationId" id="location" style="width: 100%">
							<option disabled selected>지역</option>
								<c:forEach items="${locDatas}" var="locDto">
									<option value="${locDto.locationId}">${locDto.locationName}</option>
								</c:forEach>
						</select>
					</div>
				</div>
				<label class="join-form__label">휴대전화</label>
				<div style="display: flex; justify-content:space-between; ">
					<input class="join-form__input info__phone" type="text" name="phone" id="pnum" placeholder="핸드폰번호" >
					<button class="join-chk-btn" type="button" onclick="PhoneChk();">중복확인</button>
			    </div>
			    <div class="error-phone-msg"></div>
			<label class="join-form__label" for="checkbox"> 관심분야 </label>
			<div> 
				<c:forEach items="${categorysDatas}" var="categoryDto" >
					<div class="join-form_category_option">
						<input value="${categoryDto.categoryId}" id="${categoryDto.categoryId}"type="checkbox" name="category" onclick="count_check(this);">
						<label for="${categoryDto.categoryId}">${categoryDto.categoryName} </label>
					</div>
				</c:forEach>
			</div>
				<button class="join-form__btn btn--purple" type="button"  onclick="formCheck(this.form);" value="회원가입"  >회원가입</button>
				<button class="join-form__btn btn--grey" type="button" onclick="mainPage();" >취소</button>
			</form>
		</div>
	</section>
</c:if>
</main>
</body>
<script type="text/javascript">
	// 팝업창 닫기 
	function popClose() {
		window.close();
	};
	
	// 유효성 검사 : 생년월일 년
	const birthYearEl = document.querySelector('#birth-year')
	// option 목록 생성 여부 확인
	isYearOptionExisted = false;
	birthYearEl.addEventListener('focus', function () {
	  // year 목록 생성되지 않았을 때 (최초 클릭 시)
	  if(!isYearOptionExisted) {
	    isYearOptionExisted = true
	    for(var i = 1940; i <= 2022; i++) {
	      // option element 생성
	      const YearOption = document.createElement('option')
	      YearOption.setAttribute('value', i)
	      YearOption.innerText = i
	      // birthYearEl의 자식 요소로 추가
	      this.appendChild(YearOption);
	    }
	  }
	});
	
	// 유효성 검사 : 생년월일 월
	const birthMonthEl = document.querySelector('#birth-month')
	// option 목록 생성 여부 확인
	isMonthOptionExisted = false;
	birthMonthEl.addEventListener('focus', function () {
	  // month 목록 생성되지 않았을 때 (최초 클릭 시)
	  if(!isMonthOptionExisted) {
	    isMonthOptionExisted = true
	    for(var i = 1; i <= 12; i++) {
	      // option element 생성
	      const MonthOption = document.createElement('option')
	     MonthOption.setAttribute('value', i)
	      MonthOption.innerText = i
	      // birthmonthEl의 자식 요소로 추가
	      this.appendChild(MonthOption);
	    }
	  }
	});
	
	// 유효성 검사 : 생년월일 일
	const birthDayEl = document.querySelector('#birth-day')
	// option 목록 생성 여부 확인
	isDayOptionExisted = false;
	birthDayEl.addEventListener('focus', function () {
	  // Day 목록 생성되지 않았을 때 (최초 클릭 시)
	  if(!isDayOptionExisted) {
	    isDayOptionExisted = true
	    for(var i = 1; i <= 31; i++) {
	      const DayOption = document.createElement('option')
	      DayOption.setAttribute('value', i)
	      DayOption.innerText = i
	      this.appendChild(DayOption);
	    }
	  }
	});
	
	//유효 날짜 여부 확인 
	// [year, month, day]
	const birthArr = [-1, -1, -1]
	const birthErrorMsgEl = 
	  document.querySelector('#info__birth .error-msg')

	birthYearEl.addEventListener('change', () => {
	  birthArr[0] = birthYearEl.value
	  // 유효 날짜 여부 확인
	  checkBirthValid(birthArr)
	});

	birthMonthEl.addEventListener('change', () => {
	  birthArr[1] = birthMonthEl.value
	  checkBirthValid(birthArr)
	});

	birthDayEl.addEventListener('change', () => {
	  birthArr[2] = birthDayEl.value
	  checkBirthValid(birthArr)
	});

	/* 유효한 날짜인지 여부 확인 (윤년/평년) */
	function checkBirthValid(birthArr) {
	var account = 
		
	isBirthValid = true
  
	  y = birthArr[0]
	  m = birthArr[1]
	  d = birthArr[2]
	  // 생년월일 모두 선택 완료 시
	  if(y > 0 && m > 0 && d > 0) {
	    if ((m == 4 || m == 6 || m == 9 || m == 11) && d == 31) { 
	      isBirthValid = false
	    }
	    else if (m == 2) {
	      if(((y % 4 == 0) && (y % 100 != 0)) || (y % 400 == 0)) { // 윤년
	        if(d > 29) { // 윤년은 29일까지
	          isBirthValid = false
	        }
	      } else { // 평년
	        if(d > 28) { // 평년은 28일까지
	          isBirthValid = false
	        }
	      }
	    }
	
	    if(isBirthValid) { // 유효한 날짜
	        birthErrorMsgEl.textContent = ""
	        account.birth = birthArr.join('')
	      } else { // 유효하지 않은 날짜
	    	  birthErrorMsgEl.textContent = errMsg.birth     
	    	  account.birth = null
	      }
	    }
	  };
	  
	     var idresult = '3';
	     // 아이디 중복 체크 확인 3 == 중복체크 하지 않음
	     //					      1 == 중복체크 함 / 아이디 사용가능
	     //					      2 == 중복체크 함 / 중복된 아이디로 사용 불가능
	  
	  /*** SECTION - ID ***/
	  const idInputEl = document.querySelector('div form .info__id');
	  const idErrorMsgEl = document.querySelector('div form  .error-id-msg')
	  idInputEl.addEventListener('focusout', () => {
	    const idRegExp = /^[a-zA-Z0-9]{6,20}$/ // 6~20자의 영문 소문자와 숫자
		    if(idRegExp.test(idInputEl.value)) { // 유효성 검사 성공
		      idErrorMsgEl.textContent = "";
		    } else { // 유효성 검사 실패
		      idErrorMsgEl.textContent = errMsg.id.invalid
		    }
	    });
	  /*** PW ***/
	   // pwVal: 패스워드, pwReVal: 패스워드 재입력, isPwValid: 패스워드 유효 여부
		let pwVal = "", pwReVal = "", isPwValid = false, isPw2Valid = false
		const pwInputEl = document.querySelector('div form .info__pw1')
		const pwErrorMsgEl = document.querySelector('div form .error-pw1-msg')
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
		    isPw2Valid = true;
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
			  id: { 
			    invalid: "6~20자의 영문 소문자와 숫자만 사용 가능합니다",
			    empty: "아이디를 입력해주세요",
			    success: "사용 가능한 아이디입니다",
			    fail: "사용할 수 없는 아이디입니다"
			  },
			  pw: "8~20자의 영문, 숫자, 특수문자를 모두 포함한 비밀번호를 입력해주세요",
			  pwRe: {
			    success: "비밀번호가 일치합니다",
			    fail: "비밀번호가 일치하지 않습니다"
			  },
			  birth: "생년월일을 다시 확인해주세요",
			  mobile: "‘-’ 제외 11자리를 입력해주세요" 
			}
	  
	  function PhoneChk() {
		  if(phoneInputEl.value === undefined || phoneInputEl.value.trim() === ""){
			  phoneErrorMsgEl.textContent = errMsg.mobile
		    }else{
				$.ajax({
					url: "${path}/phoneChk",
					method: "POST",
				    data : {"phone" :document.getElementById('pnum').value},
				    dataType : "json",
				    success : function (data) {
						if(data == 1){
							alert("핸드폰 번호가 존재합니다. 확인해주세요");
							idresult = '2';
						}else if(data == 0){
							alert("사용가능한 핸드폰번호 입니다.");
							 $("input[name=phone]").attr("readonly",true);
							idresult = '1';
						}
					}
				})
		    }
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
	  function findIdchk() {
		  if(idInputEl.value === undefined || idInputEl.value.trim() === ""){
		    	 idErrorMsgEl.textContent = errMsg.id.empty
		    }else{
				$.ajax({
					url: "${path}/kakaoIdChk",
					method: "POST",
				    data : {"memberId" :document.getElementById('uId').value},
				    dataType : "json",
				    success : function (data) {
						if(data == 1){
							alert("중복된 아이디 입니다.");
							idresult = '2';
						}else if(data == 0){
							alert("사용가능한 아이디 입니다.");
							idresult = '1';
						}
					}
				})
		    }
	}
	  
	function formCheck(form) {
	  let uid = document.getElementById('uId');
	  let pw1 = document.getElementById('pw1');
	  let pw2 = document.getElementById('pw2');
	  let memberName = document.getElementById('memberName');
	  let Byear = document.getElementById("birth-year").value;
	  let Bmonth = document.getElementById("birth-month").value;
	  let Bday = document.getElementById("birth-day").value;
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
	  
	  if (Byear === '0') {
			alert("생년월일을 입력해주세요.")
			return false;
			}
		  
		  
		  if (Bmonth === '0') {
			alert("생년월일을 입력해주세요.")
			return false;
			}
		  
		  
		  if (Bday === '0') {
			alert("생년월일을 입력해주세요.")
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
	  //id
	  if(idresult == '2'){
		  alert("사용할수 없는 아이디 입니다. 확인해주세요.")
		  return false;
	  }else if(idresult == '3'){
		  alert("아이디 중복체크를 하지 않았습니다. 확인해주세요.")
		  return false;
	  }
	  
	  //pw
	  if(isPwValid == false ){
		  alert("8~20자의 영문, 숫자, 특수문자를 모두 포함한 비밀번호를 입력해주세요");
		  return false;
	  }else if(isPwValid == false && isPw2Valid == false){
		  alert("비밀번호를 다시 한번 확인해주세요.")
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
	  
	  alert('회원가입이 완료되었습니다.');
	  
	  form.submit();
}
	function mainPage() {
		location.href="${path}";
	}

</script>
</html>