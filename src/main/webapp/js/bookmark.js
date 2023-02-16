 
 
 var bookmarkService = (function(){
 
 function add(bookmark, callback, error){
 	
 	$.ajax({
 	type : 'post',
 	url : '/Oasis/member/bookmarkWrite.oa',
 	data : JSON.stringify(bookmark),
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
 
 
 function remove(bookmark, callback, error){
 	$.ajax({
 		type : 'post',
 		url : '/Oasis/member/bookmarkDelete.oa',
 		data : JSON.stringify(bookmark),
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
 	};
 })();
 
 
 
 