<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=0.8" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/default.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/member/main.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/member/sub.css'/>" />
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
						<form id="searchForm" action="<c:url value='' />" method="get">
							<%-- 					<c:choose> --%>
							<%-- 						<c:when test="${param.keyword eq 'null'}"> --%>
							<input class="searchtext" type="text" name="keyword" value=" " />
							<%-- 						</c:when> --%>
							<%-- 						<c:otherwise> --%>
							<!-- 							<input  class="searchtext"  type="text" name="keyword" -->
							<%-- 								value="<c:out value='${param.keyword}'/>" /> --%>
							<%-- 						</c:otherwise> --%>
							<%-- 					</c:choose> --%>
							<button class="btn btn-default sbtn">
								<i class="fa-solid fa-magnifying-glass"></i>
							</button>
						</form>
					</div>




					<div class="mapline">
						<div id="map" style="width: 100%; height: 97%;"></div>
					</div>
					<div class="storelist">
						<ul class="storeul">
							<c:forEach var="item" items="${list}">
								<li class="listline">
									<ul class="ulinner">
										<li class="innerl"><img src="images/common/logo.png"></li>
										<li class="innerl"><strong>${item.S_NAME}</strong>
										<li class="innerl">${item.ADDRESS1}</li>
										<li class="innerl">
										<li class="mo" id="storemodal"><input type="hidden"
											value="${item.STORE}" name="s_name"> <input
											type="hidden" id="${item.ADDRESS1}" name="address1">
											<input type="hidden" value="${item.ADDRESS2}" name="address2">
											<input type="hidden" value="${item.S_PHONE}" name="s_phone">

										</li>

									</ul>
								</li>
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
											<li class="innerl">${item2.ADDRESS1}</li>
											<li class="innerl"><c:if test="${item2.BS_NAME} not empty"><i class="fa-regular fa-star"></i></c:if>흠</li>

											<li class="mo" id="storemodal"><input type="hidden"
												value="${item2.S_NAME}" name="s_name"> <input
												type="hidden" id="${item2.ADDRESS1}" name="address1">
												<input type="hidden" value="${item2.ADDRESS2}"
												name="address2"> <input type="hidden"
												value="${item2.S_PHONE}" name="s_phone"></li>

										</ul>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div id="mapinfo" style="display: none; position: absolute;">
				장난해?<span class="makerinfo2"></span>
			</div>

			<div id="storemodal" class="modal-overlay wrap">
				<div class="modal-window wrap">
					<div class="modalcon">
						<div class="m_title">
							<div class="close-area">X</div>
							<h3>
								<span class="storename"></span><i class="fa-regular fa-star"></i>
							</h3>
							<span id="name"></span> <span></span>

							<div class="storebtn">
								<button type="button" id='modalstoreBtn'>주문하기</button>
							</div>
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
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨
	};

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	//마커를 표시할 위치입니다 
	var position = new kakao.maps.LatLng(33.450701, 126.570667);

	//마커를 생성합니다
	var marker = new kakao.maps.Marker({
		position : position,
		clickable : true
	// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
	});

	//아래 코드는 위의 마커를 생성하는 코드에서 clickable: true 와 같이
	//마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
	//marker.setClickable(true);

	//마커를 지도에 표시합니다.
	marker.setMap(map);

	//마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
	// var iwContent = '<div class="markerinfo" style="padding:5px;">Hello World!</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	// iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

	//인포윈도우를 생성합니다
	// var infowindow = new kakao.maps.InfoWindow({
	// content : iwContent,
	// removable : iwRemoveable
	// });

	//마커에 클릭이벤트를 등록합니다
	kakao.maps.event.addListener(marker, 'click', function() {

	});
</script>


</html>