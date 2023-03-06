
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
<%@ include file="/WEB-INF/include/include-header.jspf"%>
<meta charset="UTF-8">
<title>메뉴선택</title>

</head>
<body>
	<div class="wrap">
		<div class="subhead">
			<ul>
				<li><a href="javascript:window.history.back();"><i class="fa-solid fa-chevron-left"></i></a></li>
				<li><span class="subtit">주문내역</span>
			</ul>
		</div>
		<section id="myOrderlist">
			<h4>
				<strong>${sessionScope.B_NAME}</strong>님께서<br>주문한 주문내역입니다.
			</h4>
			<span>클릭시 상세내역을 확인할 수 있습니다.</span>
			<div class="olist">
				<ul class="more">
					<c:forEach var="item" items="${list}">
						<li class="oli"><a
							href='/Oasis/member/myOrderDetail.oa?O_IDX=${item.O_IDX }&B_PHONE=${param.OB_IDX}&OCU_IDX=${item.OCU_IDX }'><ul>
									<li><c:if test="${item.O_PICK  eq '0' }">
											<c:out value="픽업" />
										</c:if> <c:if test="${item.O_PICK  eq '1' }">
											<c:out value="매장" />
										</c:if></li>
									<li>${item.OS_NAME}<span
										style="font-size: 13px; border: 1px solid orange; border-radius: 15px; padding: 3px 5px; color: orange;">
											<c:choose>
												<c:when test="${item.O_STATUS  eq '1' }">
													주문접수
												</c:when>
												<c:when test="${item.O_STATUS  eq '2' }">
													제조중
												</c:when>
												<c:otherwise>
													제조완료
												</c:otherwise>
											</c:choose>
									</span><br> <span style="font-size: 14px; font-weight: 300">${item.O_CONTENT}</span></li>
									<li><fmt:formatDate value="${item.O_DATE}"
											pattern="yyyy-MM-dd" /></li>
									<li></li>

								</ul></a></li>
					</c:forEach>
				</ul>
				</div>
			<div class="notice_view_more" style="">
				<p>
					<button class="loadmore" onClick="loadMore()">더보기<i class="fa-solid fa-chevron-down"></i></button>
					<input type="hidden" id="page" />
				</p>
			</div>
		</section>
	</div>

</body>

<script>
   function loadMore() {      
      var page = $("#page").val() == '' ? 2 : $("#page").val();
      console.log(page);
      var type = '${param.type}';
      var keyword = '${param.keyword}';
      var B_PHONE = '${param.B_PHONE}';

      $.ajax({
         url : '/Oasis/member/loadMoreOrderList.oa',
         type : 'GET',
         data : {
                 B_PHONE : B_PHONE,
               page : page,
               type : type,
               keyword : keyword
               },
               success : function(data) {
                  if (data.list.length > 0) {
                     var html = '';
                     $.each(
                        data.list,
                        function(index, item) {
                                    
                        // item.O_DATE를 Date 객체로 변환합니다.
                        var date = new Date(item.O_DATE);
                        // 연도를 가져옵니다.
                        var year = date.getFullYear();
                        // 월을 가져옵니다. month는 0부터 시작하므로 1을 더해줍니다.
                        var month = ('0' + (date.getMonth() + 1)).slice(-2);
                        // 일을 가져옵니다.
                        var day = ('0' + date.getDate()).slice(-2);
                        // 연도, 월, 일을 합쳐서 YYYY-MM-DD 형식의 문자열을 만듭니다.
                        var formattedDate = year + '-' + month + '-' + day;
                                    
                        html += '<li class="oli"><a href="/Oasis/member/myOrderDetail.oa?O_IDX='
                            + item.O_IDX
                            + '&B_PHONE='
                            + item.OB_IDX
                            + '&OCU_IDX='
                            + item.OCU_IDX
                            + '"><ul>';
                        html += '<li>';
                     if (item.O_PICK == '0') {
                         html += '픽업';
                     } else if (item.O_PICK == '1') {
                        html += '매장';
                     }
                        html += '</li>';
                        html += '<li>' + item.OS_NAME
                       		+ '<span style="font-size: 13px; border: 1px solid orange; border-radius: 15px; padding: 3px 5px; color: orange;">';
                       		if (item.O_STATUS == '1') {
                                html += '접수대기';
                            } else if (item.O_STATUS == '2') {
                               html += '제조중';
                            }else{
                            	 html += '제조완료';
                            }	
                       	html += '</span><br><span style="font-size: 14px; font-weight: 300">'
                       		+ item.O_CONTENT + '</span></li>';
                        html += '<li>' + formattedDate
                             + '</li>';
                        html += '<li></li>';
                        html += '</ul></a></li>';
                                 
                     });
                     
                     $('.olist .more').append(html);
                     var paging = data.paging;
                     if (paging.currentPage < paging.totalPage) {
                        $("#page").val(paging.currentPage + 1);
                     } else {
                        $('.notice_view_more').hide();
                     }
                  }
               }
            });
   } 
</script>
</html>