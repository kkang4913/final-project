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
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
	 integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
     <script type="text/javascript" src="${path}/resources/js/jquery-3.6.0.min.js"></script>
	<title>정모 개설</title>
</head>
<body>
<div class="form-logo">
	<img src="${path}/resources/img/logos/eoulrim_logo_p.png">
</div>
	<section class="form-section">
		<div class="form-container" >
		<c:url  var="meetingAddUrl" value="/moim/addMeeting"></c:url>
			<form class="meeting-form" method="POST" action="${meetingAddUrl}">
				<input id="moimId" name="moimId" style="display: none" value="${param.id}">
				<div class="meeting-form-input">
					<span class="material-icons">favorite</span>
					<input class="meeting-form__input info__title" type="text" id="meetingTitle" name="meetingTitle" placeholder="정모 이름">
				</div>
					<div class="meeting-form-input" id="info__date">
							<span class="material-icons">date_range</span>
							<select class="meeting-form-inline__input" id="meetingMonth" name="month">
								<option disabled selected>월</option>
								</select>
							<select class="meeting-form-inline__input" id="meetingDay" name="day">
									<option disabled selected>일</option>
						  </select>
							<input class="meeting-form-inline__input" type="text" id="meetingTime" name="meetingTime" placeholder="정모 시간"/>
					</div>
				<div class="meeting-form-input">
					<span class="material-icons">room</span>
					<input class="meeting-form__input" type="text" id="meetingPlace" name="meetingPlace" placeholder="정모 장소">
				</div>
				<div class="meeting-form-input">
					<span class="material-icons">money</span>
					<input class="meeting-form__input" type="text" id="meetingPrice" name="meetingPrice" placeholder="정모 지참금">
				</div>
				<div class="meeting-form-input">
					<span class="material-icons">groups</span>
					<input class="meeting-form__input" type="text" id="meetingLimit" name="meetingLimit" placeholder="정원 (5 ~ 50명)">
				</div>
				<div class="meeting-form-inline div-line">
					<button class="meeting-form__btn btn---grey" type="button" onclick="popClose();" >취소</button>
					<button class="meeting-form__btn btn--purple" type="button"  onclick="addFormCheck(this.form, ${param.id});">정모만들기</button>
				</div>
			</form>
		</div>
	</section>
</body>
<script>
	const chkErr = ${not empty errMsg};
	const errMsg = '${errMsg}';

	$(document).ready( () => {
		if(chkErr) {
			alert(errMsg);
			window.opener.location.href = "/somoim/moim/meeting?id=" + ${param.id};
			popClose();
		}
	});
</script>
<script src="${path}/resources/js/meeting.js"></script>
<script src="${path}/resources/js/components/popup.js"></script>
</html>