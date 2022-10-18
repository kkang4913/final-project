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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
        integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
  <script type="text/javascript" src="${path}/resources/js/jquery-3.6.0.min.js"></script>
  <title>관심사 선택</title>
</head>
<body>
<section class="form-section">
  <div class="form-container" >
    <div class="p-4 rounded-3 bg-white">
      <div class="row">
        <div class="col-4 d-flex flex-column justify-content-center align-items-center" >
          <div id="cate_1" class="icon--circle icon--circle__cate">
            <i class="fa-solid fa-suitcase"></i>
          </div>
          <span>아웃도어/여행</span>
          <div id="cate_2" class="icon--circle icon--circle__cate">
            <i class="fa-solid fa-person-swimming"></i>
          </div>
          <span>운동/스포츠</span>
          <div id="cate_3" class="icon--circle icon--circle__cate">
            <i class="fa-solid fa-book"></i>
          </div>
          <span>인문학/책/글</span>
          <div id="cate_4" class="icon--circle icon--circle__cate">
            <i class="fa-solid fa-language"></i>
          </div>
          <span>외국/언어</span>
          <div id="cate_5" class="icon--circle icon--circle__cate">
            <i class="fa-solid fa-masks-theater"></i>
          </div>
          <span>문화/공연/축제</span>
          <div id="cate_6" class="icon--circle icon--circle__cate">
            <i class="fa-solid fa-music"></i>
          </div>
          <span>음악/악기</span>
        </div>
        <div class="col-4 d-flex flex-column justify-content-center align-items-center" >
          <div id="cate_7" class="icon--circle icon--circle__cate">
            <i class="fa-solid fa-palette"></i>
          </div>
          <span>공예/만들기</span>
          <div id="cate_15" class="icon--circle icon--circle__cate">
            <i class="fa-solid fa-utensils"></i>
          </div>
          <span>요리/제조</span>
          <div id="cate_16" class="icon--circle icon--circle__cate">
            <i class="fa-solid fa-dog"></i>
          </div>
          <span>반려동물</span>
          <div id="cate_8" class="icon--circle icon--circle__cate">
            <i class="fa-solid fa-user-ninja"></i>
          </div>
          <span>댄스/무용</span>
          <div id="cate_9" class="icon--circle icon--circle__cate">
            <i class="fa-solid fa-hands"></i>
          </div>
          <span>봉사활동</span>
          <div id="cate_10" class="icon--circle icon--circle__cate">
            <i class="fa-solid fa-handshake-simple"></i>
          </div>
          <span>사교/인맥</span>
        </div>
        <div class="col-4 d-flex flex-column justify-content-center align-items-center">
          <div id="cate_11" class="icon--circle icon--circle__cate">
            <i class="fa-solid fa-car"></i>
          </div>
          <span>차/오토바이</span>
          <div id="cate_12" class="icon--circle icon--circle__cate">
            <i class="fa-brands fa-youtube"></i>
          </div>
          <span>사진/영상</span>
          <div id="cate_13" class="icon--circle icon--circle__cate">
            <i class="fa-solid fa-baseball-bat-ball"></i>
          </div>
          <span>야구관람</span>
          <div id="cate_14" class="icon--circle icon--circle__cate">
            <i class="fa-solid fa-gamepad"></i>
          </div>
          <span>게임/오락</span>
          <div id="cate_17" class="icon--circle icon--circle__cate">
            <i class="fa-solid fa-hand-holding-heart"></i>
          </div>
          <span>가족/결혼</span>
          <div id="cate_18" class="icon--circle icon--circle__cate">
            <i class="fa-solid fa-paper-plane"></i>
          </div>
          <span>자유주제</span>
        </div>
      </div>
      <button class="find-form__btn btn--grey" type="button" onclick="popClose();">취소</button>
      <button class="find-form__btn btn--purple" type="button" onclick="submitCategory();">확인</button>
    </div>
  </div>
</section>
</body>
<script src="${path}/resources/js/category.js"></script>
<script src="${path}/resources/js/components/popup.js"></script>
<script type="text/javascript">

</script>
</html>
