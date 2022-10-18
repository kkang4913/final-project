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
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="${path}/resources/js/components/popup.js"></script>
<link rel="stylesheet" href="${path}/resources/css/styles.css">
</head>
	<title>로그인</title>
</head>
<style>
	.social-login__btn:hover, .link-row > a:hover, .logging_box > label:hover  {cursor: pointer;}
</style>
<body>
<header>
</header>
<main class="main">
	<section class="start-page">
		<div>
			<img src="${path}/resources/img/logos/eoulrim_logo_p.png">
		</div>
		<div class="start-page-title">
			<span>당신이</span>
			<span>누구인지</span>
			<span>알려주세요 :)</span>
		</div>
	</section>
	<section class="form-section">
		<div class="form-container">
			<c:url var="loginUrl" value="/login"/>
			<form class="login-form" action="${loginUrl}" method="post" >
				<input class="login-form__input" name="memberId" type="text" placeholder="아이디를 입력해주세요."  />
				<input class="login-form__input" name="password" type="password" placeholder="비밀번호를 입력해주세요." />
				<span class="logging_box">
			    	<input class="login-form__checkbox" type="checkbox" name="userCookies"  id="logging"/>
			       	<label for="logging">로그인 상태 유지</label>
			    <c:if test="${not empty loginError}">
			    	<div class="error_login">
			    		${loginError}
			    	</div>
			    </c:if>
			    </span>
				<input class="login-form__btn btn--purple" type="submit" value="로그인"  />
			</form>
			<div class="link-row">
				<a onclick="popId();">아이디 찾기</a>
				|
				<a onclick="popPw();">비밀번호 찾기</a>
				|
				<a onclick="popJoin();">회원가입</a>
			</div>
			<div class="hr-sect">또는</div>
			<div class="social-login">
				<button id ="naverLogin" class="social-login__btn btn--green" onclick="location.href='${url}'"><img src="${path}/resources/img/logos/naver-logo.png" /><span>네이버 계정으로 로그인</span></button>
				<button class="social-login__btn btn--yellow" onclick="location.href='/somoim/login/kakao'"><img src="${path}/resources/img/logos/kakao-logo.png" /><span>카카오톡 계정으로 로그인</span></button>
			</div>
		</div>
	</section>
</main>
</body>
<script type="text/javascript">
</script>
</html>