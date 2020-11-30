"use strict";

function validationChk(){
	if($("#job option:selected").val() == ""){alert("직업을 선택해주세요."); return}	
	else if($("#career").val().trim() == ""){alert("연차(경력)을 입력해주세요."); return}
	else if($("#email").val().trim() == ""){alert("이메일을 입력해주세요."); return}
	else if($("#addr").val().trim() == ""){alert("주소를 입력해주세요."); return}
	
	
	update();
}

function update(){
	param = {
		userNo : userNo	
	  , jobNo : $("#job option:selected").val()
	  , career : $("#career").val()
	  , email : $("#email").val()
	  , addr : $("#addr").val()
	  , intro : $("#intro").val()
	  , skill : $("#skill").val()
	};
	
	console.log(param);
	
	$.ajax({ 
		url : CONTEXT_PATH + "/user/myInfo/update", 
		type: "POST",
		data: param , 
		contentType: "application/x-www-form-urlencoded; charset=UTF-8",  
		success: function(data){
			alert("변경 완료!");
			console.log(data);
			//location.href = CONTEXT_PATH + "/";  
		}, 
		error: function(data){   
		   		console.log("error");
		   		//console.log(data.errmsg);  
		   		//console.log(data.param); 
		} 
	});
}
