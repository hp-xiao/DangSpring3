$(function(){
	
	$("#content").layout({
		
	});
	
	$("#classify").accordion({
		multiple:false,
	});
	
	$("#tabs").tabs({
		fit:true,
		border:false,
	});
	
	$("#nav").tree({
		url:"",
		lines:true,
		onClick:function(){
			$("#tabs").tabs("add",{
				title:"123",
				closable:true,
			});
		}
	});
});
