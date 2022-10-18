<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:url var="img" value="/resources/img/somoim"/>
<head>
  <!-- Required meta tags -->
  <meta charset="UTF-8">
  <!-- 모바일로 확인시 크기조절 -->
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
  integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
  integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
  crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="${path}/resources/css/styles.css">
  <script type="text/javascript" src="${path}/resources/js/jquery-3.6.0.min.js"></script>
  <title>소모임</title>
</head>

<body>
<div class="logo" onclick="location.href='/somoim'"><img src="${path}/resources/img/logos/eoulrim_logo_p.png"></div>
	<header>
	</header>
	<main class="main">
		<section class="col-8">
			<div class="main-box">
				<div class="main-cate">
					<div id="gradLayer" class="cate__grad-layer"></div>
					<div id="mainCate" class="main-cate scroll-x">
						<div class="icon__div">
						<div id="cate_1" class="icon--circle icon--circle__cate">
							<input type="hidden"  value="1" />
							<i class="fa-solid fa-suitcase"></i>
						</div>
						<span>아웃도어/여행</span>
						</div>
						<div class="icon__div">
						<div  id="cate_2" class="icon--circle icon--circle__cate">
							<input type="hidden"  value="2" />
							<i class="fa-solid fa-person-swimming"></i>
						</div>
						<span>운동/스포츠</span>
						</div>
						<div class="icon__div">
						<div  id="cate_3" class="icon--circle icon--circle__cate">
							<input type="hidden"  value="3" />
							<i class="fa-solid fa-book"></i>
						</div>
						<span>인문학/책/글</span>
						</div>
						<div class="icon__div">
						<div  id="cate_4" class="icon--circle icon--circle__cate">
							<input type="hidden"  value="4" />
							<i class="fa-solid fa-language"></i>
						</div>
						<span>외국/언어</span>
						</div>
						<div class="icon__div">
						<div  id="cate_5" class="icon--circle icon--circle__cate">
							<input type="hidden"  value="5" />
							<i class="fa-solid fa-masks-theater"></i>
						</div>
						<span>문화/공연/축제</span>
						</div>
						<div class="icon__div">
						<div  id="cate_6" class="icon--circle icon--circle__cate">
							<input type="hidden"  value="6" />
							<i class="fa-solid fa-music"></i>
						</div>
						<span>음악/악기</span>
						</div>
						<div class="icon__div">
						<div  id="cate_7" class="icon--circle icon--circle__cate">
							<input type="hidden"  value="7" />
							<i class="fa-solid fa-palette"></i>
						</div>
						<span>공예/만들기</span>
						</div>
						<div class="icon__div">
						<div  id="cate_8" class="icon--circle icon--circle__cate">
							<input type="hidden"  value="8" />
							<i class="fa-solid fa-user-ninja"></i>
						</div>
						<span>댄스/무용</span>
						</div>
						<div class="icon__div">
						<div  id="cate_9" class="icon--circle icon--circle__cate">
							<input type="hidden"  value="9" />
							<i class="fa-solid fa-hands"></i>
						</div>
						<span>봉사활동</span>
						</div>
						<div class="icon__div">
						<div  id="cate_10" class="icon--circle icon--circle__cate">
							<input type="hidden"  value="10" />
							<i class="fa-solid fa-handshake-simple"></i>
						</div>
						<span>사교/인맥</span>
						</div>
						<div class="icon__div">
						<div  id="cate_11" class="icon--circle icon--circle__cate">
							<input type="hidden"  value="11" />
							<i class="fa-solid fa-car" ></i>
						</div>
						<span>차/오토바이</span>
						</div>
						<div class="icon__div">
						<div  id="cate_12" class="icon--circle icon--circle__cate">
							<input type="hidden"  value="12" />
							<i class="fa-brands fa-youtube"></i>
						</div>
						<span>사진/영상</span>
						</div>
						<div class="icon__div">
						<div  id="cate_13" class="icon--circle icon--circle__cate">
							<input type="hidden"  value="13" />
							<i class="fa-solid fa-baseball-bat-ball"></i>
						</div>
						<span>야구관람</span>
						</div>
						<div class="icon__div">
						<div  id="cate_14" class="icon--circle icon--circle__cate">
							<input type="hidden"  value="14" />
							<i class="fa-solid fa-gamepad"></i>
						</div>
						<span>게임/오락</span>
						</div>
						<div class="icon__div">
						<div  id="cate_15" class="icon--circle icon--circle__cate">
							<input type="hidden"  value="15" />
							<i class="fa-solid fa-utensils"></i>
						</div>
						<span>요리/체조</span>
						</div>
						<div class="icon__div">
						<div  id="cate_16" class="icon--circle icon--circle__cate">
							<input type="hidden"  value="16" />
							<i class="fa-solid fa-dog"></i>
						</div>
						<span>반려동물</span>
						</div>
						<div class="icon__div">
						<div  id="cate_17" class="icon--circle icon--circle__cate">
							<input type="hidden"  value="17" />
							<i class="fa-solid fa-hand-holding-heart"></i>
						</div>
						<span>가족/결혼</span>
						</div>
						<div class="icon__div">
						<div  id="cate_18" class="icon--circle icon--circle__cate">
							<input type="hidden"  value="18" />
							<i class="fa-solid fa-paper-plane"></i>
						</div>
						<span>자유주제</span>
						</div>
					</div>
				</div>
			</div>
			<div class="main-search-add">
				<div class="list-cnt-box">
					<select id="page_count" class="form-select">
						<option value="5" ${sessionScope.pageCount == 5 ? 'selected' : ''}>5 개</option>
						<option value="10" ${sessionScope.pageCount == 10 ? 'selected' : ''}>10 개</option>
						<option value="15" ${sessionScope.pageCount == 15 ? 'selected' : ''}>15 개</option>
						<option value="20" ${sessionScope.pageCount == 20 ? 'selected' : ''}>20 개</option>
					</select>
				</div>
				<div class="search-box">
					<form class="search-form" method="get" >
						<input id="list_search" class="search__input" type="text" placeholder="검색어를 입력하세요." aria-label="Search">
						<button id="search_btn"class="btn--icon"
										type="button">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</form>
				</div>
				<c:url var="moimAddUrl" value="/moim/add" />
				<div>
					<button type="button" class="btn--round btn--w216 btn--purple" onclick="location.href='${moimAddUrl}'"><i class="fa-solid fa-plus"></i>모임 개설하기</button>
				</div>
			</div>
			<div id="m_list" class="main-moim">

			</div>
			<div>
				<nav aria-label="..." class="d-flex justify-content-center">
					<ul class="pagination">
						<li id="p_btn" class="page-item">
							<button id="p_page" class="page-link">
								<i class="fa-solid fa-chevron-left arrow-icon"></i>
							</button>
						</li>
						<li id="page_list" class="page-item d-flex">
						</li>
						<li id="n_btn" class="page-item">
							<button id="n_page" class="page-link" >
								<i class="fa-solid fa-chevron-right arrow-icon"></i>
							</button>
						</li>
					</ul>
				</nav>
			</div>
		</section>
		<section class="col-3">
			<div class="side-box side-box-flex">
				<div class="login-member__img" onclick="location.href='/somoim/info/myInfo'">
						<img
								src="${sessionScope.loginData.memberImagePath}"
								class="icon--circle icon--circle__member"
						/>
				</div>
				<div class="login-member-info">
					<div class="login-member-header">
						<div class="login-member-detail" onclick="location.href='/somoim/info/myInfo'">
							<c:if test="${not empty sessionScope.loginData}">
								<span class="icon__location icon__location--small">
									${sessionScope.loginData.locationName}
								</span>
								<span>${sessionScope.loginData.memberName}</span>
							</c:if>
						</div>
						<div class="login-member-btn">
							<c:if test="${not empty sessionScope.loginData}">
								<button type="button" class="btn--letter" onclick="location.href='logout'" >로그아웃</button>
							</c:if>
							<c:if test="${not empty sessionScope.userInfo}">
								<button type="button" class="btn--letter" onclick="location.href='${path}/login/kakao/kakaoLogout'" >로그아웃</button>
							</c:if>
							<button type="button" class="btn--letter" onclick="popCategory();">관심사 변경</button>
						</div>
					</div>
					<div id="cate" class="info-category-list">
						<c:if test="${not empty sessionScope.loginData}">
							<script>
								window.onload = () => {
									addEventListener("DOMContentLoaded", printSmallCate("${sessionScope.loginData.category}"));
								};
							</script>
						</c:if>
					</div>
				</div>
			</div>
			<div class="dropdown__join-moim">
				<div id="joinMoimDropdownHeader" class="dropdown-header">
					<span>가입한 모임</span>
					<div id="joinMoimDropdownBtn" class="dropdown-btn">
						<i class="fa-solid fa-angle-down"></i>
					</div>
				</div>
				<div id="joinMoimDropdownContent" class="hidden dropdown-content">
					<div id="join_list">
					</div>
				</div>
			</div>
			<div class="dropdown__join-moim">
				<div id="bookMarkDropdownHeader" class="dropdown-header">
					<span>찜한 모임</span>
					<div id="bookMarkDropdownBtn" class="dropdown-btn">
						<i class="fa-solid fa-angle-down"></i>
					</div>
				</div>
				<div id="bookMarkDropdownContent" class="hidden dropdown-content">
					<div id="bookmark_list">
					</div>
				</div>
			</div>
		</section>
	</main>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
  </script>
  <script type="text/javascript">

		$('#mainCate').on('scroll', function() {
			if($('#mainCate').scrollLeft() >= 810) {
				$('#gradLayer').css('opacity', '0.8');
			} else if($('#mainCate').scrollLeft() >= 820) {
				$('#gradLayer').css('opacity', '0.6');
			} else if($('#mainCate').scrollLeft() >= 830) {
				$('#gradLayer').css('opacity', '0.4');
			} else if($('#mainCate').scrollLeft() >= 840) {
				$('#gradLayer').css('opacity', '0.2');
			} else {
				$('#gradLayer').css('opacity', '1');
			}
			if($(this).scrollLeft() + $(this).innerWidth() >= $(this)[0].scrollWidth) {
				$('#gradLayer').removeClass('cate__grad-layer');
			} else {
				$('#gradLayer').addClass('cate__grad-layer');
			}
		})

  let main_page = 1;
  let category_id = 0;
function get_moim_list(page) {
	main_page = page;
	let _url = "./list?page=" + page + "&page_count=" + $('#page_count').val() + "&list_search=" + $('#list_search').val() + "&category_id=" + category_id;
	$.ajax({
		url: _url,
		type: "GET",
		dataType: "json",
		success: function(res) {
			let _html = '';
			let _page = '';
			for (var i=0 ; i < res.datas.length ; i++) {
				_html += '<div id="moim_list" class="main-box__moim" onclick="location.href=\'${path}/moim/meeting?id='+ res.datas[i].moimId +'\'">';
				_html += '<div class="moim-img">';
				_html += '<img src="'+res.datas[i].moimImagePath +'" class="icon--square icon--square--big" alt="image">';
				_html += '</div>';
				_html += '<div class="moim-detail">';
				_html += '<div class="moim-detail__column">';
				_html += '<span class="icon__location icon__location--small">'+ res.datas[i].locationName +'</span>';
				_html += '<span>정원 : '+ res.datas[i].moimLimit +'명</span>';
				_html += '</div>';
				_html += '<div class="moim-detail__column">';
				_html += '<span>'+ res.datas[i].moimTitle +'</span>';
				_html += '</div>';
				_html += '</div>';
				_html += '<div class="moim-angle">';
				_html += '<i class="fa-solid fa-angle-right"></i>'
				_html += '</div>';
				_html += '</div>';
			}
			$('#m_list').html(_html);

			for (var i=0 ; i < res.pager.pagelist.length; i++) {
				let add_class = '';
					if (res.pager.c_page == res.pager.pagelist[i]) {
						add_class = 'selected';
					}
					_page += '<button class="page-link '+ add_class +'" onclick="get_moim_list('+ res.pager.pagelist[i] +');">'+ res.pager.pagelist[i] +'</button>';
					
			}	
			$('#p_page').attr('onclick', 'get_moim_list('+ res.pager.p_page +');');
			if (res.pager.c_page == 1) {
				$('#p_page').prop('disabled', true);
				$('#p_btn').addClass('disabled');
			} else {
				$('#p_page').prop('disabled', false);
				$('#p_btn').removeClass('disabled');
			}
			$('#n_page').attr('onclick', 'get_moim_list('+ res.pager.n_page +');');

			if (res.pager.is_npage == false) {
				$('#n_page').prop('disabled', true);
				$('#n_btn').addClass('disabled');
			}else{
				$('#n_page').prop('disabled', false);
				$('#n_btn').removeClass('disabled');
			}
			$('#page_list').html(_page);

		},

		error : function(XMLHttpRequest, textStatus, errorThrown){
			alert('error');
		}
	})
}

function get_join_moim_list() {
	$.ajax({
		url:  "./join_list",
		type: "GET",
		dataType: "json",
		success: function(data) {
			let _html = '';
			for (var i=0 ; i < data.length ; i++) {
				_html += ' <div><a href="/somoim/moim/meeting?id='+ data[i].moimId +'"><span>'+ data[i].moimTitle +'</span></a></div>';
			}
			$('#join_list').html(_html);
		}
	});
}

function get_bmk_moim_list() {
	$.ajax({
		url:  "./bookmark_list",
		type: "GET",
		dataType: "json",
		success: function(data) {
			let _html = '';
			for (var i=0 ; i < data.length ; i++) {
				_html += ' <div><a href="/somoim/moim/meeting?id='+ data[i].moimId +'"><span>'+ data[i].moimTitle +'</span></a></div>';
			}
			$('#bookmark_list').html(_html);
		}
	});
}

$(document).ready(function() {
	let category = $(".icon__div>.icon--circle__cate");
	get_moim_list(1);
	get_join_moim_list();
	get_bmk_moim_list();
	
	$('.icon__div>.icon--circle__cate').on('mouseover', function() {
		$(this).addClass('hoverIcon');
	});
	$('.icon__div>.icon--circle__cate').on('mouseout', function() {
		$(this).removeClass('hoverIcon');
	});
	// 카테고리 서치
	$('.icon__div>.icon--circle__cate').on('click', function() {
		_this = $(this);
		let temp = _this.attr('id').split('_');
		category_id = temp[1];		
		if (_this.hasClass('selected') == false) {
			_this.addClass('selected');	
		} else {
			_this.removeClass('selected');
			category_id = 0;
		}
		$('.icon__div>.icon--circle__cate').each(function() {
			if (_this.children('input').val() != $(this).children('input').val()) {
				$(this).removeClass('selected');
			} 
		});
		get_moim_list(1);
	});
	
	$('#page_count').on('change', function() {
		get_moim_list(main_page);
	});
	$('#search_btn').on('click', function(){
		// 검색버튼 클릭시 함수호출
		get_moim_list(1);
	});
	$('#list_search').on('keydown', function(e) {
		if(e.keyCode == 13){
			e.preventDefault();
			get_moim_list(1);
		}
	});

});



</script>
  <script src="${path}/resources/js/category.js"></script>
  <script src="${path}/resources/js/components/popup.js"></script>
	<script src="${path}/resources/js/components/dropdown.js"></script>
</body>

</html>