/**
 * 
 */
 
 var orderService=(function(){
 
 	 function getAlarm(store, callback, error){
	 $.ajax({
	 	type : 'get',
	 	url : '/Oasis/store/getAlarm/'+store+'.json',
	 	contentType : "application/json; charset=UTF-8",
	 	success : function(alarm, status, xhr){
	 		if(callback){
	 			callback(alarm);
	 		}
	 	},
	 	error : function(xhr, status, er){
	 		if(error){
	 			error(er);
	 		}
	 	 }
	  });
	 }
    
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
	 
	 function updateStock(stock, callback, error){
	 	
	 	$.ajax({
	 	type : 'put',
	 	url : '/Oasis/store/stockUpdate.oa',
	 	data : JSON.stringify(stock),
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
	 
	 function openRevenue(openRevenue, callback, error){
	 	
	 	$.ajax({
	 	type : 'post',
	 	url : '/Oasis/store/openRevenue.oa',
	 	data : JSON.stringify(openRevenue),
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
	 
	 function closeRevenue(closeRevenue, callback, error){
	 	
	 	$.ajax({
	 	type : 'put',
	 	url : '/Oasis/store/closeRevenue.oa',
	 	data : JSON.stringify(closeRevenue),
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
	
 	 function getTodayCount(today, callback, error){
	 $.ajax({
	 	type : 'get',
	 	url : '/Oasis/store/todayCount/'+today+'.json',
	 	contentType : "application/json; charset=UTF-8",
	 	success : function(count, status, xhr){
	 		if(callback){
	 			callback(count);
	 		}
	 	},
	 	error : function(xhr, status, er){
	 		if(error){
	 			error(er);
	 		}
	 	 }
	  });
	 }

 	 function getTodaySum(today, callback, error){
	 $.ajax({
	 	type : 'get',
	 	url : '/Oasis/store/todaySum/'+today+'.json',
	 	contentType : "application/json; charset=UTF-8",
	 	success : function(sum, status, xhr){
	 		if(callback){
	 			callback(sum);
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
    	getAlarm : getAlarm,
    	get : get,
    	updateOrder : updateOrder,
    	updateProcessingOrder : updateProcessingOrder,
    	updateStock : updateStock,
    	openRevenue : openRevenue,
    	closeRevenue : closeRevenue,
    	getTodayCount : getTodayCount,
    	getTodaySum : getTodaySum
    };
})();/**
 * 
 */
 
 var orderService=(function(){
 
 	 function getAlarm(store, callback, error){
	 $.ajax({
	 	type : 'get',
	 	url : '/Oasis/store/getAlarm/'+store+'.json',
	 	contentType : "application/json; charset=UTF-8",
	 	success : function(alarm, status, xhr){
	 		if(callback){
	 			callback(alarm);
	 		}
	 	},
	 	error : function(xhr, status, er){
	 		if(error){
	 			error(er);
	 		}
	 	 }
	  });
	 }
    
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
	 
	 function updateStock(stock, callback, error){
	 	
	 	$.ajax({
	 	type : 'put',
	 	url : '/Oasis/store/stockUpdate.oa',
	 	data : JSON.stringify(stock),
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
	 
	 function openRevenue(openRevenue, callback, error){
	 	
	 	$.ajax({
	 	type : 'post',
	 	url : '/Oasis/store/openRevenue.oa',
	 	data : JSON.stringify(openRevenue),
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
	 
	 function closeRevenue(closeRevenue, callback, error){
	 	
	 	$.ajax({
	 	type : 'put',
	 	url : '/Oasis/store/closeRevenue.oa',
	 	data : JSON.stringify(closeRevenue),
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
	
 	 function getTodayCount(today, callback, error){
	 $.ajax({
	 	type : 'get',
	 	url : '/Oasis/store/todayCount/'+today+'.json',
	 	contentType : "application/json; charset=UTF-8",
	 	success : function(count, status, xhr){
	 		if(callback){
	 			callback(count);
	 		}
	 	},
	 	error : function(xhr, status, er){
	 		if(error){
	 			error(er);
	 		}
	 	 }
	  });
	 }

 	 function getTodaySum(today, callback, error){
	 $.ajax({
	 	type : 'get',
	 	url : '/Oasis/store/todaySum/'+today+'.json',
	 	contentType : "application/json; charset=UTF-8",
	 	success : function(sum, status, xhr){
	 		if(callback){
	 			callback(sum);
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
    	getAlarm : getAlarm,
    	get : get,
    	updateOrder : updateOrder,
    	updateProcessingOrder : updateProcessingOrder,
    	updateStock : updateStock,
    	openRevenue : openRevenue,
    	closeRevenue : closeRevenue,
    	getTodayCount : getTodayCount,
    	getTodaySum : getTodaySum
    };
})();