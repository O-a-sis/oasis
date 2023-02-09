

var joinService = (function(){
 
 function check(phone, callback, error){
 	
 	$.ajax({
 	type : 'post',
 	url : '/Oasis/user/sms',
 	data : JSON.stringify(phone),
 	contentType : "application/json; charset=UTF-8",
 	success : function(result, status, xhr){
 		if(callback){
 			callback(result);
 		}
 	},
 	error : function(xhr, status, er){
 		if(error){
 			error(er);
 		}
 	 }
  });
 }
 
 
 return {
 	check:check
 	};
 })();