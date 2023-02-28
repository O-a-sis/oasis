<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<style>
.button {
	border-radius: 7px;
	font-size: 16px;
	width: 100px;
}
</style>
<meta charset="UTF-8">
<title>상품등록</title>
</head>
<body>
	<div>
		<h1 style="display: inline" onclick="location.href='<c:url value="main.oa"/>'">오아시스</h1>
		<h3 style="display: inline">관리자</h3>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<h2 style="color: #ff6600; display: inline"
			onclick="location.href='<c:url value="todaysOrders.oa"/>'">
			<strong>지점관리</strong>
		</h2>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<h2 style="color: #ff6600; display: inline"
			onclick="location.href='<c:url value="productList.oa"/>'">
			<strong>상품관리</strong>
		</h2>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<h2 style="color: #ff6600; display: inline"
			onclick="location.href='<c:url value="noticeList.oa"/>'">
			<strong>공지사항</strong>
		</h2>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<h2 style="color: #ff6600; display: inline"
			onclick="location.href='<c:url value="ordersAllList.oa"/>'">
			<strong>사이트관리</strong>
		</h2>

	</div>
	<br>
	<div
		style="height: 20px; width: 100%; background-color: #ff6600;">
	</div>
	<br><br>
	<div>
	<form method="post" action="/Oasis/admin/productRegister.oa" enctype="multipart/form-data" onSubmit="return submitCheck();">
		  <div class="form-group">
            <strong><label>제품 이름</label></strong> &nbsp;&nbsp;<input class="form-control" name='P_NAME'>
          </div>
          
          <div class="form-group">
            <strong><label>제품 가격</label></strong> &nbsp;&nbsp;<input class="form-control" name='P_PRICE'>원
          </div>
		
		  <br>
          <div class="form-group">
            <strong><label>제품 설명</label></strong> <br>
            <textarea class="form-control" rows="3" name='P_CONTENT' style="width: 270px; height: 145px;"></textarea>
          </div>
          <br>
          
	  <div class="panel-heading"><strong>제품 이미지</strong></div>
        <div class="form-group uploadDiv">
            <input type="file" name='P_IMG'>
        </div>
        
        <div>
			<img id="preview" style="width: 40%" />
		</div>

		<script>
            function readURL(input) {
                if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                document.getElementById('preview').src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
            } else {
                document.getElementById('preview').src = "";
            }
          }
         </script>

      </div>
	<br><br>
	<div>
	<button type="submit" class="button" style="color: white; background: orange">등록하기</button></td>
	&nbsp;
	<button type="reset" class="button" style="color: white; background: blue">리셋</button></td>
	</form>
	</div>
</body>
<script>
function readImage(input) {
	// 인풋 태그에 파일이 있는 경우
	if(input.files && input.files[0]) {
		// 이미지 파일인지 검사 (생략)
		
		// FileReader 인스턴스 생성
		const reader = new FileReader();
		
		// 이미지가 로드가 된 경우
		reader.onload = e => {
			const previewImage = document.getElementById("preview-image");
			previewImage.src = e.target.result;
		};
		
		// reader가 이미지 읽도록 하기
		reader.readAsDataURL(input.files[0]);
	}	
}
</script>

</html>