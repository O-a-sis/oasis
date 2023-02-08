<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴바</title>
</head>
<body>

			<h2>${map.B_NICKNAME } 님</h2>

			<table>
			<tr>
					<th width="170">멤버십</th>
					<td><a href = '/Oasis/member/myCouponList.oa?CUB_IDX=${map.B_PHONE }'>쿠폰</a></td>
					<td><a href = '/Oasis/member/myStamp.oa?B_PHONE=${map.B_PHONE }'>스탬프</a></td>
			</tr>
			
			<tr>
					<th width="170">주문</th>
					<td><a href =  '/Oasis/member/myOrderList.oa?OB_IDX=${map.B_PHONE }'>주문내역</a></td>
			</tr>
			
			<tr>
					<th width="170">새소식</th>
					<td><a href = '/Oasis/noticeList.oa'>공지사항</a></td>
			</tr>
			
			<tr>
					<th width="170">약관 및 정책</th>
					<td><a href = '/Oasis/이용약관.oa'>이용약관</a></td>
			</tr>
			</table>
			
		
</body>
</html>