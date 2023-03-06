/**
 * 
 */
 
 var orderService=(function(){
    
	 function get(oidx, callback, error){
	 $.ajax({
	 	type : 'get',
	 	url : '/Oasis/store/order/'+oidx+'.json',
	 	contentType : "application/json; charset=UTF-8",
	 	success : function(order, status, xhr){
	 		if(callback){
	 			callback(order);
	 		}
	 	},
	 	error : function(xhr, status, er){
	 		if(error){
	 			error(er);
	 		}
	 	 }
	  });
	 }
    
	 function updateOrder(ccomment, callback, error){
	 	
	 	$.ajax({
	 	type : 'put',
	 	url : '/Flee/ccomment/update',
	 	data : JSON.stringify(ccomment),
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
	 
	 function updateOrder(order, callback, error){
	 	
	 	$.ajax({
	 	type : 'put',
	 	url : '/Oasis/store/orderUpdate',
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

	 function updateProcessingOrder(order, callback, error){
	 	
	 	$.ajax({
	 	type : 'put',
	 	url : '/Oasis/store/processingOrderUpdate',
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
    	get : get,
    	updateOrder : updateOrder,
    	updateProcessingOrder : updateProcessingOrder
    };
})();