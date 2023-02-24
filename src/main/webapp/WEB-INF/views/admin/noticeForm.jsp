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
<script type="text/javascript">
    function validateForm() {
        var title = document.getElementById("title").value;
        var content = document.getElementsByName("N_CONTENT")[0].value;
        var type = document.getElementsByName("N_TYPE")[0].value;

        
        if (title == "") {
            alert("제목을 입력해주세요.");
            return false;
        }
        if (content == "") {
            alert("내용을 입력해주세요.");
            return false;
        }
        if(type==""){
        	alert("카테고리를 선택해주세요.");
        	return false;
        }
        return true;
    }
</script>
</head>
<body>
	<div align="center">
		<h3 align="left">공지사항 작성</h3>
		<hr>
	</div>
	<div>
		<form method="post" action="/Oasis/admin/noticeSave.oa"
			enctype="multipart/form-data" onsubmit="return validateForm()">
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
									name="N_IMAGE" hidden="true">
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
									name="N_IMAGE" hidden="true"> <input type="hidden"
									name="PREV_IMAGE" value="${map.N_IMAGE}">
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
		</form>
	</div>
</body>

<script>

//HTML 문서에서 id가 "input"인 요소와 "label"인 요소를 가져온다.
var input = document.getElementById("input");
var initLabel = document.getElementById("label");

// 파일이 선택되었을 때 실행되는 이벤트 핸들러 등록
input.addEventListener("change", (event) => {
  // 선택된 파일 리스트를 가져온다.
  const files = changeEvent(event);
  // 파일을 처리하는 함수를 호출한다.
  handleUpdate(files);
});

// 레이블 요소 위에 마우스 커서를 올렸을 때 실행되는 이벤트 핸들러 등록
initLabel.addEventListener("mouseover", (event) => {
  event.preventDefault();
  // 레이블 요소에 "label--hover" 클래스를 추가한다.
  const label = document.getElementById("label");
  label?.classList.add("label--hover");
});

// 레이블 요소에서 마우스 커서를 뗐을 때 실행되는 이벤트 핸들러 등록
initLabel.addEventListener("mouseout", (event) => {
  event.preventDefault();
  // 레이블 요소에서 "label--hover" 클래스를 제거한다.
  const label = document.getElementById("label");
  label?.classList.remove("label--hover");
});

// 드래그 앤 드롭 이벤트 관련 이벤트 핸들러 등록
document.addEventListener("dragenter", (event) => {
  event.preventDefault();
  // 드래그 앤 드롭 이벤트가 일어난 대상의 클래스 이름이 "inner"인 경우 배경 색상을 변경한다.
  if (event.target.className === "inner") {
    event.target.style.background = "#616161";
  }
});

document.addEventListener("dragover", (event) => {
  // 드래그 오버 이벤트가 일어날 때 실행되는 이벤트 핸들러
  event.preventDefault();
});

document.addEventListener("dragleave", (event) => {
  event.preventDefault();
  // 드래그 이벤트가 범위를 벗어날 때 실행되는 이벤트 핸들러
  if (event.target.className === "inner") {
    event.target.style.background = "#3a3a3a";
  }
});

document.addEventListener("drop", (event) => {
  event.preventDefault();
  // 드롭 이벤트가 일어난 대상의 클래스 이름이 "inner"인 경우 처리
  if (event.target.className === "inner") {
    // 드롭한 파일 리스트를 가져온다.
    const files = event.dataTransfer?.files;
    // 대상의 배경 색상을 변경한다.
    event.target.style.background = "#3a3a3a";
    // 파일 input 요소에 드롭한 파일 리스트를 설정한다.
    input.files = files;
    console.log(files)
    // 파일을 처리하는 함수를 호출한다.
    handleUpdate([...files]);
  }
});

// input 요소의 change 이벤트에서 실행되는 함수
function changeEvent(event){
  const { target } = event;
  return [...target.files];
};

// 파일 목록을 받아서 HTML 페이지에 이미지로 표시
function handleUpdate(fileList){
  const preview = document.getElementById("preview");

  // 파일 목록을 반복하면서 각 파일에 대해 이미지를 만든다
  fileList.forEach((file) => {
    const reader = new FileReader();

    // 파일이 로드되면, 이미지 데이터로 <img> 요소를 만들고 미리보기 컨테이너에 추가
    reader.addEventListener("load", (event) => {
      const img = el("img", {
        className: "embed-img",
        src: event.target?.result,
      });

      // 미리보기 컨테이너에서 기존 이미지를 제거하고 새 이미지를 추가
      const imgTag = document.querySelector('.preview');
      while (imgTag.firstChild) {
        imgTag.removeChild(imgTag.firstChild);
      }
      const imgContainer = el("div", { className: "container-img" }, img);
      preview.append(imgContainer);
    });

    // 미리보기 컨테이너에서 기존 이미지를 제거하고 새 이미지를 추가
    reader.readAsDataURL(file);
  });
}

// 이것은 속성과 자식 노드가 있는 HTML 요소를 생성하는 데 도움이 되는 함수입니다.
function el(nodeName, attributes, ...children) {
  // 주어진 이름으로 HTML 요소를 만든다
  const node =
    nodeName === "fragment"
      ? document.createDocumentFragment()
      : document.createElement(nodeName);

  // HTML 요소에 속성을 설정한다
  Object.entries(attributes).forEach(([key, value]) => {
    if (key === "events") {
      // 만약 속성이 이벤트 리스너라면, 요소에 추가
      Object.entries(value).forEach(([type, listener]) => {
        node.addEventListener(type, listener);
      });
    } else if (key in node) {
      // 만약 속성이 요소의 속성(property)이라면, 직접 설정한다
      try {
        node[key] = value;
      } catch (err) {
        node.setAttribute(key, value);
      }
    } else {
      // 그렇지 않으면 일반적인 속성으로 설정한다
      node.setAttribute(key, value);
    }
  });

  // HTML 요소에 자식 노드를 추가
  children.forEach((childNode) => {
    if (typeof childNode === "string") {
      node.appendChild(document.createTextNode(childNode));
    } else {
      node.appendChild(childNode);
    }
  });

  // HTML 요소를 반환
  return node;
}
</script>
</html>
