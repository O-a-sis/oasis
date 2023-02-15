<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=17abac5a86d69afad0326b67e47cbd88&libraries=services"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/modal.css'/>" />
</head>
<body>
	<div id="map" style="width: 600px; height: 500px;"></div>
	<c:forEach var="item" items="${list}">
		<div>
			<input type="hidden" name="address" class="de_add"
				value="${item.ADDRESS1} ${item.ADDRESS2}" /> <input type="hidden"
				name="S_NAME" value="${item.S_NAME}" /> <input type="hidden"
				name="S_STATUS" value="${item.S_STATUS}" /><input type="hidden"
				name="STORE" value="${item.STORE}" />
		</div>
	</c:forEach>
	<!-- 모달 -->
	<div id="modal" class="modal-overlay wrap">
		<div class="modal-window wrap">
			<div class="modalcon">
				<div class="m_title">
					<h3>
						<span class="storename"></span><i class="fa-regular fa-star"></i>
					</h3>
					<span id="status"></span> <span id="address"></span>

					<div class="storebtn">
						<input type="hidden" id="store" name="store" />
						<button type="button" id='modalstoreBtn'>주문하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 스크립트 -->
	<script>
		var imageSrc = './images/common/oasis2.png', // 마커이미지의 주소입니다    
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
				'store' : $("input[name=STORE]").eq(i).val()
			});
		}

		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

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

					geocoder.addressSearch(addressArray[i].groupAddress,
							function(result, status) {
								// 정상적으로 검색이 완료됐으면 
								if (status === kakao.maps.services.Status.OK) {

									var coords = new kakao.maps.LatLng(
											result[0].y, result[0].x);

									// 결과값으로 받은 위치를 마커로 표시합니다
									var marker = new kakao.maps.Marker({
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
									kakao.maps.event.addListener(marker,
											'click', makeClickListener(map,
													storeContent));

									marker.setMap(map);
								}
							});
				}

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
		let modal = $("#modal");
		let storename = $(".storename");
		let status = $("#status");
		let address = $("#address");
		let store = $("#store");
		let modalstoreBtn = $("#modalstoreBtn");

		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeClickListener(map, storeContent) {
			return function() {
				storename.html(storeContent.name);
				status.html(storeContent.status);
				address.html(storeContent.groupAddress);
				store.val(storeContent.store);
				modal.removeAttr('class').addClass('modalon');
			};
		}

		// 모달 외부영역 클릭 시 모달 닫힘
		$(document).mouseup(function(e) {
			if (modal.has(e.target).length === 0) {
				modal.removeAttr('class').addClass('out');
			}
		});
		
		$(modalstoreBtn).on("click", function(){
			
		});
	</script>
</body>
</html>
