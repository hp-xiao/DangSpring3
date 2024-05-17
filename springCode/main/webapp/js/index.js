
$(function(){
	
	
	Carousel();
	
	
});

function Carousel(){
	
	var num = 0;
	var stop = setInterval(imgShow,2000);
	
	$("#carousel #left").click(function(){
		clearInterval(stop);
		if(0 < num){
			num = num - 1;
			$("#carousel_img img").eq(num).fadeIn(500).siblings().fadeOut(500);
		}else{
			num = 6;
			$("#carousel_img img").eq(num).fadeIn(500).siblings().fadeOut(500);
		}
		stop = setInterval(imgShow,2000);
	});
	
	$("#carousel #right").click(function(){
		clearInterval(stop);
		if( num <6 ){
			num = num + 1;
			$("#carousel_img img").eq(num).fadeIn(500).siblings().fadeOut(500);
		}else{
			num = 0;
			$("#carousel_img img").eq(num).fadeIn(500).siblings().fadeOut(500);
		}
		stop = setInterval(imgShow,2000);
	});
	
	function imgShow(){
		if(0 <= num <=6 ){
			$("#carousel_img img").eq(num).fadeIn(500).siblings().fadeOut(500);
			num = num + 1;
			if( num > 6 ){ num = 0; }
		}else{
			num = 0;
		}
	}
}


