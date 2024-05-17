$(function(){
		
		
		$("#loginBtn").click(function(){
			$("#login").dialog({
				autoOpen:true,
				buttons:{
					"登录":function(){},
				},
				show:true,
				hidden:true,
				modal:true,
				width:400,
				height:300,
				draggable:false,
				resizable:false,
				closeText:"关闭",
			});
		});
		
		$("#regBtn").click(function(){
			$("#reg").dialog({
				title:"用户注册",
				buttons:{
					"注册":function(){},
				},
				show:true,
				hidden:true,
				modal:true,
				width:400,
				height:500,
				draggable:false,
				resizable:false,
				closeText:"关闭",
			});
		});
	
});
