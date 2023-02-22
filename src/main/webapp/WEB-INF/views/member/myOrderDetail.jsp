<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역 상세</title>
</head>
<body>
	<div style="text-align: center;">
		<h2>주문내역</h2>
		<div>
			<tr>
				<%--매장이름 --%>
				<td>${map.OS_NAME}</td>
			</tr>
		</div>
		<div>
			<tr>
				<%--주문번호 --%>
				<th width="170">주문번호</th>
				<td>${map.O_IDX}</td>
			</tr>
		</div>	
		<div>
			<tr>
				<%-- 주문날짜 --%>
				<td>${map.O_DATE}</td>
			</tr>
		</div>
		<div>
			<c:choose>
				<c:when test="${map.O_STATUS  eq '1' }">
					<span style="color: orange;">주문접수</span>
					<span>제조중</span>
					<span>제조완료</span>
				</c:when>
				<c:when test="${map.O_STATUS  eq '2' }">
					<span>주문접수</span>
					<span style="color: orange;">제조중</span>
					<span>제조완료</span>
				</c:when>
				<c:otherwise>
					<span>주문접수</span>
					<span>제조중</span>
					<span style="color: orange;">제조완료</span>
				</c:otherwise>

			</c:choose>
		</div>

			<div><th width="170">주문한 메뉴</th>
			 <c:forEach var="item" items="${list}">
			 <div>
			<div>${item.OM_NAME }</div>
			<div><img src="<c:url value='/images/contents/${item.OM_IMG}.png' />" /></div>
			<div>${item.OM_OP }</div>
			<div>${item.OM_COUNT } 개</div>
			<div>${item.OM_PRICE * item.OM_COUNT} 원</div>
			</div>
			</c:forEach>
			</div>
		<div>
			</div>
			<div>
				
				<tbody>
    <c:set var="totalPrice" value="0" />
    <c:forEach var="item" items="${list}">
    
      <c:set var="totalPrice" value="${totalPrice + item.OM_PRICE * item.OM_COUNT}" />
    </c:forEach>
  </tbody>
  <tfoot>
  <div>
    <tr>
   
      <td colspan="3">총 주문 가격:</td>
      <td>${totalPrice + map2.CU_PRICE } 원	</td>
    </tr>
    </div>
  </tfoot>
</div>
		
		<div>
				할인 금액 :${map2.CU_PRICE } 원 </br>
		</div>		
						
		<div>
				결제 금액 : ${totalPrice } 원 
			</div>
			
		<div>
				적립된 스탬프 : ${map.O_COUNT} 개
		</div>
		
</body>
<script>
	
</script>
</html>