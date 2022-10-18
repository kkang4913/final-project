<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
		integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
		crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/styles.css">
	<script type="text/javascript" src="${path}/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="logo"><img src="${path}/resources/img/logos/eoulrim_logo_w.png" onclick="location.href='/somoim'"></div>
  <!-- 유저정보 -->
	<header class="header">
		<!-- info image -->
		<div id="hoverTarget" class="header-img">
			<div id="infoImg" class="img-grad-layer"></div>
			<img class="header-img__img" src="${sessionScope.loginData.infoImagePath}" accept="image/*">
			<input id="infoImgSelect" class="hidden" type="file" name="uploadImg" value="이미지 선택">
		</div>
		<!-- 프로필 -->
		<div  class="header-info-box">
			<!-- 프로필 이미지 -->
			<div id="hoverTarget_profile" class="header-info-img">
				<img id="profImg" class="header-info-img__img icon--circle"  src="${sessionScope.loginData.memberImagePath}" accept="image/*">
				<input id="profImgInput" class="hidden" type="file" name="uploadImg" value="이미지 선택">
			</div>

			<!-- 이름, 생년월일, 거주지역 -->
			<div class="header-info-detail">
				<div class="header-info__column">
					<span class="header-info-title">
						${sessionScope.loginData.memberName}
					</span>
				</div>
				<div class="header-info__column">
					<div class="icon__location">${sessionScope.loginData.locationName}</div>
					<span class="material-icons">date_range</span>
					<span>${sessionScope.loginData.birth}</span>
				</div>
			</div>

			<div class="header-info-btn">
				<button type="button" class="btn--round btn--w216 btn--purple" onclick="popModProfile();"><i class="fa-solid fa-pen"></i>프로필 편집</button>
			</div>
		</div>
	</header>

	<main class="main">
		<!-- 작성글 섹션 -->
		<section class="col-8">
			<nav class="section__nav">
				<ul id="navList" class="nav__list">
					<li id="writeBoard" class="nav__btn nav__selected">
						작성한 글
					</li>
					<li id="writeComment" class="nav__btn">
						작성한 댓글
					</li>
				</ul>
			</nav>
			<div id="infoBoard" class="main-box">
				<c:choose>
					<c:when test="${not empty boardDatas}">
						<c:forEach items="${boardDatas}" var="boardData">
							<div class="main-box__info-board" onclick="location.href ='/somoim/moim/boardDetail?id=${boardData.moimId}&boardId=${boardData.boardId}'">
								<div class="info-board-moim-title">
									<c:forEach items="${moimDatas}" var="moimData">
										<c:if test="${moimData.moimId eq boardData.moimId}">
											<img src="${moimData.moimImagePath}" class="icon--square">
										</c:if>
									</c:forEach>
									<span>${boardData.moimTitle}</span>
								</div>
								<div class="info-board-title">
									<span>${boardData.boardTitle}</span>
								</div>
								<div class="info-board-content">
									<span class="content-hidden">${boardData.content}</span>
								</div>
								<div class="info-board-footer">
									<span>${boardData.boardCreateDate}</span>
									<i class="fa-regular fa-message"></i>
									<span>댓글 0</span>
								</div>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="main-box__info-board">
							<div class="info-board-title" style="margin-bottom: 0">
								작성한 글이 없습니다.
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			<div id="infoComment" class="main-box hidden">
				<c:choose>
					<c:when test="${not empty commentsDatas}">
						<c:forEach items="${commentsDatas}" var="commentsData">
					<div class="main-box__info-comment" onclick="location.href ='/somoim/moim/boardDetail?id=${commentsData.moimId}&boardId=${commentsData.boardId}'">
						<div class="info-comment">
							<span class="info-comment-content content-hidden">${commentsData.content}</span>
							<span class="info-comment-date">${commentsData.contentCreateDate}</span>
						</div>
						<div class="info-comment-moim">
							<div class="info-comment-moim__column">
								<img src="${commentsData.moimImagePath}" class="icon--square icon--square--small">
							</div>
									<div class="info-comment-moim__column">
										<span>${commentsData.moimTitle}</span>
										<span>${commentsData.boardTitle}</span>
									</div>
						</div>
					</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="main-box__info-board">
							<div class="info-board-title" style="margin-bottom: 0">
								작성한 댓글이 없습니다.
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>

		</section>

		<section class="col-3">
			<!-- 관심사 -->
			<div class="side-box">
				<div class="side-box-title">
					${sessionScope.loginData.memberName}님의 관심사
				</div>
				<div id="cate" class="info-category-list">
					<c:if test="${not empty sessionScope.loginData}">
						<script>
							window.onload = () => {
								addEventListener("DOMContentLoaded", printCate("${sessionScope.loginData.category}"));
							};
						</script>
					</c:if>
				</div>
			</div>
			<!-- 가입한 소모임 -->
			<div class="side-box">
				<div class="side-box-title">
					${sessionScope.loginData.memberName}님의 소모임
				</div>
				<div class="side-box-main">
						<c:if test = "${not empty moimDatas}">
							<c:forEach items="${moimDatas}" var="moimData">
								<div class="side-box-list" onclick="location.href ='/somoim/moim/meeting?id=${moimData.moimId}'">
									<div class="side-box-list__column">
										<img src="${moimData.moimImagePath}" class="icon--square">
									</div>
								  <div class="side-box-list__column">
										<div class="side-box-list__low-column">
											<span class="side-box-moim-title">${moimData.moimTitle}</span>
											<span class="side-box-moim-part">1/${moimData.moimLimit}</span>
										</div>
										<div class="side-box-list__low-column">
											<span class="icon__location icon__location--small">${moimData.locationName}</span>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>
				</div>
			</div>
		</section>
	</main>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="${path}/resources/js/components/navigation.js"></script>
	<script src="${path}/resources/js/category.js"></script>
	<script src="${path}/resources/js/info.js"></script>
	<script src="${path}/resources/js/components/popup.js"></script>
</body>
</html>