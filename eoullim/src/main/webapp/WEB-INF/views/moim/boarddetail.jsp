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
  
  <title>상세 게시판</title>
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
				id:moimId
			},
			dataType: "json",
			success: function(data){
				if(data.code === "alreadyJoinMember"){
					alert(data.message);
					location.href = "/somoim/moim/meeting?id="+ ${moimData.moimId};
				}else if(data.code === "over"){
					alert(data.message);
					location.href = "/somoim/moim/meeting?id="+ ${moimData.moimId};
				}else if(data.code === "success"){
					alert(data.message);
					location.href = "/somoim/moim/meeting?id="+ ${moimData.moimId};
				}else if(data.code === "joinCountover"){
					alert(data.message);
					location.href = "/somoim/moim/meeting?id="+ ${moimData.moimId};

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
				id:moimId
			},
			dataType: "json",
			success: function(data){
				if(data.code === "bossMember"){
					alert(data.message);
					location.href = "/somoim/moim/meeting?id="+ ${moimData.moimId};
				}else if(data.code === "success"){
					alert(data.message);
					location.href = "/somoim/moim/meeting?id="+ ${moimData.moimId};
				}else if(data.code === "alreadyleaveMember"){
					alert(data.message);
					location.href = "/somoim/moim/meeting?id="+ ${moimData.moimId};

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
					location.href = "/somoim/moim/meeting?id="+ ${moimData.moimId};
				}else if(data.code === "alreadybookmark"){
					alert(data.message);
					location.href = "/somoim/moim/meeting?id="+ ${moimData.moimId};
				}else if(data.code === "bookmarked"){
					alert(data.message);
					location.href = "/somoim/moim/meeting?id="+ ${moimData.moimId};
				}else if(data.code === "error"){
					alert(data.message);
					location.href = "/somoim/moim/meeting?id="+ ${moimData.moimId};
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
					location.href = "/somoim/moim/meeting?id="+ ${moimData.moimId};
				}else if(data.code === "alreadybookmarkdelete"){
					alert(data.message);
					location.href = "/somoim/moim/meeting?id="+ ${moimData.moimId};
				}else if(data.code === "nodetabookmark"){
					alert(data.message);
					location.href = "/somoim/moim/meeting?id="+ ${moimData.moimId};
				}else if(data.code === "error"){
					alert(data.message);
					location.href = "/somoim/moim/meeting?id="+ ${moimData.moimId};
				}
			}
		})
	}

</script>

<script>
   
  function deleteBoard(boardId,moimId){
	  	$.ajax({
    		url: "/somoim/moim/board/delete",
    		type: "get",
    		data: {
    			bid:boardId,
    			id:moimId
    		},
    		dataType: "json",
    		success: function(data){
    			if(data.code === "alreadyDelete"){
    				alert(data.message);
    				location.href = "/somoim/moim/board?id="+ ${data.moimId};
    			}else if(data.code === "success"){
    				alert(data.message);
    				location.href = "/somoim/moim/board?id="+ ${data.moimId};
    			}else if(data.code === "error"){
        			alert(data.message);
        			location.href = "/somoim/moim/board?id="+ ${data.moimId};
    			}
    			else if(data.code === "leaveMember"){
        			alert(data.message);
        			location.href = "/somoim/moim/board?id="+ ${data.moimId};
    			}
    		}
    	})
    }

</script>

 <script type="text/javascript">


  function commentDelete(commentId,moimId){
	  
	  
	  	$.ajax({
    		url: "/somoim/moim/board/comment/delete",
    		type: "get",
    		data: {
    			id:moimId,
    			cid:commentId
    		},
    		dataType: "json",
    		success: function(data){
    			if(data.code === "alreadyDelete"){
    				alert(data.message);
    				location.href = "/somoim/moim/boardDetail?id="+ ${data.moimId}+"&boardId="+${data.boardId};
    			}else if(data.code === "success"){
    				alert(data.message);
        			location.href = "/somoim/moim/boardDetail?id="+ ${data.moimId}+"&boardId="+${data.boardId};
    			}else if(data.code === "error"){
    				alert(data.message);
        			location.href = "/somoim/moim/boardDetail?id="+ ${data.moimId}+"&boardId="+${data.boardId};
                }else if(data.code === "leaveMember"){
    				alert(data.message);
        			location.href = "/somoim/moim/boardDetail?id="+ ${data.moimId}+"&boardId="+${data.boardId};
                }
    			
            }
        })
    }



	function changeEdit(element){
		element.innerText="확인"; //수정버튼을 확인버튼으로 변경
		element.parentElement.nextElementSibling.children[0].remove(); //삭제버튼은 없애기

		var value = element.parentElement.parentElement.parentElement.children[1].innerText; //<p>태그의 text를 value에 저장
		var textarea = document.createElement("textarea"); //<textarea>엘리먼트 생성
		textarea.setAttribute("class","form-control");
		textarea.value = value; //<textarea>에 기존 <p>태그에 있던 value값 넣어주기

		element.parentElement.parentElement.parentElement.children[1].innerText=""; //<p>안에를 공백으로 하고 그안에 아래코드 삽입 (디자인이 깨지기 때문에 )
		element.parentElement.parentElement.parentElement.children[1].prepend (textarea); //<p>태그안에 textarea 엘리먼트 삽입 prepend:요소내부의 시작부분에 삽입

		element.setAttribute("onclick","commentUpdate(this);"); //클릭하면commentUpdate 기능이 동작  --> 자바스크립트로 하는 경우  --> 걍 브라우져에서 변한것만보임
	}                                                           //commentUpdate(this) 기능이 동작  --> ajax사용 --> 서버에서 처리

	function changeText(element){//수정이 완료되면 다시 수정,삭제 버튼이 나오게하기,  수정한댓글 그대로 출력해서 수정한것 처럼 보럼 보이게하기

		 element.innerText = "수정";
		 var cid = element.parentElement.parentElement.parentElement.parentElement.children[0].value; //hidden으로 숨겨둔 input value 값 -> comment.id값 delete버튼동장에거 id값이 사용되기때문에
		 var id =  element.parentElement.parentElement.parentElement.parentElement.children[1].value; //hidden으로 숨겨둔 input value 값
		 var value = element.parentElement.parentElement.parentElement.children[1].value; //<textarea>의 value값
	        console.log(cid);
	        console.log(id);
	        console.log(value);
	        element.parentElement.parentElement.parentElement.children[1].remove();//<textarea>삭제
	        element.parentElement.parentElement.parentElement.children[1].innerText = value; //<p>태그에 다시 value값 넣어주기

	        var btnDelete = document.createElement("button");  //<button>엘리먼트 다시 생성
	        btnDelete.innerText = "삭제"; //<button>이름변경
	        btnDelete.setAttribute("class","btn btn-sm btn-outline-dark");
	        btnDelete.setAttribute("onclick", "commentDelete(" + cid + "," + id + ");"); // 삭제 <button> 을 누른다면 다시 commentDelete기능이 동작하게 해줌
        
	        element.parentElement.append(btnDelete); //마지막에 새로운 요소 추가

	        element.setAttribute("onclick","changeEdit(this);"); //다시 수정버튼을 누르면 changeEdit 기능이 동작하게 해줌

	}

	function commentUpdate(element){  //댓글 수정 하는 코드

		 var cid = element.parentElement.parentElement.parentElement.parentElement.children[0].value; //hidden으로 숨겨둔 input value 값 -> comment.id값
		 var id = element.parentElement.parentElement.parentElement.parentElement.children[1].value; //hidden으로 숨겨둔 input value 값 -> moim.id값
		 var value = element.parentElement.parentElement.parentElement.children[1].children[0].value;  //<textarea>의 value값
	    
		 


		$.ajax({
			url: "/somoim/moim/board/comment/modify",
			type: "post",
			data: {
				id: id,
				cid: cid,
				content: value
			},
			success: function(data) {
				if(data.code === "success") {
					// update시  잘못되었을때 다시 원래값으로 되돌려주기위해서 여기서 다시한번 value값다시정의
					element.parentElement.parentElement.parentElement.children[1].value = value;
					changeText(element); //댓글수정이 성공하면 changeText(element) 가 동작하도록한다.
				}else if(data.code === "notexist"){
					alert(data.message);
        			location.href = "/somoim/moim/boardDetail?id="+ ${data.moimId}+"&boardId="+${data.boardId};
				}else if(data.code === "error"){
					alert(data.message);
					location.href = "/somoim/moim/boardDetail?id="+ ${data.moimId}+"&boardId="+${data.boardId};
				}else if(data.code === "leaveMember"){
					alert(data.message);
					location.href = "/somoim/moim/boardDetail?id="+ ${data.moimId}+"&boardId="+${data.boardId};
				}
			}
		});

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
	</div>
</header>

<!--헤더 밑에 전부 메인박스-->
<main class="main">
	<!-- 작성글 섹션 -->
	<section class="col-8">
		<nav class="section__nav">
			<ul id="navList" class="nav__list">
				<li class="nav__btn" onclick="location.href='/somoim/moim/meeting?id=${moimData.moimId}'">
					정모
				</li>
				<li class="nav__btn nav__selected" onclick="location.href='/somoim/moim/board?id=${moimData.moimId}'">
					게시판
				</li>
			</ul>
		</nav>
		<div class="main-box">
			<!--첫번째 게시글 박스-->
			<div class="main-box__board_detail">
				<div class="board-title">
					<span>${data.boardTitle}</span>
					<div>
						<c:if test="${sessionScope.loginData.memberId eq data.memberId}"> <!-- 일치한경우에만 수정,삭제 버튼을 표시한다. -->
								<c:url var="boardModifyUrl" value="/moim/board/modify"/>
								<button class="btn--letter" type="button" onclick="location.href='${boardModifyUrl}?id=${data.moimId}&boardId=${data.boardId}'" >수정</button>
								<button class="btn--letter" type="button" onclick="deleteBoard(${data.boardId},${data.moimId})">삭제</button>
						</c:if>
					</div>
				</div>
				<div class="board-header">
					<div class="board-writer-img">
						<img
								src="${data.memberImagePath}"
								class="icon--circle icon--circle__member"
						/>
					</div>
					<div class="board-writer">
						<span>${data.memberName}</span>
						<span>${data.boardCreateDate}</span>
					</div>
				</div>
				<div class="board-content">
					<input type="hidden" value="${data.boardId}"/>
					<span>${data.content}</span>
				</div>
				<div id="commentBtn" class="board-footer board-footer__detail">
					<span><i class="fa-regular fa-message"></i></span>
					<span>${data.commentCount}</span>
				</div>
				<div id="commentBox" class="comment-box hidden">
					<c:forEach items="${paging.pageData}" var="comment"> <!-- 요기서부터 페이징으로 나눈 데이터 출력시켜주는 코드 -->
						<div class="comment-info">
							<input type="hidden" value="${comment.commentId}">
							<input type="hidden" value="${comment.moimId}">
							<div class="comment-writer-img">
								<img
										src="${comment.memberImagePath}"
										class="icon--circle icon--circle__member"
								/><!-- dto에 memberImagePath 추가하고 src 부분에 comment.memberImagePath 추가 -->
							</div>
							<div class="comment-content">
								<span>${comment.memberName}</span>
								<span>${comment.content}</span>
								<div class="comment-footer">
									<span>${comment.contentCreateDate}</span>
									<c:if test="${sessionScope.loginData.memberId eq comment.memberId}"> <!-- 일치한경우에만 수정,삭제 버튼을 표시한다. -->
										<span><button class="btn--letter" type="button" id="testtest" onclick="changeEdit(this);">수정</button></span>
									</c:if>
									<c:if test="${sessionScope.loginData.memberId eq comment.memberId}"> <!-- 일치한경우에만 수정,삭제 버튼을 표시한다. -->
										<span><button class="btn--letter" type="button" onclick="commentDelete(${comment.commentId},${comment.moimId})">삭제</button></span>
									</c:if>
								</div>
							</div>
						</div>
					</c:forEach>
					<nav>
						<div>
							<ul class="pagination justify-content-center">
								<c:url var="boardDetailUrl" value="/moim/boardDetail">
									<c:param name="id">${data.moimId}</c:param>
									<c:param name="boardId">${data.boardId}</c:param>
								</c:url>
								<c:if test="${paging.hasPrevPage()}">
									<li class="page-item">
										<a class="page-link" href="${boardDetailUrl}&page=${paging.prevPageNumber}">prev</a>
									</li>
								</c:if>

								<c:forEach
										items="${paging.getPageNumberList(paging.currentPageNumber - 2 , paging.currentPageNumber + 2)}"
										var="num">
									<li class="page-item ${paging.currentPageNumber eq num ? 'active' : ''}"> <!-- active 넣으면 활성화됨 -->
										<a class="page-link" href="${boardDetailUrl}&page=${num}">${num}</a>
									</li>
								</c:forEach>
								<c:if test="${paging.hasNextPage()}">
									<li class="page-item">
										<a class="page-link" href="${boardDetailUrl}&page=${paging.nextPageNumber}">next</a>
									</li>
								</c:if>
							</ul>
						</div>
					</nav>
					<c:url var="boardUrl" value="/moim/board"/>
					<button class="btn btn-primary" type="button" onclick="location.href='${boardUrl}?id=${data.moimId}'">목록
					</button>
				</div>
				<div class="mb-1">
					<form action="${boardUrl}/comment/add" method="post">
						<input type="hidden" name="id" value="${data.moimId }">
						<input type="hidden" name="bid" value="${data.boardId}">
						<div class="input-group">
							<textarea class="form-control" name="content" id="id_data_desc" rows="3"
												placeholder="400자 이내로 작성해주세요"></textarea>
							<button class="btn btn-outline-dark" type="button" onclick="formCheck(this.form);">등록</button>
						</div>
					</form>
				</div>
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
						<span>
							<button type="button" class="btn--letter"
										onclick="location.href='/somoim/moim/modify?id=${moimData.moimId}&test=1'">편집
							</button>
						</span>
					</c:if>
					<c:if test="${res.jobId eq 1}"> <!-- 모임장만 삭제버튼보이게하기 -->
						<span>
							<button type="button" class="btn--letter"
											data-bs-toggle="modal" data-bs-target="#removeModal">삭제
							</button>
						</span>
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
<div class="modal fade" id="removeModal" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				정말로 모임을 삭제하시겠습니까?
			</div>
			<div class="modal-footer">
				<button type="button" data-bs-dismiss="modal" onclick="location.href='remove?id=${param.id}'">확인</button>
				<button type="button" data-bs-dismiss="modal" aria-label="Close">취소</button>
			</div>
		</div>
	</div>
</div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
  </script>
  
  <script type="text/javascript">
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
		


		function formCheck(form){
				if(form.content.value.trim() === "" ){ //빈값확인하기 ,비어져있으면 경고메세지 
					alert("댓글 내용을 입력하세요");
				}else if(form.content.value.length > 500){
					alert("댓글은 400내외로 가능합니다.");
				}
				else{
					form.submit(); //아니면 submit하기
				}
			}
	</script>
	<script src="${path}/resources/js/components/navigation.js"></script>
	<script src="${path}/resources/js/moim.js"></script>
	<script src="${path}/resources/js/category.js"></script>
	<script src="${path}/resources/js/components/popup.js"></script>
	

</body>

</html>