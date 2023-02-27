/**
 * 
 */
 
  var cartService = (function(){
 
 function add(cart, callback, error){
 	
 	$.ajax({
 	type : 'post',
 	url : '/Oasis/member/insertCart.oa',
 	data : JSON.stringify(cart),
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
 
 
 function remove(cart, callback, error){
 	$.ajax({
 		type : 'post',
 		url : '/Oasis/member/cartDelete.oa',
 		data : JSON.stringify(cart),
 		contentType : "application/json; charset=UTF-8",
 		success : function(deleteResult, status, xhr){
 			if(callback){
 				callback(deleteResult);
 			}
 		},
 		error : function (xhr, status, er){
 			if(error){
 				error(er);
 			}
 		}
 	});
 }
 
 function removeAll(cart, callback, error){
 	$.ajax({
 		type : 'post',
 		url : '/Oasis/member/cartDeleteAll.oa',
 		data : JSON.stringify(cart),
 		contentType : "application/json; charset=UTF-8",
 		success : function(deleteResult, status, xhr){
 			if(callback){
 				callback(deleteResult);
 			}
 		},
 		error : function (xhr, status, er){
 			if(error){
 				error(er);
 			}
 		}
 	});
 }
 return {
 	add:add,
 	remove:remove,
 	removeAll:removeAll
 	};
 })();