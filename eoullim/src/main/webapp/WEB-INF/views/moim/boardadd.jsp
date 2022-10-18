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
<script type="text/javascript">
	window.onload = function () {
		imgSelect.addEventListener("click", function (e) {
			moimImageSelect.click();
		});

		moimImageSelect.addEventListener("change", ajaxImageUpload);

		imgSelect.addEventListener('mouseover', () => {  //  mouseover 시 hover 클래스 추가
			hoverTarget.classList.add('hover__filter');
		});
		imgSelect.addEventListener('mouseout', () => {   //  mouseout 시 hover 클래스 삭제
			hoverTarget.classList.remove('hover__filter');
		});
	}

	function ajaxImageUpload(e) {

		var file = e.target.files[0];
		var fData = new FormData(); //파일객체정보를 만들어서 추가해서 보내줄필요가잇음
		fData.append("moimimage", file, file.name);
		fData.append("id", "${moimData.moimId}"); // enctype="multipart/form-data" 형식으로 할떄는 FormData에 데이터 다 넣어줘야함!
		$.ajax({      //Ajax사용시 jquery필요
			type: "post",
			enctype: "multipart/form-data",
			url: "/somoim/moim/imageUpload",
			data: fData,
			dataType: "json",
			processData: false, //Ajax로 파일업로드시 필요
			contentType: false, //Ajax로 파일업로드시 필요
			success: function (data, status) {
				previewImage.src = data.url; //Ajax를통해 알아온경로로 너의src속성을바꿔라

			}
		});

	}
</script>

<script type="text/javascript">


	function joinCheck(moimId){
		$.ajax({
			url: "/somoim/moim/join",
			type: "get",
			data: {
				id: moimId
			},
			dataType: "json",
			success: function (data) {
				if(data.code === "alreadyJoinMember"){
					alert(data.message);
					location.href = "/somoim/moim/board?id="+ ${moimData.moimId};
				}else if(data.code === "over"){
					alert(data.message);
					location.href = "/somoim/moim/board?id=" + ${moimData.moimId};
				} else if (data.code === "success") {
					alert(data.message);
					location.href = "/somoim/moim/board?id=" + ${moimData.moimId};
				}else if(data.code === "joinCountover"){
					alert(data.message);
					location.href = "/somoim/moim/board?id="+ ${moimData.moimId};
				}
			}
		})
	}

</script>


<script type="text/javascript">


	function leaveCheck(moimId){
		$.ajax({
			url: "/somoim/moim/leave",
			type: "get",
			data: {
				id: moimId
			},
			dataType: "json",
			success: function (data) {
				if(data.code === "bossMember"){
					alert(data.message);
					location.href = "/somoim/moim/board?id="+ ${moimData.moimId};
				}else if (data.code === "success") {
					alert(data.message);
					location.href = "/somoim/moim/board?id=" + ${moimData.moimId};
				}else if(data.code === "alreadyleaveMember"){
					alert(data.message);
					location.href = "/somoim/moim/board?id="+ ${moimData.moimId};
				}
			}
		})
	}

</script>


<script type="text/javascript">


	function bookmarkAdd(moimId,memberId){  //북마크추가
		$.ajax({
			url: "/somoim/moim/bookmarkAdd",
			type: "get",
			data: {
				id:moimId,
				memberId:memberId
			},
			dataType: "json",
			success: function(data){
				if(data.code === "bookmarkover"){
					alert(data.message);
					location.href = "/somoim/moim/board?id="+ ${moimData.moimId};
				}else if(data.code === "alreadybookmark"){
					alert(data.message);
					location.href = "/somoim/moim/board?id="+ ${moimData.moimId};
				}else if(data.code === "bookmarked"){
					alert(data.message);
					location.href = "/somoim/moim/board?id="+ ${moimData.moimId};
				}else if(data.code === "error"){
					alert(data.message);
					location.href = "/somoim/moim/board?id="+ ${moimData.moimId};
				}
			}
		})
	}

</script>

<script type="text/javascript">


	function bookmarkDelete(moimId,memberId){ //북마크 삭제
		$.ajax({
			url: "/somoim/moim/bookmarkDelete",
			type: "get",
			data: {
				id:moimId,
				memberId:memberId
			},
			dataType: "json",
			success: function(data){
				if(data.code === "deletebookmark"){
					alert(data.message);
					location.href = "/somoim/moim/board?id="+ ${moimData.moimId};
				}else if(data.code === "alreadybookmarkdelete"){
					alert(data.message);
					location.href = "/somoim/moim/board?id="+ ${moimData.moimId};
				}else if(data.code === "nodetabookmark"){
					alert(data.message);
					location.href = "/somoim/moim/board?id="+ ${moimData.moimId};
				}else if(data.code === "error"){
					alert(data.message);
					location.href = "/somoim/moim/board?id="+ ${moimData.moimId};
				}
			}
		})
	}

</script>


<script type="text/javascript">


	function boardAddCheck(){
		$.ajax({
			url: "/somoim/moim/join",
			type: "get",
			data: {
				id: moimId
			},
			dataType: "json",
			success: function (data) {
				if(data.code === "alreadyJoinMember"){
					alert(data.message);
					location.href = "/somoim/moim/board?id="+ ${moimData.moimId};
				}else if(data.code === "over"){
					alert(data.message);
					location.href = "/somoim/moim/board?id=" + ${moimData.moimId};
				} else if (data.code === "success") {
					alert(data.message);
					location.href = "/somoim/moim/board?id=" + ${moimData.moimId};
				}else if(data.code === "joinCountover"){
					alert(data.message);
					location.href = "/somoim/moim/board?id="+ ${moimData.moimId};
				}
			}
		})
	}

</script>



<body>
<div class="logo" onclick="location.href='/somoim'"><img src="${path}/resources/img/logos/eoulrim_logo_w.png"></div>
<!-- 유저정보 -->
<header class="header">
	<!-- info image -->
	<div id="hoverTarget" class="header-img">
		<div id="imgSelect" class="img-grad-layer"></div>
		<div class="header-img">
			<form action="${moimUpdateImageUrl}" method="post" enctype="multipart/form-data">
				<img id="previewImage"
						 class="header-img__img"
						 alt="이미지 선택"
						 src="${moimData.moimImagePath}"
				/>
				<c:if test="${res.jobId eq 1}">
				<input id="moimImageSelect"
							 class="hidden"
							 type="file"
							 value="이미지 선택"
							 name="moimimage"
							 multiple
				/>
				</c:if>
		</div>
		</form>
	</div>

	<!-- 소모임 정보 -->
	<div class="header-info-box">
		<!-- 관심사 아이콘-->
		<div class="header-info-img">
			<div class="header-info-img__cate icon--circle">
				<c:choose>
					<c:when test="${moimData.categoryId eq 1 }">
						<i class="fa-solid fa-suitcase"></i>
					</c:when>
					<c:when test="${moimData.categoryId eq 2 }">
						<i class="fa-solid fa-person-swimming"></i>
					</c:when>
					<c:when test="${moimData.categoryId eq 3}">
						<i class="fa-solid fa-book"></i>
					</c:when>
					<c:when test="${moimData.categoryId eq 4}">
						<i class="fa-solid fa-language"></i>
					</c:when>
					<c:when test="${moimData.categoryId eq 5}">
						<i class="fa-solid fa-masks-theater"></i>
					</c:when>
					<c:when test="${moimData.categoryId eq 6}">
						<i class="fa-solid fa-music"></i>
					</c:when>
					<c:when test="${moimData.categoryId eq 7}">
						<i class="fa-solid fa-palette"></i>
					</c:when>
					<c:when test="${moimData.categoryId eq 8}">
						<i class="fa-solid fa-user-ninja"></i>
					</c:when>
					<c:when test="${moimData.categoryId eq 9}">
						<i class="fa-solid fa-hands"></i>
					</c:when>
					<c:when test="${moimData.categoryId eq 10}">
						<i class="fa-solid fa-handshake-simple"></i>
					</c:when>
					<c:when test="${moimData.categoryId eq 11}">
						<i class="fa-solid fa-car"></i>
					</c:when>
					<c:when test="${moimData.categoryId eq 12}">
						<i class="fa-brands fa-youtube"></i>
					</c:when>
					<c:when test="${moimData.categoryId eq 13}">
						<i class="fa-solid fa-baseball-bat-ball"></i>
					</c:when>
					<c:when test="${moimData.categoryId eq 14}">
						<i class="fa-solid fa-gamepad"></i>
					</c:when>
					<c:when test="${moimData.categoryId eq 15}">
						<i class="fa-solid fa-utensils"></i>
					</c:when>
					<c:when test="${moimData.categoryId eq 16}">
						<i class="fa-solid fa-dog"></i>
					</c:when>
					<c:when test="${moimData.categoryId eq 17}">
						<i class="fa-solid fa-hand-holding-heart"></i>
					</c:when>
					<c:otherwise>
						<i class="fa-solid fa-paper-plane"></i>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

		<!-- 상세 정보 -->
		<div class="header-info-detail">
			<div class="header-info__column">
					<span class="header-info-title">
						${moimData.moimTitle}
					</span>
			</div>
			<div class="header-info__column">
				<div class="icon__location">${moimData.locationName}</div>
				<span>${categoryName}</span>
				<span style="color: black">현재 ${currentMemberCount} / 정원 ${moimData.moimLimit}</span>
				<c:if test="${not empty over}">
					<span class="moim-limit-msg">현재 정원이 마감된 모임입니다.</span>
				</c:if>
			</div>
		</div>

		<div class="header-info-btn">
			<div class="headerinfo-btn__flex">
				<div>
					<c:choose>
						<c:when test="${bookmarkcheck eq 1 }">
							<button type="button" class="btn--icon btn--icon--big" onclick="bookmarkDelete(${moimData.moimId},'${sessionScope.loginData.memberId}')"><i class="fa-solid fa-heart"></i></button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn--icon btn--icon--big" onclick="bookmarkAdd(${moimData.moimId},'${sessionScope.loginData.memberId}')" ><i class="fa-regular fa-heart"></i></button>
						</c:otherwise>
					</c:choose>
				</div>
				<c:choose>
					<c:when test="${empty res && currentMemberCount < moimData.moimLimit}">
						<button type="button" class="btn--round btn--purple btn--w216" onclick="joinCheck(${moimData.moimId})">가입하기</button>
					</c:when>
					<c:when test="${currentMemberCount <= moimData.moimLimit}">
						<button type="button" class="btn--round btn--purple btn--w216" onclick="leaveCheck(${moimData.moimId})">탈퇴하기</button>
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>
</header>

<main class="main">
	<section class="col-8">
		<div class="main-box">
				<div class="main-box__add">
					<h4 class="board-add-title">게시글 작성</h4>
					<c:url var="boardAddUrl" value="/moim/board/add"/>
					<form id="form1" class="needs-validation" action="${boardAddUrl}?id=${moimId}" method="post">
						<div class="add-form">
							<input id="memberId" type="hidden" value="${sessionScope.loginData.memberId}">
							<div class="add-form__group">
								<span class="add-form__group-text" id="basic-addon1">작성자</span>
								<span class="add-form__group-text" id="basic-addon1">${sessionScope.loginData.memberName}</span>
							</div>
							<div class="add-form__group">
								<span class="add-form__group-text" id="basic-addon1">게시글 제목</span>
								<input id="boardTitle" type="text" class="add-form__input" placeholder="게시글 제목" name="boardTitle" aria-label="Username" aria-describedby="basic-addon1">
							</div>
							<div class="add-form__group">
								<span class="add-form__group-text">게시글 내용</span>
								<textarea class="add-form__input" style="height: 200px; resize:none;"  placeholder="게시글 내용" name="content" aria-label="With textarea"></textarea>
							</div>
							<div>
								<div class="add-form__btn">
								    <c:url var="boardUrl" value="/moim/board"/>
									<button class="btn--round btn--grey btn--w216" type="button" onclick="location.href='${boardUrl}?id=${moimData.moimId}'">취소</button>
									<button class="btn--round btn--purple btn--w216" type="button" onclick="titleChk(this.form);">작성</button> <!-- 목록으로 -->
								</div>
							</div>
						</div>
					</form>
				</div>
		</div>
	</section>
	<section class="col-3">
		<!-- 모임 정보 -->
		<div class="side-box">
			<div class="side-box-title">
				<span>모임 정보</span>
				<div>
					<c:if test="${res.jobId eq 1}"> <!-- 모임장만 편집버튼보이게하기 -->
						<button type="button" class="btn--letter"
										onclick="location.href='/somoim/moim/modify?id=${moimData.moimId}&test=1'">편집
						</button>
					</c:if>
					<c:if test="${res.jobId eq 1}"> <!-- 모임장만 삭제버튼보이게하기 -->
						<button type="button" class="btn--letter"
										data-bs-toggle="modal" data-bs-target="#removeModal">삭제
						</button>
					</c:if>
				</div>
			</div>
			<c:if test="${not empty moimParticipants}">
				<c:forEach items="${moimParticipants}" var="moimParticipants">
					<c:if test="${moimParticipants.jobId eq 1}">
						<div class="moim-member-info">
							<div class="moim-member__img">
								<img
										src="${moimParticipants.memberImagePath}"
										class="icon--circle icon--circle__member"
								/>
							</div>
							<div class="moim-member-detail">
								<div class="moim-member-detail__row">
									<span>${moimParticipants.jobName}</span>
								</div>
								<div class="moim-member-detail__row">
									<span>${moimParticipants.memberName}</span>
									<span class="icon__location icon__location--small">
											${moimParticipants.locationName}
									</span>
								</div>
							</div>
							<div id="${moimParticipants.memberId}" class="hidden"></div>
						</div>
					</c:if>
				</c:forEach>
			</c:if>
			<span class="moim-info__span">모임소개</span>
			<div class="moim-info">
				${moimData.moimInfo}
			</div>
		</div>
		<!-- 모임장정보 -->

		<!-- 모임 멤버 -->
		<div class="side-box">
			<div class="side-box-title">
				<span>모임 멤버</span>
				<c:if test="${res.jobId eq 1}"> <!-- 모임장만 편집버튼보이게하기 -->
					<button type="button" class="btn--letter" onclick="popModJob(${moimData.moimId});">편집</button>
				</c:if>
			</div>
			<div class="side-box-main scroll scroll-h340">
				<c:if test="${not empty moimParticipants}">
					<c:forEach items="${moimParticipants}" var="moimParticipants">
						<div class="moim-member-info">
							<div class="moim-member__img">
								<img
										src="${moimParticipants.memberImagePath}"
										class="icon--circle icon--circle__member"
								/>
							</div>
							<div class="moim-member-detail">
								<div class="moim-member-detail__row">
									<span>${moimParticipants.jobName}</span>
								</div>
								<div class="moim-member-detail__row">
									<span>${moimParticipants.memberName}</span>
									<span class="icon__location icon__location--small">
											${moimParticipants.locationName}
									</span>
								</div>
							</div>
							<div id="${moimParticipants.memberId}" class="hidden"></div>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</section>
</main>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
  </script>
  <script type="text/javascript">
		function titleChk(form) {
			if(form.boardTitle.value.trim() === "" ){ //빈값확인하기 ,비어져있으면 경고메세지
				alert("게시글 제목을 입력하세요");
			}else if(form.content.value.length > 650){
				alert("게시글 내용이 너무 깁니다");
			}	else{
				form.submit(); //아니면 submit하기
			}

		}
		function addData(){
			var formData = $("#form1").serialize();
			$.ajax({
				url: "add",
				type: "POST",
				data: formData,
				dataType: "json",
				success: function(data) {
					location.href = '/somoim';
				}
			})	
		}
		function list() {
			location.href = '/somoim';
		}
		
		function get_board_join_moim_list() {
			$.ajax({
				url:  "./add/board_join_list",
				type: "GET",
				dataType: "json",
				success: function(data) {
					let _html = '';
					for (var i=0 ; i < data.length ; i++) {
						_html += ' <a href="/somoim/moim/meeting?id='+ data[i].moimId +'"><p class="pb-3">'+ data[i].moimTitle +'</p></a>';
					}
					$('#board_join_list').html(_html);
				}
			});
		}

		function get_board_bmk_moim_list() {
			$.ajax({
				url:  "./add/board_bookmark_list",
				type: "GET",
				dataType: "json",
				success: function(data) {
					let _html = '';
					for (var i=0 ; i < data.length ; i++) {
						_html += ' <a href="/somoim/moim/meeting?id='+ data[i].moimId +'"><p class="pb-3">'+ data[i].moimTitle +'</p></a>';
					}
					$('#board_bookmark_list').html(_html);
				}
			});
		}
		$(document).ready(function(){
			get_board_join_moim_list()
			get_board_bmk_moim_list()
		});
	</script>
	<script src="${path}/resources/js/category.js"></script>
	<script src="${path}/resources/js/components/popup.js"></script>
	<script src="${path}/resources/js/moim.js"></script>
</body>
</html>