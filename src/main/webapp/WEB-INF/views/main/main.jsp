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
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<meta charset="UTF-8">
<title>Flee</title>

</head>
<body id="main">
	
	<section class="maintop"> 
		<div class="wrap">
		<div class="logo">
			<a href="index.html"><img src="images/common/logo.png" alt="로고" /></a>
		</div>
		<div class="adtext">
			<p>2023년 흑묘년</p>
			<p class="ptwo">O! <span class="pointcolor">신메뉴</span>와 함께해요!</p>
		</div>
	</div>
	</section>
	<section class="myinfo">
		<div class="infobox">
			<div class="inforight">
				<stong>00</stong>님
			</div>
			<div class="infoleft">
				<ul>
					<li>Ostamp</li>
					<li><strong>숫자</strong> / 10★ </li>
					<li class="stampbar"><progress id="progress" value="50" min="0" max="100"></progress></li>
				</ul>
			</div>
			<div class="booklink"><ul>
				<li>COUPON<i class="fa-solid fa-ticket"></i></li>
				<li>BOOKMARK<i class="fa-regular fa-bookmark"></i></li>
			</ul> </div>
		</div>
	</section>
	<section class="mainslide">
		<div class="imgslide">
				<ul>
					<li>
						<a href="#">
							<span class="pic"><img src="images/contents/banner1.jpg" alt="" /></span>
							
						</a>
					</li>
					<li>
						<a href="#">
							<span class="pic"><img src="" alt="" /></span>
	
						</a>
					</li>
					<li>
						<a href="#">
							<span class="pic"><img src="" alt="" /></span>

						</a>
					</li>
					<li>
						<a href="#">
							<span class="pic"><img src="" alt="" /></span>

						</a>
					</li>
					<li>
						<a href="#">
							<span class="pic"><img src="" alt="" /></span>

						</a>
					</li>
				</ul>
		</div>			
	</section>
	<section class="mainmenulist">
		<h3>추천메뉴</h3>
		<div class="menuslide">
			<ul>
				<li><img src="images/contents/menutest1.png" alt="" /></li>
				<li><img src="images/contents/menutest2.png" alt="" /></li>
				<li><img src="images/contents/menutest3.png" alt="" /></li>
				<li><img src="images/contents/menutest4.png" alt="" /></li>
				<li><img src="images/contents/menutest5.png" alt="" /></li>
				<li><img src="images/contents/menutest6.png" alt="" /></li>
				<li><img src="images/contents/menutest7.png" alt="" /></li>
			</ul>

		</div>
	</section>

	<section class="aboutO">
		<span>회사소개</span>
		<div id="map" style="width:390px;height:400px;"></div>
	

	</section>


</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=17abac5a86d69afad0326b67e47cbd88"></script>
<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
</html>