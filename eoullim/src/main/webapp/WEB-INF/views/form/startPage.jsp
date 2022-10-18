<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<c:set var="path" value="${pageContext.request.contextPath}" />
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
				integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
				crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="${path}/resources/css/styles.css">
<script type="text/javascript" src="${path}/resources/js/jquery-3.6.0.min.js"></script>
<title>어울림</title>
</head>
<body>
	<header>
	</header>
<main class="main">
	<section class="start-page">
	<div>
		<img src="${path}/resources/img/logos/eoulrim_logo_p.png">
	</div>
	<div class="start-page-title">
		<span>당신의</span>
		<span>취미는</span>
		<span>무엇인가요?</span>
	</div>
		<div>
			<div class="start-page-btn" onclick="location.href='login'">
				<button type="button">취미 찾으러 가기</button>
				<div class="start-page-arrow"><i class="fa-solid fa-arrow-right"></i></div>
			</div>
		</div>
	</section>
	<section class="start-page-img">
		<img src="${path}/resources/img/logos/main_intro.png" />
	</section>
</main>
</body>
<script type="text/javascript">
window.addEventListener("load", event => {
    document.getElementById("reload").onclick = function() {
        location.reload(true);
    }
});
</script>
</html>