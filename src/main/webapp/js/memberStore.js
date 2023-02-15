/**
 * 
 */
 
 var memberStoreService=(function(){
    
	 function get(store, callback, error){
	 $.ajax({
	 	type : 'get',
	 	url : '/Oasis/memberStore/order/'+store+'.json',
	 	contentType : "application/json; charset=UTF-8",
	 	success : function(store, status, xhr){
	 		if(callback){
	 			callback(store);
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

    };
})();