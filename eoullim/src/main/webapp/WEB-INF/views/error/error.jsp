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
					페이지를 찾을 수
					<br>
					없습니다.
					</strong>
					<p class="info">
					페이지의 주소가 잘못 입력되었거나,
					<br>
					변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.
					<br>
					입력하신 페이지 주소를 다시 한번 확인해 주세요	
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