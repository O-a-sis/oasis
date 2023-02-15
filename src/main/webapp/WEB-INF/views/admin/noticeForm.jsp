<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
:root { -
	-bgColor: #E56D29; -
	-hoverBg: #D2691E; -
	-text: #;
}

.container {
	width: clamp(0px, 100%, 512px);
	margin: 32px auto;
	text-align: center;
}

.label {
	width: 100%;
	height: 100%;
	margin: 0px auto;
	cursor: pointer;
	background-color: var(- -bgColor);
}

.inner {
	width: 100%;
	height: 128px margin: 64px auto;
	border-radius: 8px;
	font-size: 16px;
	line-height: 128px;
	background-color: var(- -bgColor);
	color: var(- -text);
}

@media ( any-hover : hover) {
	.inner:hover {
		background-color: var(- -hoverBg);
	}
}

.label--hover {
	background-color: var(- -hoverBg);
}

.preview-title {
	font-size: 32px;
	margin-bottom: 8px;
}

.preview {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 16px;
	padding: 16px;
	margin-bottom: 16px;
	border-radius: 8px;
	align-items: center;
	background-color: var(- -bgColor);
}

.embed-img {
	width: 100%;
	height: 128px;
	object-position: center;
	object-fit: cover;
	border-radius: 8px;
}
</style>
</head>
<body>
	<div align="center">
		<h3 align="left">공지사항 작성</h3>
		<hr>
	</div>
	<div>
		<form method="post" action="/Oasis/admin/noticeSave.oa">
		<form method="post" action="/Oasis/admin/noticeSave.oa"
			enctype="multipart/form-data">
			<c:if test="${map.N_IDX ne NULL}">
				<input type="hidden" name="N_IDX" value="${map.N_IDX}">
			</c:if>
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
					<option value="B" ${map.N_TYPE eq 'B' ? 'selected="selected"' : ''}>고객</option>
					<option value="S" ${map.N_TYPE eq 'S' ? 'selected="selected"' : ''}>매장</option>
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
						<div class="image" align="center">
							<main class="container">
								<label class="label" id="label" for="input">
									<div class="inner" id="inner">드래그하거나 클릭해서 업로드</div>
								</label> <input id="input" class="input" accept="image/*" type="file"
									required="true" name="N_IMAGE" multiple="true" hidden="true">
								<p class="preview-title">미리보기</p>
								<div class="preview" id="preview"></div>
							</main>
						</div>
						<button id="uploadBtn">Upload</button>
					</c:when>
					<c:otherwise>
						<div class="uploadDiv">
							<input type=file name="N_IMAGE" multiple>
						<div class="image" align="center">
							<main class="container">
								<label class="label" id="label" for="input">
									<div class="inner" id="inner">드래그하거나 클릭해서 업로드</div>
								</label> <input id="input" class="input" accept="image/*" type="file"
									required="true" name="N_IMAGE" multiple="true" hidden="true">
								<p class="preview-title">미리보기</p>
								<div class="preview" id="preview">
									<img id="preview-image" src="/Oasis/img/${map.N_IMAGE}"
										alt="preview image">
								</div>
							</main>
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
var input = document.getElementById("input");
var initLabel = document.getElementById("label");

input.addEventListener("change", (event) => {
  const files = changeEvent(event);
  handleUpdate(files);
});

initLabel.addEventListener("mouseover", (event) => {
  event.preventDefault();
  const label = document.getElementById("label");
  label?.classList.add("label--hover");
});

initLabel.addEventListener("mouseout", (event) => {
  event.preventDefault();
  const label = document.getElementById("label");
  label?.classList.remove("label--hover");
});

document.addEventListener("dragenter", (event) => {
  event.preventDefault();
  console.log("dragenter");
  if (event.target.className === "inner") {
    event.target.style.background = "#616161";
  }
});

document.addEventListener("dragover", (event) => {
  console.log("dragover");
  event.preventDefault();
});

document.addEventListener("dragleave", (event) => {
  event.preventDefault();
  console.log("dragleave");
  if (event.target.className === "inner") {
    event.target.style.background = "#F5601B";
  }
});

document.addEventListener("drop", (event) => {
  event.preventDefault();
  console.log("drop");
  if (event.target.className === "inner") {
    const files = event.dataTransfer?.files;
    event.target.style.background = "#F5601B";
    handleUpdate([...files]);
  }
});

function changeEvent(event){
  const { target } = event;
  return [...target.files];
};

function handleUpdate(fileList){
  const preview = document.getElementById("preview");

  fileList.forEach((file) => {
    const reader = new FileReader();
    reader.addEventListener("load", (event) => {
      const img = el("img", {
        className: "embed-img",
        src: event.target?.result,
      });
      const imgContainer = el("div", { className: "container-img" }, img);
      preview.append(imgContainer);
    });
    reader.readAsDataURL(file);
  });
};

function el(nodeName, attributes, ...children) {
  const node =
    nodeName === "fragment"
      ? document.createDocumentFragment()
      : document.createElement(nodeName);

  Object.entries(attributes).forEach(([key, value]) => {
    if (key === "events") {
      Object.entries(value).forEach(([type, listener]) => {
        node.addEventListener(type, listener);
      });
    } else if (key in node) {
      try {
        node[key] = value;
      } catch (err) {
        node.setAttribute(key, value);
      }
    } else {
      node.setAttribute(key, value);
    }
  });

  children.forEach((childNode) => {
    if (typeof childNode === "string") {
      node.appendChild(document.createTextNode(childNode));
    } else {
      node.appendChild(childNode);
    }
  });

  return node;
}
</script>
</html>
