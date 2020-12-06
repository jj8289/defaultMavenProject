"use strict";

function validationChk(){
	if($("#addr").val() == ""){alert("주소를 입력해주세요."); return}	
	else if($("#email").val().trim() == ""){alert("이메일을 입력해주세요."); return}
	else if($("#busNum").val().trim() == ""){alert("사업자등록번호를 입력해주세요."); return}
	
	update();
}

function update(){
	var no = $("#companyNo").val();
	
	var param = {
		companyNo : no	
	  , addr : $("#addr").val()
	  , email : $("#email").val().trim()
	  , intro : $("#intro").val()
	  , businessNum : $("#busNum").val().trim()
	};
	 
	console.log(param);
	
	$.ajax({ 
		url : CONTEXT_PATH + "/company/myInfo/update", 
		type: "POST",
		data: param , 
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
		success: function(data){
			alert("변경 완료!");
			console.log(data);
			location.href = CONTEXT_PATH + "/";   
		}, 
		error: function(data){   
		   		console.log("error");
		   		//console.log(data.errmsg);  
		   		//console.log(data.param); 
		} 
	});
}
