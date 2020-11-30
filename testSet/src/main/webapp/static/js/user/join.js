"use strict";

function openPopup(){
	var pop = window.open(CONTEXT_PATH +"/common/addrPop", 'pop',"width=570,height=420, scrollbars=yes, resizable=yes");  
}    

function checkAddr(){
	if($("#addr").val() == ""){
		alert("주소 없음!"); 
		openPopup();
	} 
} 
 

function changeAddr(){
	sido = $("select[id=sido]").val();
	
	if(sido == ""){
		console.log("sido 없다"); 
		$("select[id=sigun]").val("");
		$("select[id=sigun]").empty();
		$("select[id=sigun]").append("<option value=''>선택</option>");  
	} else {
		$("select[id=sigun]").append("<option value=''>선택</option>");  
		//getSigunguList(); 
		
		var param = {  
    		sdNm : sido
    	}; 
		
		$.ajax({
    		url : CONTEXT_PATH + "/common/sigungu", 
    		type: "POST",
    		data: param,  
    		success: function(data){
    			console.log(param.sdNm + "의 시군구 개수 : " + data.length); 
    			 
    			for(var i = 0; i < data.length; i++){
    				sgList[i] = data[i].sgNm;
	    				 
    				$("#sigun").append("<option value='"+ sgList[i] +"'>" + sgList[i] +"</option>"); 
    			}       
    		},
    		error: function(data){
    			console.log("error");  
    		}
    	}); 
		
		if(sigun != "" && sigun != null){ 
			
		} else {
			$("select[id=sigun]").empty();
			$("select[id=sigun]").val("");  
			console.log("sigun 없다"); 
		}
	}   
	
	if(dong == null){ 
		console.log("dong 없다"); 
	} 
	if(kind == undefined){
		console.log("kind 없다"); 
	}  
	
	console.log(sido + " | " + sigun + " | " + dong + " | " + kind);
}
