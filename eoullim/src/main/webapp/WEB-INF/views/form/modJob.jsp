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
	<title>멤버 관리</title>
</head>
<body>
<div class="form-logo">
	<img src="${path}/resources/img/logos/eoulrim_logo_p.png">
</div>
	<section class="form-section">
		<div class="form-container">
			<form class="mod-form" action="">
				<c:forEach items="${moimParticipants}" var="moimParticipants">
					<div class="partList space-evenly margin-10 bottom-10">
						<img
								src="${moimParticipants.memberImagePath}"
								class="rounded-circle"
								alt="profile-image"
								width="70"
								height="70"
								border-radius="50%"
						/>
						<select>
							<option value="1"
								<c:if test="${moimParticipants.jobName eq '모임장'}">
									selected
								</c:if>>모임장
							</option>
							<option value="2"
								<c:if test="${moimParticipants.jobName eq '관리자'}">
								selected
							</c:if>>관리자
							</option>
							<option value="3"
								<c:if test="${moimParticipants.jobName eq '일반회원'}">
									selected
								</c:if>>일반회원
							</option>
						</select>
						<div>${moimParticipants.memberName}</div>
						<div id="${moimParticipants.memberId}" style="display: none"></div>
					</div>
				</c:forEach>
				<div class="meeting-form-inline div-line">
					<button class="btn--grey" type="button" onclick="popClose()">취소</button>
					<button class="btn--purple" type="button" onclick="submitModJob(${param.id})">수정</button>
				</div>
			</form>
		</div>
	</section>
</body>
<script src="${path}/resources/js/components/popup.js"></script>
<script src="${path}/resources/js/modJob.js"></script>

</html>