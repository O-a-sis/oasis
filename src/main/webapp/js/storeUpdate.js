/**
 * 
 */
  var adminStoreService = (function(){


 function update(storeUpdate, callback, error){
 	
 	$.ajax({
 	type : 'post',
 	url : '/Oasis/admin/update',
 	data : JSON.stringify(storeUpdate),
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
 	update:update
 	};
 })();
 
 
 
 