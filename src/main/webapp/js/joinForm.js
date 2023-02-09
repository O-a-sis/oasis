$(document).ready(function(){
	$('#S_MANAGER').keyup(function(){
		if($(this).val().length==0){
			$('#MANAGERW').text(" 이름 입력");
			$('#MANAGERW').css("color","red");
			$('#MANAGERW').css("font-size","9pt");
			$('#MANAGERW').css("font-weight","bold");		
		}else{		
			$('#MANAGERW').text("");		
		}	
	});
	
	$('#STORE').keyup(function(){
		if($(this).val().length==0){
			$('#STORELABEL').text(" 이메일 아이디 입력");
			$('#STORELABEL').css("color","red");
			$('#STORELABEL').css("font-size","9pt");
			$('#STORELABEL').css("font-weight","bold");		
		}		
	});
	
	$('#S_PASSWORD').keyup(function(){
		if($(this).val().length==0){
			$('#PASSWORDW').text(" 비밀번호 입력");
			$('#PASSWORDW').css("color","red");
			$('#PASSWORDW').css("font-size","9pt");
			$('#PASSWORDW').css("font-weight","bold");		
		}else	{	
			$('#PASSWORDW').text("");
			$(this).attr("check", "1");
		}	
		
		if($(this).val().length>0){
			if(!($(this).val().match(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/))){
				$('#PASSWORDW').text(" 최소 8자 이상 숫자, 문자, 특수문자 각각 1개 이상 포함");
				$('#PASSWORDW').css("color","red");
				$('#PASSWORDW').css("font-size","9pt");
				$('#PASSWORDW').css("font-weight","bold");
				$(this).attr("check", "0");	
			}else{
				$('#PASSWORDW').text("");
			}
		}
	});
	
	$('#S_NAME').keyup(function(){
		if($(this).val().length<2){
			$('#NAMEW').text(" 닉네임 2자 이상 입력");
			$('#NAMEW').css("color","red");
			$('#NAMEW').css("font-size","9pt");
			$('#NAMEW').css("font-weight","bold");		
		}	
	});
	
	$('#sample6_postcode,#sample6_address').keyup(function(){
		if($(this).val().length==0){
			$('#ADDRW1').text(" 주소 입력");
			$('#ADDRW1').css("color","red");
			$('#ADDRW1').css("font-size","9pt");
			$('#ADDRW1').css("font-weight","bold");		
		}else{		
			$('#ADDRW1').text("");		
		}	
	});
	
	$('#S_PHONE').keyup(function(){
		if($(this).val().length==0){
			$('#PHONEW').text(" 번호 입력");
			$('#PHONEW').css("color","red");
			$('#PHONEW').css("font-size","9pt");
			$('#PHONEW').css("font-weight","bold");		
		}else{	
			$('#PHONEW').text("");		
			$('#S_PHONE').attr("check", "1");
		}	
		if($(this).val().length>0){
			if(!($(this).val().match(/^[0-9]*$/))){
				$('#PHONEW').attr("check", "0");
				$('#PHONEW').text(" 숫자만 입력");
				$('#PHONEW').css("color","red");
				$('#PHONEW').css("font-size","9pt");
				$('#PHONEW').css("font-weight","bold");	
			}
		}
	});
});






function submit_ck(){
	if($('#STORE').val().length==0){
		$('#STORELABEL').text("지점아이디 입력");
		$('#STORELABEL').css("color","red");
		$('#STORELABEL').css("font-size","9pt");
		$('#STORELABEL').css("font-weight","bold");
		$('#STORE').focus();
	}else if($('#S_PASSWORD').val().length==0){
		$('#PASSWORDW').text("지점비밀번호 입력");
		$('#PASSWORDW').css("color","red");
		$('#PASSWORDW').css("font-size","9pt");
		$('#PASSWORDW').css("font-weight","bold");
		$('#S_PASSWORD').focus();
	}else if($('#S_NAME').val().length==0){
		$('#NAMEW').text("지점명 입력");
		$('#NAMEW').css("color","red");
		$('#NAMEW').css("font-size","9pt");
		$('#NAMEW').css("font-weight","bold");
		$('#NAMEW').focus();
	}else if($('#S_MANAGER').val().length==0){
		$('#MANAGERW').text("지점장 이름 입력");
		$('#MANAGERW').css("color","red");
		$('#MANAGERW').css("font-size","9pt");
		$('#MANAGERW').css("font-weight","bold");
		$('#S_MANAGER').focus();
	}else if($('#S_PHONE').val().length==0){
		$('#PHONEW').text(" 지점번호 입력");
		$('#PHONEW').css("color","red");
		$('#PHONEW').css("font-size","9pt");
		$('#PHONEW').css("font-weight","bold");
		$('#S_PHONE').focus();
	}else if($('#sample6_postcode').val().length==0 ||$('#sample6_address').val().length==0 ){
		$('#ADDRW1').text(" 지점주소 입력");
		$('#ADDRW1').css("color","red");
		$('#ADDRW1').css("font-size","9pt");
		$('#ADDRW1').css("font-weight","bold");
		$('#sample6_postcode').focus();
	
	}else if($('#STORE').attr("check")=="0"){
		$('#STORE').focus();
	}else if($('#S_PASSWORD').attr("check")=="0"){
		$('#S_PASSWORD').focus();
	}else if($('S_NAME').attr("check")=="0"){
		$('#S_NAME').focus();
	}else if($('#S_PHONE').attr("check")=="0"){
		$('#S_PHONE').focus();
	}else{
		$('#writeForm').submit();
		alert("지점추가완료!");
		}
		
		
		
		
		
}