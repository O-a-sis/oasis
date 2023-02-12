<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div align="center">
		<h3 align="left">공지사항 작성</h3>
		<hr>
	</div>
	<div>
		<form method="post" action="/Oasis/admin/noticeSave.oa">
			<div class="title">
				<h4>제목</h4>
				<c:choose>
					<c:when test="${map.N_TITLE eq NULL}">
						<input type="text" name="N_TITLE">
					</c:when>
					<c:otherwise>
						<input type="text" name="N_TITLE" value="${map.N_TITLE}">
					</c:otherwise>
				</c:choose>
			</div>
			<div class="category">
				카테고리<select name="N_TYPE">
					<option selected value="">구분</option>
					<option value="B" ${map.N_TYPE eq 'B' ? 'selected="selected"' : ''}>구매자</option>
					<option value="S" ${map.N_TYPE eq 'S' ? 'selected="selected"' : ''}>판매자</option>
					<option value="E" ${map.N_TYPE eq 'E' ? 'selected="selected"' : ''}>이벤트</option>
				</select>
			</div>
			<hr>
			<div class="content" align="center">
				<c:choose>
					<c:when test="${map.N_CONTENT eq NUll}">
						<textarea name="N_CONTENT" cols="110" rows="28"></textarea>
					</c:when>
					<c:otherwise>
						<textarea name="N_CONTENT" cols="110" rows="28">${map.N_CONTENT}</textarea>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="image" align="center">
				<c:choose>
					<c:when test="${map.N_IMAGE eq NULL}">
						<div class="uploadDiv">
							<input type=file name="N_IMAGE" multiple>
						</div>
						<button id="uploadBtn">Upload</button>
					</c:when>
					<c:otherwise>
						<div class="uploadDiv">
							<input type=file name="N_IMAGE" multiple>
						</div>
						<button id="uploadBtn">Upload</button>
					</c:otherwise>
				</c:choose>

			</div>
			<div class="btn" align="center">
				<button class="writebtn" type="submit">작성</button>
				<c:if test="${map.N_IDX != NULL}">
					<button class="writebtn" type="button"
						onClick="location.href='noticeDelete.oa'">삭제</button>
				</c:if>
				<button class="cancelbtn" type="button"
					onClick="javascript:history.go(-1);">취소</button>
			</div>
		</form>
	</div>
</body>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

<script>
	$(document).ready(function() {

		$("#uploadBtn").on("click", function(e) {
			var formData = new FormData();
			var inputFile = $("input[name='N_IMAGE']");
			var files = inputFile[0].files;
			console.log(files);

			//add file data to formdata
			for (var i = 0; i < files.length; i++) {
				formData.append("N_IMAGE", files[i]);
			}
			$.ajax({
				url : './noticeSave.oa',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				success : function(result) {
					alert("Uploaded");
				}
			}); //$.ajax		
		});
		
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; //5MB

		function checkExtension(fileName, fileSize) {

			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			return true;
		}
	});
</script>
</html>
