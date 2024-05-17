$(function(){
	
	largeImg();
	
});


function largeImg(){
	var d1 = document.getElementById("bigImg");
    var d2 = document.getElementById("largeImg");
    var fdj = document.getElementById("fdj");
    var imgB = document.getElementById("imgB");

    d1.onmouseover = function () {
        d2.style.display = "block";
        fdj.style.display = "block";
    }

    d1.onmouseout = function () {
        d2.style.display = "none";
        fdj.style.display = "none";
    }

    d1.onmousemove = function (e) {
        var oEvent = e || window.event;
        var x = oEvent.clientX - d1.offsetLeft - fdj.offsetWidth / 2 - 70;
        if (x < 0) {
            x = 0;
        }
        else if (x > 165){
            x = 155;
        }
        var y = oEvent.clientY - d1.offsetTop - fdj.offsetHeight -120;
        if (y < 0) {
            y = 0;
        }
        else if (y > 165){
            y = 155;
        }
        fdj.style.left = x + "px";
        fdj.style.top = y + "px";
        
        
    	var xx = -x * (imgB.offsetWidth / d1.offsetWidth);
        var yy = -y * (imgB.offsetHeight / d1.offsetHeight);
        imgB.style.top = yy + "px";
        imgB.style.left = xx + "px";
        
    }
}

