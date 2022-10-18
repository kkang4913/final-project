<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:url var="img" value="/resources/img/somoim"/>
<!DOCTYPE html>
<html lang="ko">
<head>
  <!-- Required meta tags -->
  <meta charset="UTF-8">
  <!-- 모바일로 확인시 크기조절 -->
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <!-- Bootstrap CSS -->
  <script type="text/javascript" src="${path}/resources/js/jquery-3.6.0.min.js"></script>
  
  <link rel="stylesheet" href="${path}/resources/css/screens/startPage.css">
  
  <title>소모임</title>
</head>

<body>
  		<c:if test="${empty sessionScope.loginData}">
				<%@ include file="./form/startPage.jsp"  %>
		</c:if>
		
		<c:if test="${not empty sessionScope.kakaoDatas}}">
				<%@ include file="./form/startPage.jsp"  %>
		</c:if>
		
		<c:if test="${not empty sessionScope.loginData}">
				<%@ include file="./somoim.jsp"  %>
		</c:if>
		
		<c:if test="${not empty sessionScope.kakaoDatas}}">
					<%@ include file="./somoim.jsp"  %>
		</c:if>
</body>

</html>