<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>


	
	clear();
	(function getTotalHours() {
	    var totalHours = 0;
	    var ar = document.querySelectorAll("#thumbnail-container #thumbnail " + 
	"#overlays span.style-scope.ytd-thumbnail-overlay-time-status-renderer");
	    
	    var min = 0;
	    var sec = 0;
	    for(var i = 0; i < ar.length; i++) {
	        min = min + parseInt(ar[i].innerText.split(":")[0]);
	        sec = sec + parseInt(ar[i].innerText.split(":")[1]);
	    }
	    totalHours = (min+sec/60)/60;
	    var u = 1/100;
	    totalHours = Math.round(totalHours/u)*u;
	    console.log( "총 재생시간은 " + totalHours +"시간 입니다.");
	})();
	(function getHoursLeft() {
	    var totalHours = 0;
	    var ar = document.querySelectorAll("#thumbnail-container #thumbnail " + 
	"#overlays span.style-scope.ytd-thumbnail-overlay-time-status-renderer");
	    var index = document.querySelector('#publisher-container span.style-scope.yt-formatted-string').innerText;
	    var min = 0, sec = 0;
	    for(var i = index-1; i < ar.length; i++) {
	        min = min + parseInt(ar[i].innerText.split(":")[0]);
	        sec = sec + parseInt(ar[i].innerText.split(":")[1]);
	    }
	    totalHours = (min+sec/60)/60;
	    var u = 1/100;
	    totalHours = Math.round(totalHours/u)*u;
	    console.log( "남은  재생시간은 " + totalHours +"시간 입니다.");
	})();






</script>
</head>
<body>

<div>
	<iframe width="1000" height="600" src="https://www.youtube.com/embed/DFH2NpzgQ2E?rel=0&theme=light&modestbranding=1&showinfo=0" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen ></iframe>
</div>

<div id="player"></div>


</body>
</html>