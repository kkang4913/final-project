<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>


<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8"/>
  <title>${moimData.moimTitle}모임 입니다.</title>
  <c:set var="path" value="${pageContext.request.contextPath}"/>
  <c:url var="cs" value="/resources/css"/>
  <c:url var="img" value="/resources/img/somoim"/>
  <c:url var="meetingimg" value="/resources/img"/>
  <c:url var="resourcesUrl" value="/resources"/>


  <!-- Bootstrap CSS -->
  <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous"
  />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
        integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link rel="stylesheet" href="${cs}/styles.css"/>
  <script type="text/javascript" src="${resourcesUrl}/js/jquery-3.6.0.min.js"></script>
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



<body>
<c:url var="meetingUrl" value="/moim/meeting/">
  <c:param name="id" value="${moimData.moimId}">모임 입니다.</c:param>
</c:url>
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
        <span>현재 ${currentMemberCount} / 정원 ${moimData.moimLimit}</span>
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
</header>
<!--헤더 밑에 전부 메인박스-->
<main class="main">
  <!-- 작성글 섹션 -->
  <section class="col-8">
    <nav class="section__nav">
      <ul id="navList" class="nav__list">
        <li class="nav__btn nav__selected" onclick="location.href='/somoim/moim/meeting?id=${moimData.moimId}'">
          정모
        </li>
        <li class="nav__btn" onclick="location.href='/somoim/moim/board?id=${moimData.moimId}'">
          게시판
        </li>
      </ul>
    </nav>
    <div class="main-box">
      <c:if test="${not empty meetingsData}">
        <c:forEach items="${meetingsData}" var="meetingsData" varStatus="status">
          <div class="main-box__meeting">
            <div class="meeting-date-box">
              <div class="meeting-date">
                <div class="meeting-day">${meetingsData.day}</div>
                <div class="meeting-dow"><div>${meetingsData.dayOfW}</div></div>
              </div>
              <div class="meeting-part-btn">
                <c:if test="${not empty meetingParticipants}">
                  <c:set var="partChk" value="false" />
                  <c:forEach items="${meetingParticipants}" var="meetingParticipants">
                    <c:if test="${meetingParticipants.meetingId eq meetingsData.meetingId && meetingParticipants.memberId eq sessionScope.loginData.memberId}">
                      <button type="button" class="btn--round btn--w100p btn--purple" onclick="meetingPart('${sessionScope.loginData.memberId}', ${param.id}, ${meetingsData.meetingId});">취소</button>
                      <c:set var="partChk" value="true" />
                    </c:if>
                  </c:forEach>
                </c:if>
                <c:if test="${not partChk}">
                  <button type="button" class="btn--round btn--w100p btn--purple" onclick="meetingPart('${sessionScope.loginData.memberId}', ${param.id}, ${meetingsData.meetingId});">참가하기</button>
                </c:if>
              </div>
            </div>
            <div class="meeting-info-box">
              <div class="meeting-info">
                <div>
                  <div class="meeting-info__icon"><i class="fa-solid fa-heart"></i></div>
                  <span>${meetingsData.meetingTitle}</span>
                </div>
                <div>
                  <div class="meeting-info__icon"><i class="fa-solid fa-clock"></i></div>
                  <span>${meetingsData.month}.${meetingsData.day} ${meetingsData.meetingTime}</span>
                </div>
                <div>
                  <div class="meeting-info__icon"><i class="fa-solid fa-location-dot"></i></div>
                  <span>${meetingsData.meetingPlace}</span>
                </div>
                <div>
                  <div class="meeting-info__icon"><i class="fa-solid fa-money-check-dollar"></i></div>
                  <span>${meetingsData.meetingPrice}원</span>
                </div>
                <div>
                  <div class="meeting-info__icon"><i class="fa-solid fa-user"></i></div>
                  <span>정원 ${meetingsData.meetingLimit}명</span>
                  <div class="dropdown__meeting">
                    <div id="partDropdownBtn${status.count}" class="dropdown-btn">
                      <i class="fa-solid fa-angle-down"></i>
                    </div>
                    <div id="partDropdownContent${status.count}" class="hidden dropdown-content scroll scroll-h85">
                      <c:if test="${not empty meetingParticipants}">
                        <c:forEach items="${meetingParticipants}" var="meetingParticipants">
                          <c:if test="${meetingParticipants.meetingId eq meetingsData.meetingId}">
                            <div class="meeting-part">
                                <img src="${meetingParticipants.memberImagePath}" class="icon--circle icon--circle--small"/>
                                <div>${meetingParticipants.memberName}</div>
                            </div>
                          </c:if>
                        </c:forEach>
                      </c:if>
                    </div>
                  </div>
                </div>
                <span id="${meetingsData.meetingId}"></span>
              </div>
              <div class="meeting-info-btn">
                  <c:if test="${res.jobId eq 1 || res.jobId eq 2}">
                    <button type="button" class="btn--icon" onclick="popModMeeting(${meetingsData.meetingId}, ${param.id});"><i class="fa-solid fa-pen"></i></button>
                    <button type="button" class="btn--icon" onclick="removeMeeting('${param.id}', ${meetingsData.meetingId});"><i class="fa-solid fa-x"></i></button>
                  </c:if>
              </div>
            </div>
          </div>
        </c:forEach>
      </c:if>
      <c:if test="${res.jobId eq 1 || res.jobId eq 2}">
        <div id="meetingBtn" class="meeting-btn">
          <button type="button" class="btn--round btn--w100p btn--purple" onclick="popAddMeeting(${param.id});">
            <i class="fa-solid fa-plus"></i> 정모 만들기
          </button>
        </div>
      </c:if>
    </div>
  </section>
  <section class="col-3">
    <!-- 모임 정보 -->
    <div class="side-box">
      <div class="side-box-title">
        <span>모임 정보</span>
        <div>
          <c:if test="${res.jobId eq 1}"> <!-- 모임장만 편집버튼보이게하기 -->
            <button type="button" class="btn--letter"
                    onclick="location.href='/somoim/moim/modify?id=${moimData.moimId}&test=1'">편집
            </button>
          </c:if>
          <c:if test="${res.jobId eq 1}"> <!-- 모임장만 삭제버튼보이게하기 -->
            <button type="button" class="btn--letter"
                    data-bs-toggle="modal" data-bs-target="#removeModal">삭제
            </button>
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
<script>
    const navList = document.querySelectorAll('#navList li');
    navList.forEach( (list) => {
        list.addEventListener('mouseover', () => {  //  mouseover 시 hover 클래스 추가
            list.classList.add('nav__hover');
        });
    });
    navList.forEach( (list) => {
        list.addEventListener('mouseout', () => {   //  mouseout 시 hover 클래스 삭제
            list.classList.remove('nav__hover');
        });
    });
</script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"
></script>
<script src="${path}/resources/js/moim.js"></script>
<script src="${path}/resources/js/meeting.js"></script>
<script src="${path}/resources/js/info.js"></script>
<script src="${path}/resources/js/components/popup.js"></script>
<script src="${path}/resources/js/components/dropdown.js"></script>
<script>

</script>
</body>
</html>