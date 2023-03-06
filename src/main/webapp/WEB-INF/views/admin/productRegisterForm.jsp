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
		<h1 style="display: inline" onclick="location.href='<c:url value="storeList.oa"/>'">오아시스</h1>
		<h3 style="display: inline">관리자</h3>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<h2 style="color: #ff6600; display: inline"
			onclick="location.href='<c:url value="storeList.oa"/>'">
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
			onclick="location.href='<c:url value="memberList.oa"/>'">
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
            <strong><label>제품 가격</label></strong> &nbsp;&nbsp;<input type="text" id="board_price" name="P_PRICE" onkeyup="inputNumberFormat(this)"/> 원
          </div>
          
          <div class="form-group">
            <strong><label>제품 카테고리</label></strong> &nbsp;&nbsp;
            <select name="P_CATEGORY">
              <option value="C">커피</option>
              <option value="J">주스</option>
              <option value="A">에이드</option>
              <option value="S">스무디</option>
              <option value="D">디저트</option>
            </select>
          </div>
		  <br>
          <div class="form-group">
            <strong><label>제품 설명</label></strong> <br>
            <textarea class="form-control" rows="3" name='P_CONTENT' style="width: 270px; height: 145px;"></textarea>
          </div>
          <br>
          
<!-- 	  <div class="panel-heading"><strong>제품 이미지</strong></div>
        <div class="form-group uploadDiv">
            <input type="file" name='P_IMG' onchange="setThumbnail(event);">
        </div>
        
        <div id="image_container"></div> -->

<div class="image-container"><strong>제품 이미지</strong></div>
    
    <input style="display: block;" name='P_IMG' type="file" id="input-image">
    
    <img style="width: 500px;" id="preview-image" src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
</div>

      </div>
	<br><br>
	<div>
	<button type="submit" id="btn_submit" class="button" style="color: white; background: orange">등록하기</button></td>
	&nbsp;
	<button type="reset" class="button" style="color: white; background: blue">리셋</button></td>
	</form>
	</div>
</body>
<script type="text/javascript">
function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}

function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

function readImage(input) {
    // 인풋 태그에 파일이 있는 경우
    if(input.files && input.files[0]) {
        // 이미지 파일인지 검사 (생략)
        // FileReader 인스턴스 생성
        const reader = new FileReader()
        // 이미지가 로드가 된 경우
        reader.onload = e => {
            const previewImage = document.getElementById("preview-image")
            previewImage.src = e.target.result
        }
        // reader가 이미지 읽도록 하기
        reader.readAsDataURL(input.files[0])
    }
}
// input file에 change 이벤트 부여
const inputImage = document.getElementById("input-image")
inputImage.addEventListener("change", e => {
    readImage(e.target)
})
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">
var rgx3 = /,/gi; 
$("#btn_submit").click(function(){      
     var temp = document.getElementById("board_price").value.replace(rgx3,"");   
     $("input[name='P_PRICE']").val(temp);         
     frm.submit();  
});
     
</script>
</html>