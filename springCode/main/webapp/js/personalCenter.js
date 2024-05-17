$(function(){
	$(".content_L>li").click(function(){
		
		$(".content_R>div").eq($(this).index()).addClass("lcActive").siblings().removeClass("lcActive");
	});
});
