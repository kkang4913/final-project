<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>somoim</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/styles.css">
</head>
<body>
<section class="error-page section">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 offset-lg-3 col-12">
				<!-- Error Inner -->
				<div class="error-inner">
					<img src="${path}/resources/img/logos/eoulrim_logo_p.png" class="main_title">
					<h1 class="main_icon">!</h1>
					<strong class="title">
					요청하신 작업을
					<br>
					수행할 수 없습니다.
					</strong>
					<p class="info">
					요청하신 작업이 잘못되었거나
					<br>
					작업에 대한 권한이 없습니다.
					<br>
					다시 한번 확인 후 작업을 요청해주세요.
					</p>
						<button class="home" onclick="location.href='/somoim'" type="button">어울림 홈</button>
						<button class="back" onclick="history.back();"type="button">이전 페이지</button>
				</div>
			</div>
		</div>
				<!--/ End Error Inner -->
	</div>
</section>
</body>
</html>