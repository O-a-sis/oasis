<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=17abac5a86d69afad0326b67e47cbd88&libraries=services"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/default.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/member/main.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/member/sub.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/modal.css'/>" />
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<meta charset="UTF-8">
<title>매장찾기</title>
<script type="text/javascript">
	$(document).ready(function() {
		$('.store_tab').menuBar();
	});
</script>
</head>
<body>
	<div class="wrap">
		<div class="subhead">
			<ul>
				<li><i class="fa-solid fa-chevron-left"></i></li>
				<li><span class="subtit">매장선택</span>
			</ul>
		</div>
		<section class="store">
			<ul class="store_tab">
				<li class="tab_search onon">검색</li>
				<li class="tab_mark">즐겨찾기</li>
			</ul>
			<div class="tabon">
				<div class="store_search tab_search">
					<div class="search">

						<input class="searchtext" type="text" name="keyword" />

						<button class="btn btn-default sbtn" id="searchbtn">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>

					</div>




					<div class="mapline">
						<div id="map" style="width: 100%; height: 97%;"></div>
					</div>
					<div class="storelist">
						<ul class="storeul">
							<c:forEach var="item" items="${list}">
								<div>
									<input type="hidden" name="address" class="de_add"
										value="${item.ADDRESS1} ${item.ADDRESS2}" /> <input
										type="hidden" name="S_NAME" value="${item.S_NAME}" /> <input
										type="hidden" name="S_STATUS" value="${item.S_STATUS}" /><input
										type="hidden" name="STORE" value="${item.STORE}" /> <input
										type="hidden" name="B_IDX" id="B_IDX" value="${item.B_IDX}" /><input
										type="hidden" name="check" id="check" value="${item.check}" />
								</div>
							</c:forEach>
						</ul>
					</div>
				</div>

				<div class="store_mark" style="display: none;">
					<div>
						<h4>내가 즐겨찾는 매장</h4>
					</div>
					<div class="mapper">
						<div class="storelist2">
							<ul>
								<c:forEach var="item2" items="${book}">
									<li class="listline">
										<ul class="ulinner">
											<li class="innerl"><img src="images/common/logo.png"></li>
											<li class="innerl"><strong>${item2.S_NAME}</strong>
											<li class="innerl">${item2.ADDRESS1}${item2.ADDRESS2}</li>
											<li class="innerl">
												<div class="bookmark1">
													<span class="on"><i class="fa-solid fa-star"></i></span> <input
														type="hidden" value="${item2.BS_NAME}" name="bs_name">
													<input type="hidden" id="${item2.ADDRESS1}" name="address1">
													<input type="hidden" value="${item2.ADDRESS2}"
														name="address2"> <input type="hidden"
														value="${item2.S_PHONE}" name="s_phone"><input
														type="hidden" value="${item2.B_IDX}" name="b_idx"><input
														type="hidden" value="${item2.B_STORE}" name="b_store">
												</div>
											</li>
										</ul>
										<button class="sbtn"
											onclick="javascript:location.href='/Oasis/member/menuList.oa?S_NAME=${item2.BS_NAME}&STORE=${item2.B_STORE}'">주문하기</button>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>


			<div id="smodal" class="modal-overlay wrap">
				<div class="modal-window wrap">
					<div class="modalcon">
						<div class="m_title">
							<ul>
								<li><span id="status"></span></li>
								<li><span class="storename"></span></li>
								<li>
									<div class="bookmark">
										<span class="off"><i class="fa-regular fa-star"></i></span>
									</div>
								</li>

								<li><span id="address"></span></li>
								<li>
									<div class="storebtn">
										<input type="hidden" id="store" name="store" /> <input
											type="hidden" id="bidx" name="bidx" />
										<button type="button" id='modalstoreBtn'>주문하기</button>
									</div>
								</li>

							</ul>

						</div>
					</div>
				</div>
			</div>

		</section>
	</div>
</body>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=17abac5a86d69afad0326b67e47cbd88">
	
</script>
<script src="<c:url value='/js/tab.js'/>"></script>
<script src="<c:url value='/js/map.js'/>"></script>
<script src="<c:url value='/js/bookmark.js'/>"></script>
<!-- 스크립트 -->
<script>
	var imageSrc = '../images/common/opin.png', // 마커이미지의 주소입니다    
	imageSize = new kakao.maps.Size(40, 40), // 마커이미지의 크기입니다
	imageOption = {
		offset : new kakao.maps.Point(27, 69)
	}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
			imageOption);

	var addressArray = [];
	var addList = $(".de_add");

	// DB에서 가져온 값을 객체에 담기
	for (var i = 0; i < addList.length; i++) {
		addressArray.push({
			'groupAddress' : $("input[name=address]").eq(i).val(),
			'name' : $("input[name=S_NAME]").eq(i).val(),
			'status' : $("input[name=S_STATUS]").eq(i).val() == 0 ? '영업종료'
					: '영업 중',
			'store' : $("input[name=STORE]").eq(i).val(),
			'bidx' : $("input[name=B_IDX]").eq(i).val(),
			'check' : $("input[name=check]").eq(i).val()
		});
	}

	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {

		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation
				.getCurrentPosition(function(position) {

					var lat = position.coords.latitude, // 위도
					lon = position.coords.longitude; // 경도

					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new kakao.maps.LatLng(lat, lon), // 지도의 중심좌표
						level : 3
					// 지도의 확대 레벨
					};

					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption);

					var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
					message = '<div>현위치</div>'; // 인포윈도우에 표시될 내용입니다

					// 주소-좌표 변환 객체를 생성합니다
					let geocoder = new kakao.maps.services.Geocoder();

					for (let i = 0; i < addressArray.length; i++) {

						geocoder
								.addressSearch(
										addressArray[i].groupAddress,
										function(result, status) {
											// 정상적으로 검색이 완료됐으면 
											if (status === kakao.maps.services.Status.OK) {

												var coords = new kakao.maps.LatLng(
														result[0].y,
														result[0].x);

												// 결과값으로 받은 위치를 마커로 표시합니다
												var marker = new kakao.maps.Marker(
														{
															map : map,
															position : coords,
															image : markerImage,
															clickable : true
														// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
														});

												// 마커를 클릭했을 때 표시할 인포를 생성합니다
												var storeContent = addressArray[i];

												// 마커에 mouseover 이벤트와 click 이벤트를 등록합니다
												// 이벤트 리스너로는 클로저를 만들어 등록합니다 
												// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
												kakao.maps.event.addListener(
														marker, 'click',
														makeClickListener(map,
																storeContent));

												marker.setMap(map);
											}
										});
					}
					// 검색기능
					let sbtn = document.getElementById("searchbtn");
					sbtn
							.addEventListener(
									"click",
									function(e) {
										let searchtext = $(".searchtext").val();
										if (searchtext == null
												|| searchtext.length == 0) { // 검색어 입력안했을 시
											alert("지점명을 입력하세요");
										} else {
											for (let i = 0; i < addressArray.length; i++) {

												if (addressArray[i].name
														.includes(searchtext)) { // 지점명 검색
													geocoder
															.addressSearch(
																	addressArray[i].groupAddress,
																	function(
																			result,
																			status) {
																		// 정상적으로 검색이 완료됐으면 
																		if (status === kakao.maps.services.Status.OK) {

																			var coords = new kakao.maps.LatLng(
																					result[0].y,
																					result[0].x);

																			map
																					.panTo(coords);
																		}
																	});
													break;
												}
											}
										}
									});

					// 마커와 인포윈도우를 표시합니다
					displayMarker(locPosition, message, map);
				});

	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

		var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

		displayMarker(locPosition, message);
	}

	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message, map) {

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			map : map,
			position : locPosition
		});

		var iwContent = message; // 인포윈도우에 표시할 내용

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			content : iwContent
		});

		// 인포윈도우를 마커위에 표시합니다 
		infowindow.open(map, marker);
	}
</script>
<script type="text/javascript">
	// 모달관련 변수
	let modal = $("#smodal");
	let storename = $(".storename");
	let status = $("#status");
	let address = $("#address");
	let store = $("#store");
	let bidx = $("#bidx");
	let modalstoreBtn = $("#modalstoreBtn");
	let bookmark = $(".bookmark").find("span");
	let icon = $(".bookmark span").find("i");

	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeClickListener(map, storeContent) {
		return function() {
			storename.html(storeContent.name);
			status.html(storeContent.status);
			address.html(storeContent.groupAddress);
			store.val(storeContent.store);
			if (storeContent.check == "true") {
				bookmark.removeAttr('class').addClass('on');
				icon.removeAttr('class').addClass('fa-solid fa-star');
				bidx.val(storeContent.bidx);
			} else {
				bookmark.removeAttr('class').addClass('off');
				icon.removeAttr('class').addClass('fa-regular fa-star');
			}
			modal.removeAttr('class').addClass('modalon');
		};
	}

	// 모달 외부영역 클릭 시 모달 닫힘
	$(document).mouseup(function(e) {
		if (modal.has(e.target).length === 0) {
			modal.removeAttr('class').addClass('out');
		}
	});

	$(modalstoreBtn).on(
			"click",
			function() {
				location.href = "/Oasis/member/menuList.oa?S_NAME="
						+ storename.html() + "&STORE=" + store.val();
			});

	$(".bookmark").on("click", "span", function() {
		let mark = $(this);
		let bookmoal = $(".storeul div");
		if ($(this).attr("class") == "off") {

			let bookmark = {
				BB_IDX : '${sessionScope.B_PHONE}',
				BS_NAME : storename.html(),
				B_STORE : store.val()
			};

			console.log(bookmark)

			bookmarkService.add(bookmark, function(result) {
				bidx.val(result);
			});

			$(this).attr("class", "on");
			$(this).find("i").attr("class", "fa-solid fa-star");

		} else {
			let bookmark = {
				B_IDX : bidx.val()
			};
			console.log(bookmark)

			bookmarkService.remove(bookmark, function(result) {
			});
			$(this).attr("class", "off");
			$(this).find("i").attr("class", "fa-regular fa-star");

		}
	});
</script>
<script type="text/javascript">
	$(".bookmark1").on("click", "span", function() {
		let mark = $(this);
		let bookmoal = $(".storeul div");
		if ($(this).attr("class") == "off") {

			let bookmark = {
				BB_IDX : '${sessionScope.B_PHONE}',
				BS_NAME : $('input[name=bs_name]').val(),
				B_STORE : $('input[name=b_store]').val()
			};

			console.log(bookmark)

			bookmarkService.add(bookmark, function(result) {
				bidx.val(result);
			});

			$(this).attr("class", "on");
			$(this).find("i").attr("class", "fa-solid fa-star");

		} else {
			let bookmark = {
				B_IDX : $('input[name=b_idx]').val()
			};
			console.log(bookmark)

			bookmarkService.remove(bookmark, function(result) {
			});
			$(this).attr("class", "off");
			$(this).find("i").attr("class", "fa-regular fa-star");

		}
	});
</script>
</html>