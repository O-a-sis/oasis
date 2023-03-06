/**
 * 
 */
 
  var orderService = (function(){
 
 function add(order, callback, error){
 	
 	$.ajax({
 	type : 'post',
 	url : '/Oasis/kakaoPay',
 	data : JSON.stringify(order),
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
 	add:add
 	};
 })();