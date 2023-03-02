<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<title>본사-지점관리</title>

<style>
.modal_wrap {
   display: none;
   width: 500px;
   height: 500px;
   position: absolute;
   top: 50%;
   left: 50%;
   margin: -250px 0 0 -250px;
   background: #eee;
   z-index: 2;
}

.black_bg {
   display: none;
   position: absolute;
   content: "";
   width: 100%;
   height: 100%;
   background-color: rgba(0, 0, 0, 0.5);
   top: 0;
   left: 0;
   z-index: 1;
}

.modal_close {
   width: 26px;
   height: 26px;
   position: absolute;
   top: -30px;
   right: 0;
}

.modal_close>a {
   display: block;
   width: 100%;
   height: 100%;
   background: url(https://img.icons8.com/metro/26/000000/close-window.png);
   text-indent: -9999px;
}
</style>
</head>
<body>
	<div>
		<h1 style="display: inline" onclick="location.href='<c:url value="storeList.oa"/>'">오아시스</h1>
		<h3 style="display: inline">본사 관리자</h3>
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
			<strong>회원관리</strong>
		</h2>

	</div>
	<br>
		<div
		style="height: 20px; width: 100%; background-color: #ff6600;">
	</div>
	<br><br>
   <h1>지점매출 TOP3 - 전일기준</h1>
   <table class="board_list" border="1">
      <thead>
         <tr>
            <th scope="col">지점번호</th>
            <th scope="col">지점명</th>
            <th scope="col">지점장명</th>
            <th scope="col">주소</th>
            <th scope="col">전화번호</th>
            <th scope="col">매출액</th>
         
         </tr>
      </thead>
      <tbody>
         <c:choose>
            <c:when test="${fn:length(listRank) > 0}">
               <c:forEach var="item" items="${listRank}">

                  <tr>
                     <td>${item.STORE}</td>
                     <td>${item.S_NAME}</td>
                     <td>${item.S_MANAGER}</td>
                     <td>${item.ADDRESS1}</td>
                     <td>${item.S_PHONE}</td>
                     <td>${item.R_SUM}</td>
                  </tr>

               </c:forEach>
            </c:when>
            <c:otherwise>
               <tr>
                  <td colspan="4">조회된 결과가 없습니다.</td>
               </tr>
            </c:otherwise>
         </c:choose>
      </tbody>
   </table>

   <br>
   <br>
   <br>


    
   <button type='button' id="modal_btn">지점추가</button>
   <div class="black_bg"></div>

   
   
   <br>
   <br>
   <br>
   <h1>지점 관리</h1>
   <table class="board_list" border="1">
      <thead>
         <tr>
            <th scope="col">지점번호</th>
            <th scope="col">지점명</th>
            <th scope="col">지점장명</th>
            <th scope="col">주소</th>
            <th scope="col">전화번호</th>
            <th scope="col">지점폐쇄</th>
            
         </tr>
      </thead>
      <tbody>
         <c:choose>
            <c:when test="${fn:length(list) > 0}">
               <c:forEach var="item" items="${list }">

                  <tr>
                     <td>${item.STORE}</td>
                     <td><a
                        href='<c:url value="/admin/storeDetail.oa?STORE=${item.STORE}"/>'>${item.S_NAME}</a>
                     </td>
                     <td>${item.S_MANAGER}</td>
                     <td>${item.ADDRESS1}</td>
                     <td>${item.S_PHONE}</td>
                     <td><c:choose>
                        <c:when test="${item.DEL_GB eq 'Y' }">폐쇄완료</c:when>
                        <c:otherwise>
                        <a href="/Oasis/admin/storeDown.oa?STORE=${item.STORE}&page=${param.page}">폐쇄하기</a>
                        </c:otherwise>
                        </c:choose>
                     </td>
                  </tr>
               </c:forEach>
            </c:when>
            <c:otherwise>
               <tr>
                  <td colspan="4">조회된 결과가 없습니다.</td>
               </tr>
            </c:otherwise>
         </c:choose>
      </tbody>
         
   </table>
   
   <div class="paging" align="center">${paging.pageHtml}</div>
   

<div id="modal" class="modal_wrap">
<div class="black_bg"></div>
<div class="modal-window">
      <div class="jointit">

      <h4>지점 회원가입</h4>
      <form id="writeForm" class="form-horizontal" method="POST"
                  action="<c:url value='/admin/storeJoin.oa'/>" onSubmit="check()">


         <!-- 지점명 ID -->
         <div class="joinfom">
            <label class="jointit">지점ID</label><br />
            <input class="putfom" type="text" class="form-control" check="0" id="STORE" name="STORE"
               placeholder="ID 입력하세요" readonly
               oninput="checkID()" required>
            <label id="STORELABEL"></label>
         </div>

         <!-- 비밀번호 -->
         <div class="joinfom">
            <label for="jointit">지점PW</label><br />
            <input class="putfom" type="text" class="form-control" id="S_PASSWORD" name="S_PASSWORD"
               placeholder="비밀번호 입력하세요"  required />
            <label id="PASSWORDW"></label>
         </div>

         <!-- 지점 이름 -->
         <div class="joinfom">
            <label>지점명</label><br />
            <input class="putfom" type="text" class="form-control" check="0" id="S_NAME" name="S_NAME"
          placeholder="지점명 입력하세요"
               class="form-control"  oninput="checkName()" required>   
            <label id="NAMEW"></label>
         </div>

         <!-- 지점장 이름 -->
         <div class="joinfom">
            <label>지점장</label><br />
            <input class="putfom" type="text" minlength="2" class="form-control"
               id="S_MANAGER" name="S_MANAGER" placeholder="이름을 입력하세요" required>
            <label id="MANAGERW"></label>
         </div>
         
         <!-- 휴대전화 -->
         <div class="joinfom">
            <label>지점번호</label><br />
            <input class="putfom" type="text" class="form-control"
               id="S_PHONE" name="S_PHONE" placeholder="'-' 없이 번호만 입력해주세요" required>
            <label id="PHONEW"></label>
         </div>
         

         <div class="joinfom">
            <label>주소</label><br />
            <input class="putfomnum" type="text" class="form-control"
               id="sample6_postcode" name="POSTCODE" placeholder="우편번호">
            <input type="button" class="postbtn"
                  onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
            <label   id="ADDRW1"></label>
         </div>

         <div class="joinfom">
            <input class="putfom" type="text" class="form-control"
                  id="sample6_address" name="ADDRESS1" placeholder="주소">
            <input class="putfom" type="text" class="form-control"
                  id="ADDRESS2" name="ADDRESS2" placeholder="상세주소를 입력해주세요"><br>
         </div>
         <p>
         <div class="joinokbtn">
         <button class="jointruebtn" id="reg_submit" onclick="submit_ck(); return false;">
            <i aria-hidden="true"></i>회원가입 완료
         </button>      
         <button type="button" class="close-area">닫기</button>
         
         </form>
      </div>

</div>
</div>

<script   src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="<c:url value='/js/post.js'/>"></script>
<%-- <script type="text/javascript" src="<c:url value='/js/joinForm.js'/>"></script> --%>
<script type="text/javascript" src="<c:url value='/js/common.js'/>"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>


<script>   
function fsubmit(){
      var STORE = $("#STORE")[0].value;
      var S_PASSWORD = $("#S_PASSWORD")[0].value;
      var S_NAME = $("#S_NAME")[0].value;
      var S_MANAGER = $("#S_MANAGER")[0].value;
      var S_PHONE = $("S_PHONE")[0].value;
      
      
      if(STORE==null || STORE==''){
         return false;
      }
      if(S_PASSWORD==null || S_PASSWORD==''){
         return false;
      }
      if(S_NAME==null || S_NAME==''){
         return false;
      }
      if(S_MANAGER==null || S_MANAGER==''){
         return false;
      }
      if(S_PHONE==null || S_PHONE==''){
         return false;
      }      
      JoinForm.submit();
   }

    window.onload = function() {
 
    function onClick() {
        document.querySelector('.modal_wrap').style.display ='block';
        document.querySelector('.black_bg').style.display ='block';
        if ('${fn:length(list)}'==0){
           document.getElementById('STORE').value=10001;
        }else{
           document.getElementById('STORE').value='${list[0].STORE+1}';
        }
    }   
    function offClick() {
        document.querySelector('.modal_wrap').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
        document.getElementById('writeForm').reset();
        document.getElementById('NAMEW').innerText= "";
       
    }
 
    document.getElementById('modal_btn').addEventListener('click', onClick); //지첨 회원가입 모달 창 열기
    document.querySelector('.close-area').addEventListener('click', offClick); //지첨 회원가입 모달 창 닫기



};




/* 지점명 체크 */
 var name = "";

function checkName() {
   var name = $('#S_NAME').val();
   var comAjax = new ComAjax();
   comAjax.setUrl("<c:url value='/admin/confirmName.oa'/>");
   comAjax.setCallback("fn_checkIdCallback");
   comAjax.addParam("name", name);
   comAjax.ajax();
}


function fn_checkIdCallback(data) {
   if (data) {
      $('#NAMEW').text(" 사용중인 지점명");
      $('#NAMEW').css("color", "red");
      $('#NAMEW').css("font-size", "9pt");
      $('#NAMEW').css("font-weight", "bold");
      $('#S_NAME').attr("check", "0");
   } else {
      $('#NAMEW').text(" 사용가능");
      $('#NAMEW').css("color", "green");
      $('#NAMEW').css("font-size", "9pt");
      $('#NAMEW').css("font-weight", "bold");
      $('#S_NAME').attr("check", "1");
   }
}

 

</script>
</body>
</html>