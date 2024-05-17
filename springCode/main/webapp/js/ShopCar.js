$(function(){
	
	$("#addBtn").click(function(){
		var num = Number($("#bknum").val());
		
		 $("#bknum").val(num + 1);
	});
	
	$("#minusBtn").click(function(){
		var num = Number($("#bknum").val());
		if(num>1){
			$("#bknum").val(num - 1);
		}
	});
});
