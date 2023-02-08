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
	href="<c:url value='/css/main.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/sub.css'/>" />
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
						<div id="map" style="width: 330px; height: 200px;"></div>
					</div>
					<div class="storelist">
						<ul>
							<li class="listline">
								<ul class="ulinner">
									<li class="innerl"><img src="images/common/logo.png"></li>
									<li class="innerl"><strong>종각점</strong>
									<li class="innerl">주소주소주소</li>
									<li class="innerl"><i class="fa-regular fa-star"></i></li>
								</ul>

							</li>
							<li class="listline">
								<ul class="ulinner">
									<li class="innerl"><img src="images/common/logo.png"></li>
									<li class="innerl"><strong>성균관대점</strong>
									<li class="innerl">주소주소주소</li>
									<li class="innerl"><i class="fa-regular fa-star"></i></li>
								</ul>

							</li>
						</ul>
					</div>
				</div>

				<div class="store_mark" style="display: none;">
				<div ><h4>내가 즐겨찾는 매장</h4></div>
				<div class="mapper">
					<div class="storelist2">
						<ul>
							<li class="listline">
								<ul class="ulinner">
									<li class="innerl"><img src="images/common/logo.png"></li>
									<li class="innerl"><strong>종각점</strong>
									<li class="innerl">주소주소주소</li>
									<li class="innerl"><i class="fa-regular fa-star"></i></li>
								</ul>

							</li>
							<li class="listline">
								<ul class="ulinner">
									<li class="innerl"><img src="images/common/logo.png"></li>
									<li class="innerl"><strong>성균관대점</strong>
									<li class="innerl">주소주소주소</li>
									<li class="innerl"><i class="fa-regular fa-star"></i></li>
								</ul>

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
<script>
	var container = document.getElementById('map');
	var options = {
		center : new kakao.maps.LatLng(33.450701, 126.570667),
		level : 3
	};

	var map = new kakao.maps.Map(container, options);
</script>

</html>