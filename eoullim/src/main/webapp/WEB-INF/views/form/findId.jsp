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
	<title>아이디 찾기</title>
</head>
<body>
	<div class="form-logo">
		<img src="${path}/resources/img/logos/eoulrim_logo_p.png">
	</div>
	<section class="form-section">
		<div class="form-container">
			<form class="find-form" action="" method="post">
				<label class="find-form__label">이름</label>
				<input class="find-form__input" type="text" id="findmemName" value="강승호">
	
				<label class="find-form__label">생년월일</label>
				<div class="" id="info__birth">
					<div class="join-form-flex">
					 <select class="find-form-inline__input" id="birth-year" name="year">
				     	 <option selected value="">출생 연도</option>
			    	</select>
				    <select class="find-form-inline__input" id="birth-month" name="month">
				      <option selected value="">월</option>
				    	</select>
				    <select class="find-form-inline__input" id="birth-day" name="day">
				    	  <option selected value="">일</option>
			   	 </select>
			   	 </div>
				  <div class="error-msg"></div>
				 </div>
				<label class="find-form__label">휴대전화</label>
				<input class="find-form__input" type="text" placeholder="핸드폰 번호" id="findmemPhone" value="01012345678">
				<p class="success-id-msg"></p>
				<div class="find-form-inline div-line">
						<button class="find-form__btn btn--grey" type="button" onclick="popClose();">취소</button>
						<button class="find-form__btn btn--purple" type="button" value="확인" onclick="findId();">아이디 찾기</button>
				</div>
			</form>
		</div>
	</section>
</body>
<script type="text/javascript">

	function popClose() {
		window.close();
	}
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
		function findId() {
			var  memberName = document.querySelector('#findmemName').value;
			var  memberBirth = document.querySelector('#birth-year').value;
			var  memberMonth= document.querySelector('#birth-month').value;
			var  memberDay = document.querySelector('#birth-day').value;
			var  phone = document.querySelector('#findmemPhone').value;
			
			
			if(memberMonth < 10){
				memberMonth = "0" + memberMonth;
			}
			
			if(memberDay < 10){
				memberDay = "0" + memberDay;
			}
			
			let birth = memberBirth + memberMonth +memberDay;
			
			if(memberName === undefined || memberName === ""){
				alert("이름을 입력해 주세요.");
				memberName.focus();
				return false;
			}
			if(birthYearEl.value ==="" || birthMonthEl.value ==="" || birthDayEl.value ===""){
				alert("생년월일을 선택해 주세요");
				return false;
			}
			
			if(phone === undefined || phone === ""){
				alert("전화번호를 입력해 주세요.");
				phone.focus();
				return false;
			}
			
			// 아이디 찾기 버튼 클릭 횟수
			let count = 0;
			
			$.ajax({
				url: "findId",
				method: "POST",
			    data : sendData = {"memberName" : memberName, "birth" : birth, "phone" : phone },
			    dataType : "json",
			    success : function(data) {
			    if(data.code === "noData"){
			    	// 아이디 찾기 실패했을 때 실행
			    	msg = "아이디를 찾을 수 없습니다.";
			    	fn_showMessage(msg);
			    	}else if (data.code==="success") {
			    		msg = "아이디는 " + data.id + " 입니다.";
				    	fn_showMessage(msg);	
			    	}else if(data.code === "noType"){
			    		msg = "해당 계정은 소셜 서비스로 가입한 계정입니다.";
				    	fn_showMessage(msg);
			    	}   
			     }
			    }) 
			function fn_showMessage(msg) {
				
				// 아이디 찾기가 한 번 실행되면 count가 1이됨.
				// 아이디 찾기를 한 번이라도 실행했을 경우, 기존 메시지 삭제함.
				if(count === 1) {
					result.innerHTML = "";
	    		}
			   
				let tag = "";
		    	
				let result = document.querySelector('.success-id-msg');
				
				tag = "<span style='color:#e23a3a;'>" + msg + "</span>";
				result.innerHTML = tag;
				
				// fn_showMessage() 실행되면 무조건 count 1씩 증가
				count++;
			}
		}
</script>

</html>