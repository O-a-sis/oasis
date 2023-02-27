<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
:root { -
	-bgColor: #3a3a3a; -
	-hoverBg: #616161; -
	-text: #bbb;
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
	grid-template-columns: 500px;
	gap: 16px;
	padding: 16xp;
	margin-bottom: 16px;
	border-radius: 8px;
	align-items: center;
	background-color: var(- -bgColor);
}

.embed-img {
	width: 100%;
	height: 100% object-position: center;
	object-fit: cover;
	border-radius: 8px;
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
<<<<<<< HEAD
	<div align="center">
		<h3 align="left">공지사항 작성</h3>
		<hr>
	</div>
	<div>
		<form method="post" action="/Oasis/admin/noticeSave.oa"
			enctype="multipart/form-data">
			<c:if test="${map.N_IDX ne NULL}">
				<input type="hidden" name="N_IDX" value="${map.N_IDX}">
			</c:if>
			<div class="title">
				<h4>제목</h4>
				<c:choose>
					<c:when test="${map.N_TITLE eq NULL}">
						<input type="text" name="N_TITLE" id="title">
					</c:when>
					<c:otherwise>
						<input type="text" name="N_TITLE" value="${map.N_TITLE}">
					</c:otherwise>
				</c:choose>
			</div>
			<div class="category">
				카테고리<select name="N_TYPE">
					<option selected value="">구분</option>
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
						<div class="image" align="center">
							<main class="container">
								<label class="label" id="label" for="input">
									<div class="inner" id="inner">드래그하거나 클릭해서 업로드</div>
								</label> <input id="input" class="input" accept="image/*" type="file"
									required="true" name="N_IMAGE" hidden="true">
								<p class="preview-title">미리보기</p>
								<div class="preview" id="preview"></div>
							</main>
						</div>
					</c:when>
					<c:otherwise>
						<div class="image" align="center">
							<main class="container">
								<label class="label" id="label" for="input">
									<div class="inner" id="inner">드래그하거나 클릭해서 업로드</div>
								</label> <input id="input" class="input" accept="image/*" type="file"
									required="true" name="N_IMAGE" hidden="true">
								<p class="preview-title">미리보기</p>
								<div class="preview" id="preview">
									<div class="container-img">
										<img class="embed-img" src="/Oasis/img/${map.N_IMAGE}">
									</div>
								</div>
							</main>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="btn" align="center">
				<button class="writebtn" type="submit" id="btnCheck">작성</button>
				<c:if test="${map.N_IDX != NULL}">
					<button class="savebtn" type="button"
						onClick="location.href='noticeDelete.oa?N_IDX=${map.N_IDX}'">삭제</button>
				</c:if>
				<button class="cancelbtn" type="button"
					onClick="javascript:history.go(-1);">취소</button>
			</div>
=======
	<h2>공지사항 상세보기</h2>
	<table border="1" width=600>
		<form method="post" action="/Oasis/admin/noticeWrite.oa">
		<thead>
			<tr>
				<th>구분</th>
				<th>제목</th>
				<th>내용</th>
				<th>이미지</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<input type="hidden" name="N_IDX">
				<td><select name="N_TYPE">
						<option value="B">구매자</option>
						<option value="S">판매자</option>
						<option value="E">이벤트</option>
				</select></td>
				<td><input type="text" name="N_TITLE"></td>
				<td><input type="text" name="N_CONTENT"></td>
				<td><input type="text" name="N_IMAGE"></td>
			</tr>
		</tbody>
		<button class="updatebtn" type="submit">수정</button>
>>>>>>> 1c86325 (Revert "Feature/min j")
		</form>
	</table>
</body>

<script>

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
    event.target.style.background = "#3a3a3a";
  }
});

document.addEventListener("drop", (event) => {
  event.preventDefault();
  console.log("drop");
  if (event.target.className === "inner") {
    const files = event.dataTransfer?.files;
    event.target.style.background = "#3a3a3a";
    input.files = files;
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
<<<<<<< HEAD
=======
      if('${map.N_IMAGE}'==''){
        const imgContainer = el("div", { className: "container-img" }, img);
        preview.append(imgContainer);
      } else {
>>>>>>> 68c7d966264f89e516942bb3c71c787e274d71ba
        const imgTag = document.querySelector('.preview');
        while (imgTag.firstChild) {
          imgTag.removeChild(imgTag.firstChild);
        }
        const imgContainer = el("div", { className: "container-img" }, img);
        preview.append(imgContainer);
<<<<<<< HEAD
=======
      }
>>>>>>> 68c7d966264f89e516942bb3c71c787e274d71ba
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
