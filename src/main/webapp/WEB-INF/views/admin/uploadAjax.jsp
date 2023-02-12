<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv=Contetn-Type content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>UPLOAD WITH AJAX</h1>
	<div>
		<input type="file" name="uploadFile" multiple>
	</div>
	<div class="uploadResult">
		<ul>

		</ul>
	</div>
	<button id="uploadBtn">Upload</button>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>

<script>
	$(document).ready(function() {

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

		var cloneObj = $(".uploadDiv").clone();

		$("#uploadBtn").on("click", function(e) {
			var formData = new FormData();
			var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;
			console.log(files);

			//add file data to formdata
			for (var i = 0; i < files.length; i++) {

				if (!checkExtension(files[i].name, files[i].size)) {
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
			$.ajax({
				url : './uploadAjaxAction',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
				success : function(result) {
					console.log(result);
					showUploadFile(result);
					$(".uploadDiv").html(cloneObj.html());
				}
			}); //$.ajax		
		});

		var uploadResult = $(".uploadResult ul");

		function showUploadFile(uploadResultArr) {

			var str = "";

			$(uploadResultArr).each(function(i, obj) {

				str += "<li>" + obj.fileName + "</li>";

			});

			uploadResult.append(str);
		}

	});
</script>
</html>
