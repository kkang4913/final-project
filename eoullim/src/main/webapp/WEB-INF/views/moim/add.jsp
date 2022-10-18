
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:url var="img" value="/resources/img/somoim"/>
<head>
  <!-- Required meta tags -->
  <meta charset="UTF-8">
  <!-- 모바일로 확인시 크기조절 -->
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
    integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
    crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="${path}/resources/css/styles.css">
  <script type="text/javascript" src="${path}/resources/js/jquery-3.6.0.min.js"></script>
  <title>소모임</title>
</head>

<body>
<div class="logo" onclick="location.href='/somoim'"><img src="${path}/resources/img/logos/eoulrim_logo_p.png"></div>
<header>
</header>
<main class="main">
	<section class="col-8">
		<div class="main-box">
			<h4 class="board-add-title">모임 개설</h4>
			<form id="form1" class="add-form" method="post">
				<div>
					<h1 class="board-add__label"> 관심사 선택&nbsp;<small style="font-size: 12px; color: red;">*필수</small></h1>
					<div class="mb-3">
						<button class="btn btn--purple" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
							관심 카테고리 더보기
						</button>
					</div>
					<div class="collapse" id="collapseExample">
						<div class="card card-body mb-3" >
							<section class="d-flex" >
								<div class="col">
									<div class="row d-plex flex-direction-column" >
										<div class="add-cate-list">
											<div class="icon__div">
												<div id="cate_1" class="icon--circle icon--circle__cate">
													<input type="radio" name="categoryId" value="1" style="display:none"/>
													<i class="fa-solid fa-suitcase"></i>
												</div>
												<span>아웃도어/여행</span>
											</div>
											<div class="icon__div">
												<div id="cate_2" class="icon--circle icon--circle__cate">
													<input type="radio" name="categoryId" value="2" style="display:none"/>
													<i class="fa-solid fa-person-swimming"></i>
												</div>
												<span>운동/스포츠</span>
											</div>
											<div class="icon__div">
												<div id="cate_3" class="icon--circle icon--circle__cate">
													<input type="radio" name="categoryId" value="3" style="display:none"/>
													<i class="fa-solid fa-book"></i>
												</div>
												<span>인문학/책/글</span>
											</div>
											<div class="icon__div">
												<div id="cate_4" class="icon--circle icon--circle__cate">
													<input type="radio" name="categoryId" value="4" style="display:none"/>
													<i class="fa-solid fa-language"></i>
												</div>
												<span>외국/언어</span>
											</div>
											<div class="icon__div">
												<div id="cate_5" class="icon--circle icon--circle__cate">
													<input type="radio" name="categoryId" value="5" style="display:none"/>
													<i class="fa-solid fa-masks-theater"></i>
												</div>
												<span>문화/공연/축제</span>
											</div>
											<div class="icon__div">
												<div id="cate_6" class="icon--circle icon--circle__cate">
													<input type="radio" name="categoryId" value="6" style="display:none"/>
													<i class="fa-solid fa-music"></i>
												</div>
												<span>음악/악기</span>
											</div>
											<div class="icon__div">
												<div id="cate_7" class="icon--circle icon--circle__cate">
													<input type="radio" name="categoryId" value="7" style="display:none"/>
													<i class="fa-solid fa-palette"></i>
												</div>
												<span>공예/만들기</span>
											</div>
											<div class="icon__div">
												<div id="cate_8" class="icon--circle icon--circle__cate">
													<input type="radio" name="categoryId" value="8" style="display:none"/>
													<i class="fa-solid fa-user-ninja"></i>
												</div>
												<span>댄스/무용</span>
											</div>
											<div class="icon__div">
												<div id="cate_9" class="icon--circle icon--circle__cate">
													<input type="radio" name="categoryId" value="9" style="display:none"/>
													<i class="fa-solid fa-hands"></i>
												</div>
												<span>봉사활동</span>
											</div>
										</div>
										<div class="add-cate-list">
											<div class="icon__div">
												<div id="cate_10" class="icon--circle icon--circle__cate">
													<input type="radio" name="categoryId" value="10" style="display:none"/>
													<i class="fa-solid fa-handshake-simple"></i>
												</div>
												<span>사교/인맥</span>
											</div>
											<div class="icon__div">
												<div id="cate_11" class="icon--circle icon--circle__cate">
													<input type="radio" name="categoryId" value="11" style="display:none"/>
													<i class="fa-solid fa-car"></i>
												</div>
												<span>차/오토바이</span>
											</div>
											<div class="icon__div">
												<div id="cate_12" class="icon--circle icon--circle__cate">
													<input type="radio" name="categoryId" value="12" style="display:none"/>
													<i class="fa-brands fa-youtube"></i>
												</div>
												<span>사진/영상</span>
											</div>
											<div class="icon__div">
												<div id="cate_13" class="icon--circle icon--circle__cate">
													<input type="radio" name="categoryId" value="13" style="display:none"/>
													<i class="fa-solid fa-baseball-bat-ball"></i>
												</div>
												<span>야구관람</span>
											</div>
											<div class="icon__div">
												<div id="cate_14" class="icon--circle icon--circle__cate">
													<input type="radio" name="categoryId" value="14" style="display:none"/>
													<i class="fa-solid fa-gamepad"></i>
												</div>
												<span>게임/오락</span>
											</div>
											<div class="icon__div">
												<div id="cate_15" class="icon--circle icon--circle__cate">
													<input type="radio" name="categoryId" value="15" style="display:none"/>
													<i class="fa-solid fa-utensils"></i>
												</div>
												<span>요리/체조</span>
											</div>
											<div class="icon__div">
												<div id="cate_16" class="icon--circle icon--circle__cate">
													<input type="radio" name="categoryId" value="16" style="display:none"/>
													<i class="fa-solid fa-dog"></i>
												</div>
												<span>반려동물</span>
											</div>
											<div class="icon__div">
												<div id="cate_17" class="icon--circle icon--circle__cate">
													<input type="radio" name="categoryId" value="17" style="display:none"/>
													<i class="fa-solid fa-hand-holding-heart"></i>
												</div>
												<span>가족/결혼</span>
											</div>
											<div class="icon__div">
												<div id="cate_18" class="icon--circle icon--circle__cate">
													<input type="radio" name="categoryId" value="18" style="display:none"/>
													<i class="fa-solid fa-paper-plane"></i>
												</div>
												<span>자유주제</span>
											</div>
										</div>
									</div>
								</div>
							</section>
						</div>
					</div>
					<div class="add-form__group">
						<span class="add-form__group-text" id="basic-addon1">모임명&nbsp;<small style="font-size: 12px; color: red;">*필수</small></span>
						<input type="text" class="add-form__input" placeholder="모임 이름" name="moimTitle" aria-label="Username" aria-describedby="basic-addon1">
					</div>
					<div class="add-form__group">
						<span class="add-form__group-text">모임 설명</span>
						<textarea class="add-form__input" style="height: 200px; resize:none;"  placeholder="최대 300자" name="moimInfo" aria-label="With textarea"></textarea>
					</div>
					<div>
						<div class="add-form__two-group">
							<div class="add-form__group"></div>
							<div class="add-form__group test-group">
								<span class="add-form__group-text" id="basic-addon1">정원(5~300명)</span>
								<input type="text" class="add-form__input" placeholder="정원수" name="moimLimit" aria-label="Username" aria-describedby="basic-addon1" value="5">
							</div>
								<div class="add-form__group test-group">
									<span class="add-form__group-text">지역&nbsp;<small style="font-size: 12px; color: red;">*필수</small></span>
									<select id ="location" name="locationId" class="form-select add-form__select" aria-label=".form-select-lg example">
										<option selected value="">지역 선택</option>
										<c:forEach var="locList" items="${requestScope.locDatas}">
											<option value="${locList.locationId}">${locList.locationName}</option>
										</c:forEach>
									</select>
								</div>
							</div>
						<div class="add-form__btn">
							<button class="btn--round btn--w216 btn--grey" type="button" onclick="list();">목록</button>
							<button class="btn--round btn--w216 btn--purple" type="button" onclick="addData();">만들기</button>
						</div>
					</div>
				</div>
			</form>
		</div>
		</div>
	</section>
	<section class="col-3">
		<div class="side-box side-box-flex">
			<div class="login-member__img" onclick="location.href='/somoim/info/myInfo'">
				<img
						src="${sessionScope.loginData.memberImagePath}"
						class="icon--circle icon--circle__member"
				/>
			</div>
			<div class="login-member-info">
				<div class="login-member-header">
					<div class="login-member-detail" onclick="location.href='/somoim/info/myInfo'">
						<c:if test="${not empty sessionScope.loginData}">
								<span class="icon__location icon__location--small">
										${sessionScope.loginData.locationName}
								</span>
							<span>${sessionScope.loginData.memberName}</span>
						</c:if>
					</div>
					<div class="login-member-btn">
						<c:if test="${empty sessionScope.loginData}">
							<button type="button" class="btn--letter" onclick="location.href='logout'" >로그아웃</button>
						</c:if>
						<c:if test="${not empty sessionScope.loginData}">
							<button type="button" class="btn--letter" onclick="location.href='${path}/login/kakao/kakaoLogout'" >로그아웃</button>
						</c:if>
						<button type="button" class="btn--letter" onclick="popCategory();">관심사 변경</button>
					</div>
				</div>
				<div id="cate" class="info-category-list">
					<c:if test="${not empty sessionScope.loginData}">
						<script>
							window.onload = () => {
								addEventListener("DOMContentLoaded", printSmallCate("${sessionScope.loginData.category}"));
							};
						</script>
					</c:if>
				</div>
			</div>
		</div>
		<div class="dropdown__join-moim">
			<div id="joinMoimDropdownHeader" class="dropdown-header">
				<span>가입한 모임</span>
				<div id="joinMoimDropdownBtn" class="dropdown-btn">
					<i class="fa-solid fa-angle-down"></i>
				</div>
			</div>
			<div id="joinMoimDropdownContent" class="hidden dropdown-content">
				<div id="join_list">
				</div>
			</div>
		</div>
		<div class="dropdown__join-moim">
			<div id="bookMarkDropdownHeader" class="dropdown-header">
				<span>찜한 모임</span>
				<div id="bookMarkDropdownBtn" class="dropdown-btn">
					<i class="fa-solid fa-angle-down"></i>
				</div>
			</div>
			<div id="bookMarkDropdownContent" class="hidden dropdown-content">
				<div id="bookmark_list">
				</div>
			</div>
		</div>
	</section>
</main>
<%--  <div class="wrap p-5">--%>

    <!-- main -->
    <!--
    	 container :  margin: 1rem 5rem;
		 pt-3 : padding top : 1rem !important
    	 px-0 : padding-right: 0!important   padding-left: 0!important;
     -->
<%--    <main class="container pt-3 px-0">--%>
<%--      <div class="row"> --%>
<%--		<!-- add menu -->--%>
<%--		 <div class="col-md-9">--%>
<%--			<div class="p-4 rounded-3 shadow-sm bg-white" style="height: 100%;">--%>
<%--				<h4 class="mb-3">모임 개설</h4>--%>
<%--					<form id="form1" class="needs-validation" method="post">--%>
<%--						<div>--%>
<%--							<label for="loction" class="form-label">지역&nbsp;<small style="font-size: 12px; color: red;">*필수</small></label>	--%>
<%--								<select id ="location" name="locationId" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">--%>
<%--								  <option selected value="">지역 선택</option>--%>
<%--								  <c:forEach var="locList" items="${requestScope.locDatas}">--%>
<%--								  	<option value="${locList.locationId}">${locList.locationName}</option>--%>
<%--								  </c:forEach>--%>
<%--								</select>--%>
<%--					     	</div>--%>
<%--				           	<div>--%>
<%--				             	<h1 class="mb-3"> 관심사 선택&nbsp;<small style="font-size: 12px; color: red;">*필수</small></h1>--%>
<%--				             	<p class="mb-3">--%>
<%--								  <button class="btn btn-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">--%>
<%--								    관심 카테고리 더보기--%>
<%--								  </button>--%>
<%--								</p>--%>
<%--								<div class="collapse" id="collapseExample">--%>
<%--									  <div class="card card-body mb-3" >--%>
<%--				      					<section class="d-flex" >--%>
<%--					              		  <div class="col">--%>
<%--				              				<div class="row" >--%>
<%--								              <div class="col-3 d-flex flex-column justify-content-center align-items-center" >--%>
<%--icon--circle icon--circle__cate--%>
<%--								            		<input type="radio"  name="categoryId" value="1" style="display:none"/>--%>
<%--								             		<i class="fa-solid fa-suitcase"></i>--%>
<%--								          		</div>--%>
<%--								          		 <span>아웃도어/여행</span>--%>
<%--icon--circle icon--circle__cate--%>
<%--									        		<input type="radio"  name="categoryId" value="2" style="display:none"/>--%>
<%--									            	<i class="fa-solid fa-person-swimming"></i>--%>
<%--									          	</div>--%>
<%--									          	<span>운동/스포츠</span>--%>
<%--icon--circle icon--circle__cate--%>
<%--									          		<input type="radio"  name="categoryId" value="3" style="display:none" />--%>
<%--									            	<i class="fa-solid fa-book"></i>--%>
<%--									          	</div>--%>
<%--									          	<span>인문학/책/글</span>--%>
<%--icon--circle icon--circle__cate--%>
<%--									          		<input type="radio"  name="categoryId" value="4" style="display:none"/>--%>
<%--									            	<i class="fa-solid fa-language"></i>--%>
<%--									          	</div>--%>
<%--									          	<span>외국/언어</span>--%>
<%--icon--circle icon--circle__cate--%>
<%--									          		<input type="radio"  name="categoryId" value="5" style="display:none"/>--%>
<%--									            	<i class="fa-solid fa-masks-theater"></i>--%>
<%--									          	</div>--%>
<%--									          	<span>문화/공연/축제</span>--%>
<%--								          	</div>	--%>
<%--								          	<div class="col-3 d-flex flex-column justify-content-center align-items-center" >--%>
<%--icon--circle icon--circle__cate--%>
<%--									          		<input type="radio"  name="categoryId" value="6"style="display:none"/>--%>
<%--									            	<i class="fa-solid fa-music"></i>--%>
<%--									          	</div>--%>
<%--									          	<span>음악/악기</span>--%>
<%--icon--circle icon--circle__cate--%>
<%--									          		<input type="radio"  name="categoryId" value="7" style="display:none"/>--%>
<%--								            		<i class="fa-solid fa-palette"></i>--%>
<%--								          		</div>--%>
<%--								          		<span>공예/만들기</span>--%>
<%--icon--circle icon--circle__cate--%>
<%--								          			 <input type="radio"  name="categoryId" value="8" style="display:none"/>--%>
<%--								           			 <i class="fa-solid fa-user-ninja"></i>--%>
<%--								          		</div>--%>
<%--								         		 <span>댄스/무용</span>--%>
<%--icon--circle icon--circle__cate--%>
<%--								         		 	 <input type="radio"  name="categoryId" value="9" style="display:none"/>--%>
<%--								          			 <i class="fa-solid fa-hands"></i>--%>
<%--								          		</div>--%>
<%--								          		<span>봉사활동</span>--%>
<%--icon--circle icon--circle__cate--%>
<%--								          			<input type="radio"  name="categoryId" value="10" style="display:none"/>--%>
<%--								            		<i class="fa-solid fa-handshake-simple"></i>--%>
<%--								          		</div>--%>
<%--								          		<span>사교/인맥</span>--%>
<%--								          	</div>--%>
<%--								          	<div class="col-3 d-flex flex-column justify-content-center align-items-center" >--%>
<%--icon--circle icon--circle__cate--%>
<%--								          			<input type="radio"  name="categoryId" value="11" style="display:none"/>--%>
<%--								            		<i class="fa-solid fa-car" ></i>--%>
<%--								          		</div>--%>
<%--								          		<span>차/오토바이</span>--%>
<%--icon--circle icon--circle__cate--%>
<%--								          			<input type="radio"  name="categoryId" value="12" style="display:none"/>--%>
<%--								            		<i class="fa-brands fa-youtube"></i>--%>
<%--								          		</div>--%>
<%--								          		<span>사진/영상</span>--%>
<%--icon--circle icon--circle__cate--%>
<%--								          			<input type="radio"  name="categoryId" value="13" style="display:none"/>--%>
<%--								            		<i class="fa-solid fa-baseball-bat-ball"></i>--%>
<%--								          		</div>--%>
<%--								          		<span>야구관람</span>--%>
<%--icon--circle icon--circle__cate--%>
<%--								          			<input type="radio"  name="categoryId" value="14" style="display:none"/>--%>
<%--								            		<i class="fa-solid fa-gamepad"></i>--%>
<%--								          		</div>--%>
<%--								          		<span>게임/오락</span>--%>
<%--icon--circle icon--circle__cate--%>
<%--								          			<input type="radio"  name="categoryId" value="15" style="display:none"/>--%>
<%--								            		<i class="fa-solid fa-utensils"></i>--%>
<%--								          		</div>--%>
<%--								          		<span>요리/체조</span>--%>
<%--								          	</div>	--%>
<%--								          	<div class="col-3 d-flex flex-column justify-content-center align-items-center" >	--%>
<%--icon--circle icon--circle__cate--%>
<%--								          			<input type="radio"  name="categoryId" value="16" style="display:none"/>--%>
<%--								            		<i class="fa-solid fa-dog"></i>--%>
<%--								          		</div>--%>
<%--								          		<span>반려동물</span>--%>
<%--icon--circle icon--circle__cate--%>
<%--								          			<input type="radio"  name="categoryId" value="17" style="display:none"/>--%>
<%--								            		<i class="fa-solid fa-hand-holding-heart"></i>--%>
<%--								          		</div>--%>
<%--								          		<span>가족/결혼</span>--%>
<%--								          			<input type="radio"  name="categoryId" value="18" style="display:none"/>--%>
<%--icon--circle icon--circle__cate--%>
<%--								            		<i class="fa-solid fa-paper-plane"></i>--%>
<%--								          		</div>--%>
<%--								          		<span>자유주제</span>--%>
<%--								        	</div>--%>
<%--								          </div>--%>
<%--					                  </div>--%>
<%--				      		   </section>--%>
<%--				  			</div>--%>
<%--						</div>--%>
<%--				  			<div class="input-group mb-3">--%>
<%--							  <span class="input-group-text" id="basic-addon1">모임명&nbsp;<small style="font-size: 12px; color: red;">*필수</small></span>--%>
<%--							  <input type="text" class="form-control" placeholder="모임 이름" name="moimTitle" aria-label="Username" aria-describedby="basic-addon1">--%>
<%--							</div>--%>
<%--							 <div class="input-group mb-3">--%>
<%--							  <span class="input-group-text">모임 설명</span>--%>
<%--							  <textarea class="form-control" style="height: 200px; resize:none;"  placeholder="최대 300자" name="moimInfo" aria-label="With textarea"></textarea>--%>
<%--							</div>--%>
<%--							<div> --%>
<%--								<section class="d-flex">--%>
<%--								 	<div class="col-md-8">--%>
<%--								 	</div>--%>
<%--								 	<div class="col input-group mb-3">--%>
<%--				 					  	<span class="input-group-text" id="basic-addon1">정원(5~300명)</span>--%>
<%--							 			 <input type="text" class="form-control" placeholder="정원수" name="moimLimit" aria-label="Username" aria-describedby="basic-addon1">--%>
<%--								 	</div>--%>
<%--							 	</section>--%>
<%--							 	<div class="d-grid gap-2 col-5 mx-auto">--%>
<%--				  					<button class="btn btn-primary" type="button" onclick="addData();">만들기</button>--%>
<%--				  					<button class="btn btn-primary" type="button" onclick="list();">목록</button>--%>
<%--								</div>--%>
<%--							</div>--%>
<%--						</div>--%>
<%--					</form>--%>
<%--				</div>--%>
<%--			</div>--%>

<%--	</div>--%>
<%--    </main>--%>
    <!-- // main -->
<%--  </div>--%>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
 </script>
	<script src="${path}/resources/js/components/dropdown.js"></script>
	<script src="${path}/resources/js/category.js"></script>
	<script src="${path}/resources/js/components/popup.js"></script>
<script type="text/javascript">
  
function addData(){
	if($('input[name="categoryId"]:checked').val() == null || $('input[name="categoryId"]:checked').val() == "" ){
		alert("관심사를 선택하세요.");
		return; 
	}
	if($('input[name="moimTitle"]').val() == null || $('input[name="moimTitle"]').val() == ""){
		alert("모임명을 작성하세요.");
		return;
	}
	if($('#location').val() == null || $('#location').val() == "" ) {
		alert("지역을 선택하세요.");
		return; 
	}
	if($('input[name="moimLimit"]').val() > 300 || $('input[name="moimLimit"]').val() < 5){
		alert("모임은 정원 5~300명 사이에서만 개설할 수 있습니다.");
		return;
	}
	var formData = $("#form1").serialize();
	$.ajax({
		url: "add",
		type: "POST",
		data: formData,
		dataType: "json",
		success: function(data) {
			if(data.data){
				location.href = '/somoim';
			}else{
				alert(data.message);
			}	
		}
		
	})	
}

function list() {
	location.href = '/somoim';
}

function get_join_moim_list() {
	$.ajax({
		url:  "/somoim/join_list",
		type: "GET",
		dataType: "json",
		success: function(data) {
			let _html = '';
			for (var i=0 ; i < data.length ; i++) {
				_html += ' <div><a href="/somoim/moim/meeting?id='+ data[i].moimId +'"><span>'+ data[i].moimTitle +'</span></a></div>';
			}
			$('#join_list').html(_html);
		}
	});
}

function get_bmk_moim_list() {
	$.ajax({
		url:  "/somoim/bookmark_list",
		type: "GET",
		dataType: "json",
		success: function(data) {
			let _html = '';
			for (var i=0 ; i < data.length ; i++) {
				_html += ' <div><a href="/somoim/moim/meeting?id='+ data[i].moimId +'"><span>'+ data[i].moimTitle +'</span></a></div>';
			}
			$('#bookmark_list').html(_html);
		}
	});
}

$(document).ready(function() {
	get_join_moim_list();
	get_bmk_moim_list();
	
	
	 $('.icon--circle__cate').on('mouseover', function() {
		$(this).addClass('hoverIcon');
	 });
	 $('.icon--circle__cate').on('mouseout', function() {
		$(this).removeClass('hoverIcon');
	 });	
		
	 $('.icon--circle__cate').on('click', function(){
		_this = $(this)
		_this.children('input').prop('checked', true);
		if (_this.hasClass('selected') == false) {
			_this.addClass('selected');	
		} else {
			_this.removeClass('selected');
			$('input[name="categoryId"]').prop('checked',false);
		}
	$('.icon--circle__cate').each(function() {
		if (_this.children('input').val() != $(this).children('input').val()) {
			$(this).removeClass('selected');
		} 
		});
	 });
});

</script>
</body>
</html>