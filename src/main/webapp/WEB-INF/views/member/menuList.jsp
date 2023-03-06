<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=0.8" />
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
<title>메뉴선택</title>
<script>
	$(document).ready(function() {
		$('.menu_tab').menuBar();
	});
</script>
</head>
<body>
	<div class="wrap">
		<div class="subhead">
			<ul>
				<li><a href="javascript:window.history.back();"><i class="fa-solid fa-chevron-left"></i></a></li>
				<li><span class="subtit">메뉴선택</span>
				<li><a href="http://localhost:8000/Oasis/member/cartList.oa"><i
						class="fa-solid fa-cart-shopping"></i></a></li>
			</ul>
		</div>
		<section class="menulist">
			<div class="st">
				<h3>${param.S_NAME}에서주문중!</h3>
			</div>
			<div class="menutablist">
				<ul class="menu_tab">
					<li class="coffee onon">커피</li>
					<li class="juice">주스</li>
					<li class="dessert">디저트</li>
					<li class="ade">에이드</li>
					<li class="smoothie">스무디</li>

				</ul>
				<div class="menuselect">
					<div class="coffee">
						<div>
							<ul>
								<c:forEach var="menu" items="${list}">
									<c:if test="${menu.P_CATEGORY eq 'C'}">
										<c:if test="${menu.S_SO eq 'N'}">
											<li><a
												href="<c:url value='/member/menuDetail.oa?STORE=${param.STORE}&P_IDX=${menu.P_IDX}'/>"><ul>
														<li><img
															src="<c:url value='/images/contents/${menu.P_IMG}'/>"
															alt="" /></li>
														<li>${menu.P_NAME}</li>
														<li>${menu.P_PRICE}</li>
													</ul></a></li>
										</c:if>
										<c:if test="${menu.S_SO eq 'Y'}">
											<li><ul>
													<li><img
														src="<c:url value='/images/contents/${menu.P_IMG}'/>"
														alt=""  /></li>
													<li>${menu.P_NAME}<span class="soldout">품절</span></li>
													<li>${menu.P_PRICE}</li>
												</ul></li>
										</c:if>
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="juice" style="display: none;">
						<div>
							<ul>
									<c:forEach var="menu" items="${list}">
									<c:if test="${menu.P_CATEGORY eq 'J'}">
										<c:if test="${menu.S_SO eq 'N'}">
											<li><a
												href="<c:url value='/member/menuDetail.oa?STORE=${param.STORE}&P_IDX=${menu.P_IDX}'/>"><ul>
														<li><img
															src="<c:url value='/images/contents/${menu.P_IMG}'/>"
															alt="" /></li>
														<li>${menu.P_NAME}</li>
														<li>${menu.P_PRICE}</li>
													</ul></a></li>
										</c:if>
										<c:if test="${menu.S_SO eq 'Y'}">
											<li><ul>
													<li><img
														src="<c:url value='/images/contents/${menu.P_IMG}'/>"
														alt=""  /></li>
													<li>${menu.P_NAME}<span class="soldout">품절</span></li>
													<li>${menu.P_PRICE}</li>
												</ul></li>
										</c:if>
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</div>

					<div class="dessert" style="display: none;">
						<div>
							<ul>
									<c:forEach var="menu" items="${list}">
									<c:if test="${menu.P_CATEGORY eq 'D'}">
										<c:if test="${menu.S_SO eq 'N'}">
											<li><a
												href="<c:url value='/member/menuDetail.oa?STORE=${param.STORE}&P_IDX=${menu.P_IDX}'/>"><ul>
														<li><img
															src="<c:url value='/images/contents/${menu.P_IMG}'/>"
															alt="" /></li>
														<li>${menu.P_NAME}</li>
														<li>${menu.P_PRICE}</li>
													</ul></a></li>
										</c:if>
										<c:if test="${menu.S_SO eq 'Y'}">
											<li><ul>
													<li><img
														src="<c:url value='/images/contents/${menu.P_IMG}'/>"
														alt=""  /></li>
													<li>${menu.P_NAME}<span class="soldout">품절</span></li>
													<li>${menu.P_PRICE}</li>
												</ul></li>
										</c:if>
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="ade" style="display: none;">
						<div>
							<ul>
									<c:forEach var="menu" items="${list}">
									<c:if test="${menu.P_CATEGORY eq 'A'}">
										<c:if test="${menu.S_SO eq 'N'}">
											<li><a
												href="<c:url value='/member/menuDetail.oa?STORE=${param.STORE}&P_IDX=${menu.P_IDX}'/>"><ul>
														<li><img
															src="<c:url value='/images/contents/${menu.P_IMG}'/>"
															alt="" /></li>
														<li>${menu.P_NAME}</li>
														<li>${menu.P_PRICE}</li>
													</ul></a></li>
										</c:if>
										<c:if test="${menu.S_SO eq 'Y'}">
											<li><ul>
													<li><img
														src="<c:url value='/images/contents/${menu.P_IMG}'/>"
														alt=""  /></li>
													<li>${menu.P_NAME}<span class="soldout">품절</span></li>
													<li>${menu.P_PRICE}</li>
												</ul></li>
										</c:if>
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="smoothie" style="display: none;">
						<div>
							<ul>
									<c:forEach var="menu" items="${list}">
									<c:if test="${menu.P_CATEGORY eq 'S'}">
										<c:if test="${menu.S_SO eq 'N'}">
											<li><a
												href="<c:url value='/member/menuDetail.oa?STORE=${param.STORE}&P_IDX=${menu.P_IDX}'/>"><ul>
														<li><img
															src="<c:url value='/images/contents/${menu.P_IMG}'/>"
															alt="" /></li>
														<li>${menu.P_NAME}</li>
														<li>${menu.P_PRICE}</li>
													</ul></a></li>
										</c:if>
										<c:if test="${menu.S_SO eq 'Y'}">
											<li><ul>
													<li><img
														src="<c:url value='/images/contents/${menu.P_IMG}'/>"
														alt=""  /></li>
													<li>${menu.P_NAME}<span class="soldout">품절</span></li>
													<li>${menu.P_PRICE}</li>
												</ul></li>
										</c:if>
									</c:if>
								</c:forEach>
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

<script src="<c:url value='/js/tab2.js'/>"></script>
</html>